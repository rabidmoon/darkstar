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

#include "battlefield.h"

#include "../common/timer.h"

#include "ai/ai_container.h"
#include "ai/states/death_state.h"

#include "enmity_container.h"

#include "entities/baseentity.h"
#include "entities/battleentity.h"
#include "entities/charentity.h"
#include "entities/mobentity.h"
#include "entities/npcentity.h"

#include "lua/luautils.h"

#include "packets/entity_animation.h"
#include "packets/entity_update.h"
#include "packets/message_basic.h"
#include "packets/position.h"

#include "status_effect_container.h"
#include "treasure_pool.h"

#include "utils/itemutils.h"
#include "utils/zoneutils.h"
#include "zone.h"

CBattlefield::CBattlefield(uint16 id, CZone* PZone, uint8 area, CCharEntity* PInitiator)
{
    m_ID = id;
    m_ZoneID = PZone->GetID();
    m_Area = area;
    m_Initiator.id = PInitiator->id;
    m_Initiator.name = PInitiator->name;

    m_StartTime = server_clock::now();
    m_Tick = m_StartTime;
}

CBattlefield::~CBattlefield()
{
    for (auto mob : m_RequiredEnemyList)
    {
        if (mob.PMob->isAlive() && mob.PMob->PAI->IsSpawned())
            mob.PMob->Die();

        delete mob.PMob;
    }

    for (auto mob : m_AdditionalEnemyList)
    {
        if (mob.PMob->isAlive() && mob.PMob->PAI->IsSpawned())
            mob.PMob->Die();

        delete mob.PMob;
    }

    for (auto npc : m_NpcList)
    {
        if (npc->PAI->IsSpawned() )
            npc->PAI->Despawn();

        delete npc;
    }
}

uint16 CBattlefield::GetID() const
{
    return m_ID;
}

CZone* CBattlefield::GetZone() const
{
    return zoneutils::GetZone(m_ZoneID);
}

uint16 CBattlefield::GetZoneID() const
{
    return m_ZoneID;
}

string_t CBattlefield::GetName() const
{
    return m_Name;
}

BattlefieldInitiator_t CBattlefield::GetInitiator() const
{
    return m_Initiator;
}

uint8 CBattlefield::GetArea() const
{
    return m_Area;
}

BattlefieldRecord_t CBattlefield::GetRecord() const
{
    return m_Record;
}

uint8 CBattlefield::GetStatus() const
{
    return m_Status;
}

uint16 CBattlefield::GetRuleMask() const
{
    return m_Rules;
}

time_point CBattlefield::GetStartTime() const
{
    return m_StartTime;
}

duration CBattlefield::GetTimeInside() const
{
    return m_Tick - m_StartTime;
}

time_point CBattlefield::GetFightTime() const
{
    return m_FightTick;
}

duration CBattlefield::GetTimeLimit() const
{
    return m_TimeLimit;
}

time_point CBattlefield::GetWipeTime() const
{
    return m_WipeTime;
}

duration CBattlefield::GetFinishTime() const
{
    return m_FinishTime;
}

duration CBattlefield::GetRemainingTime() const
{
    return GetTimeLimit() - GetTimeInside();
}

uint8 CBattlefield::GetMaxParticipants() const
{
    return m_MaxParticipants;
}

uint8 CBattlefield::GetPlayerCount() const
{
    return m_PlayerList.size();
}

uint8 CBattlefield::GetLevelCap() const
{
    return m_LevelCap;
}

uint16 CBattlefield::GetLootID() const
{
    return m_LootID;
}

void CBattlefield::SetName(int8* name)
{
    m_Name.clear();
    m_Name.insert(0, name);
}

void CBattlefield::SetInitiator(int8* name)
{
    m_Initiator.name.clear();
    m_Initiator.name.insert(0, name);
}

void CBattlefield::SetTimeLimit(duration time)
{
    m_TimeLimit = time;
}

void CBattlefield::SetWipeTime(time_point time)
{
    m_WipeTime = time;
}

