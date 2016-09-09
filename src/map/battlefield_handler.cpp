/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include <string.h>
#include <algorithm>

#include "ai/states/death_state.h"

#include "alliance.h"

#include "battlefield.h"
#include "battlefield_handler.h"

#include "entities/battleentity.h"
#include "entities/charentity.h"
#include "entities/mobentity.h"

#include "lua/luautils.h"

#include "packets/char_recast.h"
#include "packets/char_skills.h"
#include "packets/message_basic.h"

#include "recast_container.h"
#include "status_effect.h"
#include "status_effect_container.h"

#include "utils/charutils.h"
#include "utils/zoneutils.h"

#include "zone.h"


CBattlefieldHandler::CBattlefieldHandler(CZone* PZone)
{
    m_PZone = PZone;
    m_MaxBattlefields = luautils::OnBattlefieldHandlerInitialise(PZone);
}

void CBattlefieldHandler::HandleBattlefields(time_point tick)
{
    if (m_Battlefields.size())
    {
        // can't std::remove_if in map so i'll ghetto it
        for (auto it = m_Battlefields.begin(); it != m_Battlefields.end();)
        {
            if (it->second->CanCleanup())
                it = m_Battlefields.erase(it);
            else
                ++it;
        }

        // dont want this to run again if we removed a battlefield
        if (m_Battlefields.size())
        {
            for (auto& PBattlefield : m_Battlefields)
            {
                PBattlefield.second->DoTick(server_clock::now());
            }
        }
    }
}

uint8 CBattlefieldHandler::LoadBattlefield(CCharEntity* PChar, uint16 battlefieldID, uint8 area)
{
    if (m_Battlefields.size() < m_MaxBattlefields)
    {
        for (auto&& battlefield : m_Battlefields)
        {
            if (battlefield.first == area)
            {
                return BATTLEFIELD_RETURN_CODE_INCREMENT_REQUEST;
            }
        }

        // we're just checking if the battlefield can be loaded, not actually trying to create one
        // todo: use precheck param instead of this cause it's dirty
        if (battlefieldID == 0xFFFF)
        {
            // made it this far so looks like there's a free battlefield
            return BATTLEFIELD_RETURN_CODE_CUTSCENE;
        }

        const int8* fmtQuery = "SELECT name, battlefieldId, fastestName, fastestTime, timeLimit, levelCap, lootDropId, rules, partySize, zoneId \
						    FROM battlefield_info \
							WHERE battlefieldId = %u";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefieldID);

        if (ret == SQL_ERROR ||
            Sql_NumRows(SqlHandle) == 0 ||
            Sql_NextRow(SqlHandle) != SQL_SUCCESS)
        {
            ShowError("Cannot load battlefield : %u \n", battlefieldID);
            return BATTLEFIELD_RETURN_CODE_REQS_NOT_MET;
        }
        else
        {
            auto name = Sql_GetData(SqlHandle, 0);
            auto recordholder = Sql_GetData(SqlHandle, 2);
            auto recordtime = std::chrono::seconds(Sql_GetUIntData(SqlHandle, 3));
            auto timelimit = std::chrono::seconds(Sql_GetUIntData(SqlHandle, 4));
            auto levelcap = Sql_GetUIntData(SqlHandle, 5);
            auto lootid = Sql_GetUIntData(SqlHandle, 6);
            auto maxplayers = Sql_GetUIntData(SqlHandle, 8);
            auto rulemask = Sql_GetUIntData(SqlHandle, 7);

            auto PBattlefield = std::make_shared<CBattlefield>(battlefieldID, m_PZone, area, PChar);

            PBattlefield->SetName(name);
            PBattlefield->SetRecord(recordholder, recordtime);
            PBattlefield->SetTimeLimit(timelimit);
            PBattlefield->SetLevelCap(levelcap);
            PBattlefield->SetLootID(lootid);
            PBattlefield->SetMaxParticipants(maxplayers);
            PBattlefield->SetRuleMask(rulemask);
            PBattlefield->InsertEntity(PChar, true);

            if (!PBattlefield->LoadMobs())
            {
                PBattlefield->SetStatus(BATTLEFIELD_STATUS_LOST);
                PBattlefield->CanCleanup(true);
                ShowDebug( "battlefield loading failed\n" );
                return BATTLEFIELD_RETURN_CODE_WAIT;
            }
            m_Battlefields.insert(std::make_pair(PBattlefield->GetArea(), PBattlefield));
            return BATTLEFIELD_RETURN_CODE_CUTSCENE;
        }
    }
    return BATTLEFIELD_RETURN_CODE_WAIT;
}

CBattlefield* CBattlefieldHandler::GetBattlefield(CBaseEntity* PEntity)
{
    auto entity = dynamic_cast<CBattleEntity*>(PEntity);
    auto PEffect = entity->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD);

    for (auto& PBattlefield : m_Battlefields)
    {
        if (PBattlefield.second == PEntity->PBattlefield || (PEffect &&
            (PEffect->GetPower() == PBattlefield.second->GetID() && PEffect->GetSubID() == PBattlefield.second->GetInitiator().id)))
            return PBattlefield.second.get();
    }
    return nullptr;
}

uint8 CBattlefieldHandler::RegisterBattlefield(CCharEntity* PChar, uint16 battlefield, uint8 area, uint32 initiator)
{
    // attempt to add to an existing battlefield
    auto PBattlefield = GetBattlefield(PChar);

    // assume relogging, remove entity from battlefield
    if (RemoveFromBattlefield(PChar, PBattlefield))
        return BATTLEFIELD_RETURN_CODE_REQS_NOT_MET;

    // entity wasnt found in battlefield, assume they have the effect but not physically inside battlefield
    if (PBattlefield && PBattlefield->GetID() == battlefield && PBattlefield->GetArea() == area && PBattlefield->GetInitiator().id == initiator)
    {
        if (!PBattlefield->InProgress())
        {
            // players havent started fighting yet, try entering
            return PBattlefield->InsertEntity(PChar, true) ? BATTLEFIELD_RETURN_CODE_CUTSCENE : BATTLEFIELD_RETURN_CODE_BATTLEFIELD_FULL;
        }
        else
        {
            // can't enter, mobs been slapped
            return BATTLEFIELD_RETURN_CODE_LOCKED;
        }
    }
    return LoadBattlefield(PChar, battlefield, area);
}

bool CBattlefieldHandler::RemoveFromBattlefield(CBaseEntity* PEntity, CBattlefield* PBattlefield, uint8 leavecode)
{
    // would only be true for pets and players
    if (!PBattlefield)
    {
        PBattlefield = GetBattlefield(PEntity);
    }

    return PBattlefield ? PBattlefield->RemoveEntity(PEntity, leavecode) : false;
}