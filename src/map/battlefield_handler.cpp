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

        for (auto& PBattlefield : m_Battlefields)
        {
            PBattlefield.second->DoTick(server_clock::now());
        }
    }
}

CBattlefield* CBattlefieldHandler::LoadBattlefield(CCharEntity* PChar, uint16 battlefield)
{
    if (m_Battlefields.size() < m_MaxBattlefields)
    {
        auto area = 1;

        if (m_Battlefields.size() && m_Battlefields.find(area) != m_Battlefields.end())
        {
            // there's already a battlefield in use so we'll start see if this area is already in use
            for (auto i = 0; i < m_Battlefields.size(); ++i)
            {
                if (m_Battlefields[i]->GetArea() != area)
                    break;  // started from the bottom now we here
            }
        }

        const int8* fmtQuery = "SELECT name, battlefieldId, fastestName, fastestTime, timeLimit, levelCap, lootDropId, rules, partySize, zoneId \
						    FROM battlefield_info \
							WHERE battlefieldId = %u";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield);

        if (ret == SQL_ERROR ||
            Sql_NumRows(SqlHandle) == 0 ||
            Sql_NextRow(SqlHandle) != SQL_SUCCESS)
        {
            ShowError("Cannot load battlefield : %u \n", battlefield);
            return nullptr;
        }
        else
        {
            auto PEffect = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD);
            auto name = Sql_GetData(SqlHandle, 0);
            auto recordholder = Sql_GetData(SqlHandle, 2);
            auto recordtime = std::chrono::seconds(Sql_GetUIntData(SqlHandle, 3));
            auto timelimit = std::chrono::seconds(Sql_GetUIntData(SqlHandle, 4));
            auto levelcap = Sql_GetUIntData(SqlHandle, 5);
            auto lootid = Sql_GetUIntData(SqlHandle, 6);
            auto maxplayers = Sql_GetUIntData(SqlHandle, 8);
            auto rulemask = Sql_GetUIntData(SqlHandle, 7);

            PEffect->SetSubPower(area);
            std::unique_ptr<CBattlefield> PBattlefield = std::make_unique<CBattlefield>(battlefield, m_PZone, area, PChar);

            PBattlefield->SetName(name);
            PBattlefield->SetRecord(recordholder, recordtime);
            PBattlefield->SetTimeLimit(timelimit);
            PBattlefield->SetLevelCap(levelcap);
            PBattlefield->SetLootID(lootid);
            PBattlefield->SetMaxParticipants(maxplayers);
            PBattlefield->SetRuleMask(rulemask);

            m_Battlefields.insert(std::make_pair(PBattlefield->GetArea(), std::move(PBattlefield)));
            return m_Battlefields.find(area)->second.get();
        }
    }
    return nullptr;
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

CBattlefield* CBattlefieldHandler::RegisterBattlefield(CCharEntity* PChar, uint16 battlefield, uint8 area, uint32 initiator)
{
    bool occupied = false;

    // attempt to add to an existing battlefield
    auto PBattlefield = GetBattlefield(PChar);

    // assume relogging, remove entity from battlefield
    if (RemoveFromBattlefield(PChar, PBattlefield))
        return nullptr;

    // entity wasnt found in battlefield, assume they have the effect but not physically inside battlefield
    if (PBattlefield && PBattlefield->GetID() == battlefield && PBattlefield->GetArea() == area && PBattlefield->GetInitiator().id == initiator)
    {
        if (!PBattlefield->InProgress() && (occupied = PBattlefield->IsOccupied()))
        {
            PBattlefield->InsertEntity(PChar);
            return PBattlefield;
        }
    }

    return occupied ? nullptr : LoadBattlefield(PChar, battlefield);
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