void CBattlefield::SetArea(uint8 area)
{
    m_Area = area;
}

void CBattlefield::SetRecord(int8* name, duration time)
{
    time = std::chrono::duration_cast<std::chrono::seconds>(time);

    m_Record.name = name ? name : "your mum";
    m_Record.time = time.count() ? time : 3600s;

    const int8* query = "UPDATE battlefield_info SET fastestName = '%s', fastestTime = '%u' WHERE battlefieldId = '%u' AND zoneId = '%u'";
    if (Sql_Query(SqlHandle, query, name, time.count(), this->GetID(), GetZoneID()) == SQL_ERROR)
    {
        ShowError("Battlefield::SetRecord() unable to find battlefield %u \n", this->GetID());
    }
}

void CBattlefield::SetStatus(uint8 status)
{
    m_Status = status;
}

void CBattlefield::SetRuleMask(uint16 rulemask)
{
    m_Rules = rulemask;
}

void CBattlefield::SetMaxParticipants(uint8 max)
{
    m_MaxParticipants = max;
}

void CBattlefield::SetLevelCap(uint8 cap)
{
    m_LevelCap = cap;
}

void CBattlefield::SetLootID(uint16 id)
{
    m_LootID = id;
}

void CBattlefield::ApplyLevelCap(CCharEntity* PChar) const
{
    //adjust player's level to the appropriate cap and remove buffs

    auto cap = GetLevelCap();
    cap += map_config.Battle_cap_tweak;

    if (cap)
    {
        PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH);
        PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEVEL_RESTRICTION, EFFECT_LEVEL_RESTRICTION, cap, 0, 0));
    }
}

void CBattlefield::PushMessageToAllInBcnm(uint16 msg, uint16 param)
{
    // todo: handle this properly
    ForEachPlayer([msg, param](CCharEntity* PChar)
    {
        if (PChar->m_lastBcnmTimePrompt != param)
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, param, 0, msg));
            PChar->m_lastBcnmTimePrompt = param;
        }
    });
}

bool CBattlefield::AllPlayersDead()
{
    ForEachPlayer([](CCharEntity* PChar)
    {
        if (!PChar->PAI->IsCurrentState<CDeathState>())
            return false;
    });
    SetWipeTime(server_clock::now());
    return true;
}

bool CBattlefield::AllEnemiesDefeated()
{
    ForEachRequiredEnemy([](CMobEntity* PMob)
    {
        if (PMob->PAI->IsCurrentState<CDeathState>())
            return false;
    });
    return true;
}

bool CBattlefield::IsOccupied() const
{
    return m_PlayerList.size() > 0;
}

bool CBattlefield::InsertEntity(CBaseEntity* PEntity, bool inBattlefield, BATTLEFIELDMOBCONDITION conditions, bool ally)
{
    DSP_DEBUG_BREAK_IF(PEntity == nullptr);

    if (PEntity->objtype == TYPE_PC)
    {
        if (GetPlayerCount() < GetMaxParticipants())
        {
            ApplyLevelCap(static_cast<CCharEntity*>(PEntity));
            m_PlayerList.push_back(PEntity->id);
        }
        else
        {
            return false;
        }
    }
    else if (PEntity->objtype == TYPE_NPC)
    {
        m_NpcList.push_back(static_cast<CNpcEntity*>(PEntity));
    }
    else if (PEntity->objtype == TYPE_MOB || PEntity->objtype == TYPE_PET)
    {
        // mobs
        if (!ally)
        {
            auto pet = dynamic_cast<CPetEntity*>(PEntity);

            // dont enter player pet
            if (pet && pet->PMaster && pet->PMaster->objtype == TYPE_PC)
            {
            }
            else
            {
                // only apply conditions to mobs spawning by default
                BattlefieldMob_t mob;
                mob.PMob = static_cast<CMobEntity*>(PEntity);
                mob.condition = conditions;

                if (mob.condition & CONDITION_WIN_REQUIREMENT)
                    m_RequiredEnemyList.push_back(mob);
                else
                    m_AdditionalEnemyList.push_back(mob);

                if ( mob.PMob->isAlive() )
                    mob.PMob->Die();
                mob.PMob->Spawn();
            }
        }
        // ally
        else
        {
            m_AllyList.push_back(static_cast<CMobEntity*>(PEntity));
        }
    }

    auto entity = dynamic_cast<CBattleEntity*>(PEntity);

    // set their battlefield to this as they're now physically inside that battlefield
    if( inBattlefield )
        PEntity->PBattlefield = shared_from_this();
    ShowDebug( "refcount %u\n", PEntity->PBattlefield.use_count() );
    // mob, initiator or ally
    if (entity && !entity->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD))
        entity->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BATTLEFIELD, EFFECT_BATTLEFIELD, this->GetID(),
            0, 0, m_Initiator.id, this->GetArea()));

    return true;
}

CBaseEntity* CBattlefield::GetEntity(CBaseEntity* PEntity)
{
    if (PEntity->objtype == TYPE_PC)
        ForEachPlayer([&](CCharEntity* PChar) { if (PChar == PEntity) return PEntity; });
    else if (PEntity->objtype == TYPE_MOB && PEntity->allegiance == ALLEGIANCE_MOB)
        ForEachEnemy([&](CMobEntity* PMob) { if (PMob == PEntity) return PEntity; });
    else if (PEntity->objtype == TYPE_MOB && PEntity->allegiance == ALLEGIANCE_PLAYER)
        ForEachAlly([&](CMobEntity* PAlly) { if (PAlly == PEntity) return PEntity; });
    else if (PEntity->objtype == TYPE_PET && static_cast<CBattleEntity*>(PEntity)->PMaster->objtype == TYPE_PC)
        ForEachPlayer([&](CCharEntity* PChar) { if (PChar == static_cast<CBattleEntity*>(PEntity)->PMaster) return PEntity; });
    else if (PEntity->objtype == TYPE_NPC)
        ForEachNpc([&](CNpcEntity* PNpc) { if (PNpc == PEntity) return PEntity; });

    return nullptr;
}

bool CBattlefield::RemoveEntity(CBaseEntity* PEntity, uint8 leavecode)
{
    // player's already zoned, we dont need to do anything
    if(!PEntity)
        return false;

    auto found = false;
    auto check = [PEntity, &found](auto entity) { if (PEntity == entity) { found = true; return found; } return false; };

    if (PEntity->objtype == TYPE_PC)
    {
        auto check = [PEntity, &found] (auto entity) { if (PEntity->targid == entity) { found = true; return found; } return false; };
        m_PlayerList.erase(std::remove_if(m_PlayerList.begin(), m_PlayerList.end(), check), m_PlayerList.end());

        if (leavecode != 255)
        {
            if (leavecode == 2)
                OpenChest();

            luautils::OnBattlefieldLeave(static_cast<CCharEntity*>(PEntity), this, leavecode);
        }
    }
    else if (PEntity->objtype == TYPE_NPC)
    {
        PEntity->loc.zone->PushPacket(PEntity, CHAR_INRANGE, new CEntityAnimationPacket(PEntity, CEntityAnimationPacket::Fade_Out));
        m_NpcList.erase(std::remove_if(m_NpcList.begin(), m_NpcList.end(), check), m_NpcList.end());
    }
    else if (PEntity->objtype == TYPE_MOB || PEntity->objtype == TYPE_PET)
    {
        // allies targid >= 0x700
        if (PEntity->targid >= 0x700)
        {
            if (static_cast<CPetEntity*>(PEntity)->isAlive() && PEntity->PAI->IsSpawned())
                static_cast<CPetEntity*>(PEntity)->Die();

            m_AllyList.erase(std::remove_if(m_AllyList.begin(), m_AllyList.end(), check), m_AllyList.end());
            GetZone()->DeletePET(PEntity);
            delete PEntity;
            return found;
        }
        else
        {
            auto check = [PEntity, &found](auto entity) { if (entity.PMob == PEntity) { found = true; return found; } return false; };
            m_RequiredEnemyList.erase(std::remove_if(m_RequiredEnemyList.begin(), m_RequiredEnemyList.end(), check), m_RequiredEnemyList.end());
            m_AdditionalEnemyList.erase(std::remove_if(m_AdditionalEnemyList.begin(), m_AdditionalEnemyList.end(), check), m_AdditionalEnemyList.end());
        }
    }
    // assume its either a player or ally and remove any enmity
    if (PEntity->objtype != TYPE_NPC)
    {
        auto entity = static_cast<CBattleEntity*>( PEntity );
        entity->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_CONFRONTATION);
        entity->StatusEffectContainer->DelStatusEffect(EFFECT_LEVEL_RESTRICTION);
        ClearEnmityForEntity(entity);
    }
    PEntity->PBattlefield = nullptr;
    return found;
}

void CBattlefield::DoTick(time_point time)
{
    if (time > m_Tick + 1s)
    {
        //todo : bcnm - update tick, fight tick, end if time is up
        m_Tick = time;
        m_FightTick = m_Status == BATTLEFIELD_STATUS_LOCKED ? time : m_FightTick;

        // remove the char if they zone out
        for (auto charid = m_PlayerList.begin(); charid != m_PlayerList.end();)
        {
            auto PChar = GetZone()->GetCharByID(*charid);

            if (!PChar)
            {
                if (charid != m_PlayerList.end())
                {
                    charid = m_PlayerList.erase(charid);
                    continue;
                }
            }
            else if (PChar->getZone() != GetZoneID())
            {
                RemoveEntity(PChar, -1);
            }
            ++charid;
        }
        luautils::OnBattlefieldTick(this);

        // been here too long, gtfo
        if (GetTimeInside() >= GetTimeLimit())
            CanCleanup(true);

    }
}

bool CBattlefield::CanCleanup(bool cleanup)
{
    if (cleanup)
        m_Cleanup = cleanup;

    return m_Cleanup || m_PlayerList.size() == 0;
}

void CBattlefield::Cleanup()
{
    // wipe enmity from all mobs in list if needed
    ForEachRequiredEnemy([&](CMobEntity* PMob)
    {
        RemoveEntity(PMob);
    });

    ForEachAdditionalEnemy([&](CMobEntity* PMob)
    {
        RemoveEntity(PMob);
    });

    ForEachPlayer([&](CCharEntity* PChar)
    {
        RemoveEntity(PChar, -1);
    });

    ForEachAlly([&](CMobEntity* PAlly)
    {
        RemoveEntity(PAlly);
    });

    //make chest vanish (if any)
    ForEachNpc([&](CNpcEntity* PNpc)
    {
        RemoveEntity(PNpc);
    });

    if (GetStatus() == BATTLEFIELD_STATUS_WON && GetRecord().time > m_FightTick - m_StartTime)
    {
        SetRecord(const_cast<int8*>(m_Initiator.name.c_str()), m_FightTick - m_StartTime);
    }
}

bool CBattlefield::LoadMobs()
{
    //get ids from DB
    auto fmtQuery = "SELECT monsterId, conditions \
						    FROM battlefield_mobs \
							WHERE battlefieldId = %u AND area = %u";

    auto ret = Sql_Query(SqlHandle, fmtQuery, this->GetID(), this->GetArea());

    if (ret == SQL_ERROR ||
        Sql_NumRows(SqlHandle) == 0)
    {
        ShowError("Battlefield::LoadMobs() : Cannot find any monster IDs for battlefield %i area %i \n",
            this->GetID(), this->GetArea());
    }
    else
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            auto mobid = Sql_GetUIntData(SqlHandle, 0);
            auto condition = Sql_GetUIntData(SqlHandle, 1);
            auto PMob = static_cast<CMobEntity*>(zoneutils::GetEntity(mobid, TYPE_MOB | TYPE_PET));

            if (PMob)
            {
                this->InsertEntity(PMob, true, static_cast<BATTLEFIELDMOBCONDITION>(condition));
            }
            else
            {
                ShowDebug("Battlefield::LoadMobs() mob %u not found\n", mobid);
                return false;
            }
        }
    }
    return true;
}

bool CBattlefield::CanSpawnTreasure() const
{
    return !m_SeenBooty;
}

bool CBattlefield::SpawnTreasureChest()
{
    DSP_DEBUG_BREAK_IF(m_SeenBooty);

    //get ids from DB
    auto fmtQuery = "SELECT npcId \
						    FROM battlefield_treasure_chests \
							WHERE battlefieldId = %u AND area = %u";

    auto ret = Sql_Query(SqlHandle, fmtQuery, this->GetID(), this->GetArea());

    if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0)
    {
        ShowError("Battlefield::SpawnTreasureChest() Cannot find any npc IDs for battlefieldId %i area %i \n",
            this->GetID(), this->GetArea());
    }
    else
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            auto npcid = Sql_GetUIntData(SqlHandle, 0);
            auto PNpc = static_cast<CBaseEntity*>(zoneutils::GetEntity(npcid, TYPE_NPC));
            if (PNpc)
            {
                PNpc->Spawn();
                this->InsertEntity(PNpc, true);
            }
            else
            {
                ShowDebug(CL_CYAN"Battlefield::SpawnTreasureChest: <%s> is already spawned\n" CL_RESET, PNpc->GetName());
            }
        }
        m_SeenBooty = true;
        return true;
    }
    return false;
}

void CBattlefield::OpenChest()
{
    DSP_DEBUG_BREAK_IF(m_GotBooty);

    auto LootList = itemutils::GetLootList(GetLootID());

    if (LootList)
    {
        for (auto i = 0; i < LootList->size(); ++i)
        {
            // todo: handle loot
        }
    }
    m_GotBooty = true;
}

void CBattlefield::ClearEnmityForEntity(CBattleEntity* PEntity)
{
    auto func = [&](auto mob) { if (PEntity->PPet) mob->PEnmityContainer->Clear(PEntity->PPet->id);
    mob->PEnmityContainer->Clear(PEntity->id); };

    ForEachRequiredEnemy(func);
    ForEachAdditionalEnemy(func);
}

bool CBattlefield::InProgress()
{
    ForEachEnemy([&](CMobEntity* PMob)
    {
        if (PMob->PEnmityContainer->GetEnmityList()->size())
        {
            if (m_Status == BATTLEFIELD_STATUS_OPEN)
                SetStatus(BATTLEFIELD_STATUS_LOCKED);

            return true;
        }
    });

    // mobs might have 0 enmity but we wont allow anymore players to enter
    return m_Status != BATTLEFIELD_STATUS_OPEN;
}

void CBattlefield::ForEachPlayer(std::function<void(CCharEntity*)> func)
{
    for (auto player : m_PlayerList)
    {
        func(static_cast<CCharEntity*>(GetZone()->GetCharByID(player)));
    }
}

void CBattlefield::ForEachEnemy(std::function<void(CMobEntity*)> func)
{
    ForEachRequiredEnemy(func);
    ForEachAdditionalEnemy(func);
}

void CBattlefield::ForEachRequiredEnemy(std::function<void(CMobEntity*)> func)
{
    for (auto mob : m_RequiredEnemyList)
    {
        func(mob.PMob);
    }
}

void CBattlefield::ForEachAdditionalEnemy(std::function<void(CMobEntity*)> func)
{
    for (auto mob : m_AdditionalEnemyList)
    {
        func(mob.PMob);
    }
}

void CBattlefield::ForEachNpc(std::function<void(CNpcEntity*)> func)
{
    for (auto npc : m_NpcList)
    {
        func(npc);
    }
}

void CBattlefield::ForEachAlly(std::function<void(CMobEntity*)> func)
{
    for (auto ally : m_AllyList)
    {
        func(ally);
    }
}