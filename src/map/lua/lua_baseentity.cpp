﻿/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "../../common/showmsg.h"
#include "../../common/utils.h"

#include <math.h>

#include "lua_baseentity.h"
#include "lua_trade_container.h"

#include "../packets/char_abilities.h"
#include "../packets/char_jobs.h"
#include "../packets/char_health.h"
#include "../packets/char_skills.h"
#include "../packets/char_spells.h"
#include "../packets/char_stats.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/entity_update.h"
#include "../packets/event.h"
#include "../packets/event_update.h"
#include "../packets/guild_menu.h"
#include "../packets/inventory_finish.h"
#include "../packets/inventory_modify.h"
#include "../packets/inventory_size.h"
#include "../packets/key_items.h"
#include "../packets/menu_mog.h"
#include "../packets/menu_merit.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/message_special.h"
#include "../packets/message_standard.h"
#include "../packets/message_system.h"
#include "../packets/message_text.h"
#include "../packets/position.h"
#include "../packets/quest_mission_log.h"
#include "../packets/release.h"
#include "../packets/server_ip.h"
#include "../packets/shop_items.h"
#include "../packets/shop_menu.h"

#include "../battleutils.h"
#include "../charutils.h"
#include "../guildutils.h"
#include "../map.h"
#include "../petutils.h"
#include "../spell.h"
#include "../trade_container.h"
#include "../zoneutils.h"


CLuaBaseEntity::CLuaBaseEntity(lua_State* L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PBaseEntity = (CBaseEntity*)lua_touserdata(L,-1);
		lua_pop(L,1);
	}else{
		m_PBaseEntity = NULL;
	}
}

//======================================================//

CLuaBaseEntity::CLuaBaseEntity(CBaseEntity* PEntity)
{
	m_PBaseEntity = PEntity;
}

//======================================================//

inline int32 CLuaBaseEntity::leavegame(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	((CCharEntity*)m_PBaseEntity)->status = STATUS_SHUTDOWN;
	((CCharEntity*)m_PBaseEntity)->pushPacket(new CServerIPPacket((CCharEntity*)m_PBaseEntity,1));

	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::warp(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
	((CCharEntity*)m_PBaseEntity)->loc.prevzone = ((CCharEntity*)m_PBaseEntity)->loc.zone;
	((CCharEntity*)m_PBaseEntity)->loc.p = ((CCharEntity*)m_PBaseEntity)->profile.home_point.p;
	((CCharEntity*)m_PBaseEntity)->loc.zone = ((CCharEntity*)m_PBaseEntity)->profile.home_point.zone;

	((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
	((CCharEntity*)m_PBaseEntity)->animation = ANIMATION_NONE;

	((CCharEntity*)m_PBaseEntity)->clearPacketList();
	((CCharEntity*)m_PBaseEntity)->pushPacket(new CServerIPPacket((CCharEntity*)m_PBaseEntity,2));

	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.hp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addHP(lua_tointeger(L,-1));

	if( result != 0 &&
		m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addHP(-lua_tointeger(L,-1));

	if( result != 0 &&
		m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
		
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::setHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	((CBattleEntity*)m_PBaseEntity)->health.hp = 0;
	((CBattleEntity*)m_PBaseEntity)->addHP(lua_tointeger(L,-1));

	if( m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.mp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	
	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addMP(lua_tointeger(L,-1));

	if( result != 0 &&
		m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addMP(-lua_tointeger(L,-1));

	if( result != 0 &&
		m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::setMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	((CBattleEntity*)m_PBaseEntity)->health.mp = 0;
	((CBattleEntity*)m_PBaseEntity)->addMP(lua_tointeger(L,-1));

	if( m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.tp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(lua_tointeger(L,-1));

	if( result != 0 &&
		m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(-lua_tointeger(L,-1));

	if( result != 0 &&
		m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::setTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	((CBattleEntity*)m_PBaseEntity)->health.tp = 0;
	((CBattleEntity*)m_PBaseEntity)->addTP(lua_tointeger(L,-1));

	if( m_PBaseEntity->objtype == TYPE_PC &&
		m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PBaseEntity));
	}
	
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getMaxHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.maxhp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getMaxMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.maxmp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getXPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushnumber(L, m_PBaseEntity->GetXPos());
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getYPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushnumber( L,  m_PBaseEntity->GetYPos());
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getZPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushnumber(L, m_PBaseEntity->GetZPos());
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getRace(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->look.race );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::setPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
		m_PBaseEntity->loc.p.x = (float) lua_tonumber(L,1);

	if( !lua_isnil(L,2) && lua_isnumber(L,2) )
		m_PBaseEntity->loc.p.y = (float) lua_tonumber(L,2);

	if( !lua_isnil(L,3) && lua_isnumber(L,3) )
		m_PBaseEntity->loc.p.z = (float) lua_tonumber(L,3);

	if( !lua_isnil(L,4) && lua_isnumber(L,4) )
		m_PBaseEntity->loc.p.rotation = (uint8) lua_tointeger(L,4);

	if( m_PBaseEntity->objtype == TYPE_PC)
	{
		if( !lua_isnil(L,5) && lua_isnumber(L,5) )
		{
			((CCharEntity*)m_PBaseEntity)->loc.prevzone = ((CCharEntity*)m_PBaseEntity)->loc.zone;

			((CCharEntity*)m_PBaseEntity)->loc.zone = (uint8)lua_tointeger(L,5);

			((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
			((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
			((CCharEntity*)m_PBaseEntity)->clearPacketList();
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CServerIPPacket((CCharEntity*)m_PBaseEntity,2));
		} else {
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CPositionPacket((CCharEntity*)m_PBaseEntity));
		}
	}

	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	uint16 itemID = (uint16)lua_tointeger(L,1);
	uint32 quantity = 1;

	if( !lua_isnil(L,2) && lua_isnumber(L,2) )
		quantity = (uint32)lua_tointeger(L,2);
				
	uint8 SlotID = charutils::AddItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, itemID, quantity);

	lua_pushboolean( L, (SlotID != 0xFF) );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	uint16 itemID = (uint16)lua_tointeger(L,1);
		
	if( !lua_isnil(L,2) && lua_isnumber(L,2) )
	{
		uint8  locationID = LOC_INVENTORY;

		locationID = (uint8)lua_tointeger(L,2);
		locationID = (locationID < MAX_CONTAINER_ID ? locationID : LOC_INVENTORY);

		uint8 slotID = ((CCharEntity*)m_PBaseEntity)->getStorage(locationID)->SearchItem(itemID);

		lua_pushboolean( L, (slotID != ERROR_SLOTID) );
		return 1;
	}

	for (uint8 LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
	{
		if (((CCharEntity*)m_PBaseEntity)->getStorage(LocID)->SearchItem(itemID) != ERROR_SLOTID)
		{
			lua_pushboolean( L, true );
			return 1;
		}
	}

	lua_pushboolean( L, false );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getFreeSlotsCount(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	uint8  locationID = LOC_INVENTORY;
		
	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
	{
		locationID = (uint8)lua_tointeger(L,1);
		locationID = (locationID < MAX_CONTAINER_ID ? locationID : LOC_INVENTORY);
	}

	uint8 FreeSlots =((CCharEntity*)m_PBaseEntity)->getStorage(locationID)->GetFreeSlotsCount();

	lua_pushinteger( L, FreeSlots );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getZone(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushinteger( L, m_PBaseEntity->getZone() );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getNation(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.nation );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if (logID < MAX_QUESTAREA)
	{
		uint8 current  = PChar->m_questLog[logID].current [questID/8] & (1 << (questID % 8));
		uint8 complete = PChar->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));

		if ((current == 0) && (complete == 0))
		{
			PChar->m_questLog[logID].current [questID/8] |= (1 << (questID % 8));
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 1));
			charutils::SaveQuestsList(PChar);
		}
	}else{
		ShowError(CL_RED"Lua::addQuest: LogID %i is invalid\n"CL_RESET, logID);
	}

	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if (logID < MAX_QUESTAREA)
	{
		uint8 current  = PChar->m_questLog[logID].current [questID/8] & (1 << (questID % 8));
		uint8 complete = PChar->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));

		if ((current != 0) || (complete != 0))
		{
			PChar->m_questLog[logID].current [questID/8] &= ~(1 << (questID % 8));
			PChar->m_questLog[logID].complete[questID/8] &= ~(1 << (questID % 8));

			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 1));
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 2));

			charutils::SaveQuestsList(PChar);
		}
	}else{
		ShowError(CL_RED"Lua::delQuest: LogID %i is invalid\n"CL_RESET, logID);
	}
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getQuestStatus(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if(logID < MAX_QUESTAREA) 
	{
		uint8 current  = ((CCharEntity*)m_PBaseEntity)->m_questLog[logID].current [questID/8] & (1 << (questID % 8));
		uint8 complete = ((CCharEntity*)m_PBaseEntity)->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));
					
		lua_pushinteger( L, (complete != 0 ? 2 : (current != 0 ? 1 : 0)) );
		return 1;
	}else{
		ShowError(CL_RED"Lua::getQuestStatus: LogID %i is invalid\n"CL_RESET, logID);
	}
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::completeQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);
				
	if (logID < MAX_QUESTAREA)
	{
		uint8 complete = PChar->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));

		if (complete == 0)
		{
			PChar->m_questLog[logID].current [questID/8] &= ~(1 << (questID % 8));
			PChar->m_questLog[logID].complete[questID/8] |=  (1 << (questID % 8));

			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 1));
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 2));

			charutils::SaveQuestsList(PChar);
		}
	}else{
		ShowError(CL_RED"Lua::completeQuest: LogID %i is invalid\n"CL_RESET, logID);
	}
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 missionID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if (logID < 6)
	{
		//uint8 current  = PChar->m_missionLog[logID].current = missionID;

		PChar->m_missionLog[logID].current = missionID;
		PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID + 10,1));
		charutils::SaveMissionsList(PChar);
	}
	else
	{
		ShowError(CL_RED"Lua::addMission: LogID %i is invalid\n"CL_RESET, logID);
	}	
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 missionID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if (logID < 6)
	{
		uint8 current  = PChar->m_missionLog[logID].current;
		uint8 complete = PChar->m_missionLog[logID].complete[missionID];

		if (current == missionID)
		{
			PChar->m_missionLog[logID].current = -1; 
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID+10, 1));
		}
		
	

		if (complete != 0) 
		{
			PChar->m_missionLog[logID].complete[missionID/8] &= ~(1 << (missionID % 8)); 
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID+10, 2));
		}
			
			charutils::SaveMissionsList(PChar);
	}
	else
	{
		ShowError(CL_RED"Lua::delMission: LogID %i is invalid\n"CL_RESET, logID);
	}
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasCurrentMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	uint8 logID   = (uint8)lua_tointeger(L,-1);
	uint8 current = PChar->m_missionLog[logID].current;
	if (current < 255) 
	{
		lua_pushboolean(L, true); 
		return 1;
	}
	
	lua_pushboolean( L, false );
	return 1;
} 

inline int32 CLuaBaseEntity::hasCompletedMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 missionID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);
	uint8 complete = PChar->m_missionLog[logID].complete[missionID];
	lua_pushinteger( L, (complete != 0 ? 1 : 0) );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getCurrentMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	uint8 logID   = (uint8)lua_tointeger(L,-1);
	uint8 current = (PChar->m_missionLog[logID].current > -1 ? PChar->m_missionLog[logID].current : -1);

	lua_pushinteger( L, current );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::completeMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	uint8 logID   = (uint8)lua_tointeger(L,-1);

	uint8 current = PChar->m_missionLog[logID].current;
	PChar->m_missionLog[logID].current = -1;
	PChar->m_missionLog[logID].complete[current] = true; 
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID+10, 1));
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID+10, 2));
	
	charutils::SaveMissionsList(PChar);
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	if( charutils::addKeyItem(PChar,KeyItemID) )
	{
		PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

		charutils::SaveKeyItems(PChar);
	}

	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	if( charutils::delKeyItem(PChar,KeyItemID) ) 
	{
		PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

		charutils::SaveKeyItems(PChar);
	}

	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasKeyItem(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

				lua_pushboolean( L, (charutils::hasKeyItem((CCharEntity*)m_PBaseEntity,KeyItemID) == 0 ? false : true));
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Проверяем, было ли описание ключевого предмета прочитано				*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::seenKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
			
	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	lua_pushboolean( L, (charutils::seenKeyItem((CCharEntity*)m_PBaseEntity,KeyItemID) != 0));
	return 1;		
}

/************************************************************************
*																		*
*  Should remove the key item from the seen list						*
*																		*
************************************************************************/


inline int32 CLuaBaseEntity::unseenKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	if( charutils::unseenKeyItem(PChar,KeyItemID) ) 
	{
		PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

		charutils::SaveKeyItems(PChar);
	}

	lua_pushnil(L);
	return 1;
}


//==========================================================//

inline int32 CLuaBaseEntity::addSpell(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

				uint16 SpellID = (uint16)lua_tointeger(L,-1);

				if (charutils::addSpell(PChar,SpellID))
				{
					charutils::SaveSpells(PChar);
					PChar->pushPacket(new CCharSpellsPacket(PChar));
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::canLearnSpell(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint32 Message = 0;
				uint16 SpellID = (uint16)lua_tointeger(L,-1);

				if (charutils::hasSpell((CCharEntity*)m_PBaseEntity,SpellID))
				{
					Message = 96;
				}
				else if (!battleutils::CanUseSpell((CCharEntity*)m_PBaseEntity, SpellID))
				{
					Message = 95;
				}
				lua_pushinteger( L, Message );
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delSpell(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

				uint16 SpellID = (uint16)lua_tointeger(L,-1);

				if (charutils::delSpell(PChar,SpellID)) 
				{
					charutils::SaveSpells(PChar);
					PChar->pushPacket(new CCharSpellsPacket(PChar));
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMainJob(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMJob() );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMainLvl(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMLevel() );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSubJob(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSJob() );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSubLvl(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSLevel() );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Делаем доступной персонажу указанную профессию. 0 - subjob			*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::unlockJob(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

				uint32 JobID = (uint32)lua_tointeger(L,1);

				if (JobID < MAX_JOBTYPE)
				{
					PChar->jobs.unlocked |= (1 << JobID);
					if (PChar->jobs.job[JobID] == 0)
					{
						PChar->jobs.job[JobID] = 1;
					}
					charutils::SaveCharJobs(PChar);
					PChar->pushPacket(new CCharJobsPacket(PChar));
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Устанавливаем/узнаем временное ограничение уровня. Параметр функции	*
*  является новый ограничением уровня, 0 - отмена ограничения уровня.	*
*  Функция всегда возвращается значение текущего/нового ограниченя.		*
*																		*
*  Нужно будет вынести код установки уровня в отдельную функцию			*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::levelRestriction(lua_State* L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
			
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				PChar->m_LevelRestriction = (uint32)lua_tointeger(L,1);

				uint8 NewMLevel = 0;

				if (PChar->m_LevelRestriction != 0 &&
					PChar->m_LevelRestriction < PChar->jobs.job[PChar->GetMJob()])
				{
					NewMLevel = PChar->m_LevelRestriction;
				}else{
					NewMLevel = PChar->jobs.job[PChar->GetMJob()];
				}

				if (PChar->GetMLevel()!= NewMLevel)
				{
					PChar->SetMLevel(NewMLevel);
					PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

					charutils::CalculateStats(PChar);
					charutils::BuildingCharSkillsTable(PChar);
					charutils::CheckValidEquipment(PChar);

					if (PChar->status == STATUS_NORMAL)
					{
						PChar->pushPacket(new CCharJobsPacket(PChar));
						PChar->pushPacket(new CCharUpdatePacket(PChar));
						PChar->pushPacket(new CCharHealthPacket(PChar));
						PChar->pushPacket(new CCharSkillsPacket(PChar));
						PChar->pushPacket(new CCharAbilitiesPacket(PChar));
						PChar->pushPacket(new CMenuMeritPacket(PChar));
						PChar->pushPacket(new CCharSyncPacket(PChar));
					}
				}
			}
			lua_pushinteger( L, PChar->m_LevelRestriction );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::release(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
			
			RELEASE_TYPE releaseType = RELEASE_STANDARD;

			if (PChar->m_event.EventID != -1)
			{
				// Message: Event skipped
				releaseType = RELEASE_SKIPPING;
				PChar->pushPacket(new CMessageSystemPacket(0,0,117));
			}
			PChar->pushPacket(new CReleasePacket(PChar,releaseType));
			PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::startEvent(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			int32 n = lua_gettop(L);

			if ( n > 9 ) 
			{
				ShowError("CLuaBaseEntity::startEvent: Could not start event, Lack of arguments.\n");
				lua_settop(L,-n);
				return 0;
			}

			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				uint16 EventID = (uint16)lua_tointeger(L,1);

				uint32 param0 = 0;
				uint32 param1 = 0;
				uint32 param2 = 0;
				uint32 param3 = 0;
				uint32 param4 = 0;
				uint32 param5 = 0;
				uint32 param6 = 0;
				uint32 param7 = 0;

				if( !lua_isnil(L,2) && lua_isnumber(L,2) )
					param0 = (uint32)lua_tointeger(L,2);
				if( !lua_isnil(L,3) && lua_isnumber(L,3) )
					param1 = (uint32)lua_tointeger(L,3);
				if( !lua_isnil(L,4) && lua_isnumber(L,4) )
					param2 = (uint32)lua_tointeger(L,4);
				if( !lua_isnil(L,5) && lua_isnumber(L,5) )
					param3 = (uint32)lua_tointeger(L,5);
				if( !lua_isnil(L,6) && lua_isnumber(L,6) )
					param4 = (uint32)lua_tointeger(L,6);
				if( !lua_isnil(L,7) && lua_isnumber(L,7) )
					param5 = (uint32)lua_tointeger(L,7);
				if( !lua_isnil(L,8) && lua_isnumber(L,8) )
					param6 = (uint32)lua_tointeger(L,8);
				if( !lua_isnil(L,9) && lua_isnumber(L,9) )
					param7 = (uint32)lua_tointeger(L,9);
		
				((CCharEntity*)m_PBaseEntity)->pushPacket(
					new CEventPacket(
						(CCharEntity*)m_PBaseEntity,
						EventID,
						n-1,
						param0,
						param1,
						param2,
						param3,
						param4,
						param5,
						param6,
						param7)); 

				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::updateEvent(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			int32 n = lua_gettop(L);

			if ( n > 8 ) 
			{
				ShowError("CLuaBaseEntity::updateEvent: Could not update event, Lack of arguments.\n");
				lua_settop(L,-n);
				return 0;
			}
			
			uint32 param0 = 0;
			uint32 param1 = 0;
			uint32 param2 = 0;
			uint32 param3 = 0;
			uint32 param4 = 0;
			uint32 param5 = 0;
			uint32 param6 = 0;
			uint32 param7 = 0;

			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
				param0 = (uint32)lua_tointeger(L,1);
			if( !lua_isnil(L,2) && lua_isnumber(L,2) )
				param1 = (uint32)lua_tointeger(L,2);
			if( !lua_isnil(L,3) && lua_isnumber(L,3) )
				param2 = (uint32)lua_tointeger(L,3);
			if( !lua_isnil(L,4) && lua_isnumber(L,4) )
				param3 = (uint32)lua_tointeger(L,4);
			if( !lua_isnil(L,5) && lua_isnumber(L,5) )
				param4 = (uint32)lua_tointeger(L,5);
			if( !lua_isnil(L,6) && lua_isnumber(L,6) )
				param5 = (uint32)lua_tointeger(L,6);
			if( !lua_isnil(L,7) && lua_isnumber(L,7) )
				param6 = (uint32)lua_tointeger(L,7);
			if( !lua_isnil(L,8) && lua_isnumber(L,8) )
				param7 = (uint32)lua_tointeger(L,8);

			((CCharEntity*)m_PBaseEntity)->pushPacket(
				new CEventUpdatePacket(
					param0,
					param1,
					param2,
					param3,
					param4,
					param5,
					param6,
					param7)); 

			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Отображаем статичный текст от лица NPC								*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::showText(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
			
	uint16 messageID = (uint16)lua_tointeger(L,2);

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

	if(PLuaBaseEntity != NULL)
	{
		CBaseEntity* PBaseEntity = PLuaBaseEntity->GetBaseEntity(); 
		if (PBaseEntity->objtype == TYPE_NPC)
		{
			PBaseEntity->m_TargID = m_PBaseEntity->targid;
			PBaseEntity->loc.p.rotation = getangle(PBaseEntity->loc.p, m_PBaseEntity->loc.p);

			zoneutils::GetZone(PBaseEntity->getZone())->PushPacket(
				PBaseEntity,
				CHAR_INRANGE,
				new CEntityUpdatePacket(PBaseEntity,ENTITY_UPDATE));
		}
		if (!lua_isnil(L,3) && lua_isnumber(L,3))
		{
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSpecialPacket(PBaseEntity, messageID, lua_tointeger(L,3)));
		}
		else
		{
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageTextPacket(PBaseEntity, messageID));
		}
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::sendMenu(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint32 menu = (uint32)lua_tointeger(L, -1);

				switch(menu) 
				{
					case 1:
						((CCharEntity*)m_PBaseEntity)->pushPacket(new CMenuMogPacket());
						break;
					case 2:
						((CCharEntity*)m_PBaseEntity)->pushPacket(new CShopMenuPacket((CCharEntity*)m_PBaseEntity));
						((CCharEntity*)m_PBaseEntity)->pushPacket(new CShopItemsPacket((CCharEntity*)m_PBaseEntity));
						break;
					default:
						ShowDebug("Menu %i not implemented, yet.\n",menu);
					break;
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Отправляем персонажу меню магазина гильдии							*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::sendGuild(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));

	uint16 GuildID = (uint16)lua_tonumber(L,1);
	uint8  open    = (uint8) lua_tonumber(L,2);
	uint8  close   = (uint8) lua_tonumber(L,3);
	uint8  holiday = (uint8) lua_tonumber(L,4);

	DSP_DEBUG_BREAK_IF(open > close);

	uint8 VanadielHour = (uint8)CVanaTime::getInstance()->getHour();
	uint8 VanadielDay  = (uint8)CVanaTime::getInstance()->getWeekday();

	GUILDSTATUS status = GUILD_OPEN;

	if(VanadielDay == holiday) 
	{                               
		status = GUILD_HOLYDAY;
	} 
	else if ((VanadielHour < open) || (VanadielHour >= close)) 
	{
		status = GUILD_CLOSE;
	}

	((CCharEntity*)m_PBaseEntity)->PGuildShop = guildutils::GetGuildShop(GuildID);
	((CCharEntity*)m_PBaseEntity)->pushPacket(new CGuildMenuPacket(status, open, close, holiday));

	lua_pushboolean( L, status == GUILD_OPEN );
	return 1;
}

/************************************************************************
*																		*
*  Получаем временные переменные, необходимые для логики поисков		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getVar(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isstring(L,-1));

	int32 value = 0;

	const int8* varname  = lua_tostring(L, -1); 
	const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,m_PBaseEntity->id, varname);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		value = (int32)Sql_GetIntData(SqlHandle,0); 
	}

	lua_pushinteger(L, value);
	return 1;
}

/************************************************************************
*																		*
*  Сохраняем временные переменные, необходимые для логики поисков		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::setVar(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isstring(L,-2));

	const int8* varname =  lua_tostring(L,-2); 
	int32 value = (int32)lua_tointeger(L,-1); 
			
	if (value == 0)
	{
		Sql_Query(SqlHandle,"DELETE FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;",m_PBaseEntity->id, varname);
		return 0;
	}

	const int8* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = %i;";
	
	Sql_Query(SqlHandle,fmtQuery,m_PBaseEntity->id, varname, value, value);
		
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setHomePoint(lua_State *L) 
{
	if( m_PBaseEntity != NULL )
	{
		if(m_PBaseEntity->objtype == TYPE_PC)
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

			PChar->profile.home_point = PChar->loc;
			
			const int8 *fmtQuery = "UPDATE chars \
									SET home_zone = %u, home_rot = %u, home_x = %.3f, home_y = %.3f, home_z = %.3f \
									WHERE charid = %u;";

			Sql_Query(SqlHandle,fmtQuery, PChar->profile.home_point.zone, PChar->profile.home_point.p.rotation,
				PChar->profile.home_point.p.x, PChar->profile.home_point.p.y, PChar->profile.home_point.p.z, PChar->id);
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::tradeComplete(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if(m_PBaseEntity->objtype == TYPE_PC)
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

			for (uint8 slotID = 0; slotID < TRADE_CONTAINER_SIZE; ++slotID) 
			{
				if(PChar->Container->getInvSlotID(slotID) != 0xFF) 
				{
					uint8 invSlotID = PChar->Container->getInvSlotID(slotID);
					int32 quantity  = PChar->Container->getQuantity(slotID);

					charutils::UpdateItem(PChar, LOC_INVENTORY, invSlotID, -quantity);
				}
			}
			PChar->Container->Clean();
			PChar->pushPacket(new CInventoryFinishPacket());
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getTitle(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			uint16 title = ((CCharEntity*)m_PBaseEntity)->profile.title;
			lua_pushinteger( L, title );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int CLuaBaseEntity::setTitle(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

				uint16 title = (uint16)lua_tointeger(L, -1);

				if (PChar->profile.title != title)
				{
					PChar->profile.title = title;

					Sql_Query(SqlHandle,"UPDATE char_stats SET title = %u WHERE charid = %u;", title, PChar->id);
					Sql_Query(SqlHandle,"INSERT IGNORE INTO char_titles(charid,title) VALUE(%u,%u);", PChar->id, title);

					PChar->pushPacket(new CCharStatsPacket(PChar));
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
		
			if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
			{
				ShowFatalError(CL_RED"lua::getGil : No Gil in currency slot\n"CL_RESET);
				return 0;
			}
			lua_pushinteger( L, item->getQuantity() );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
			
				if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
				{
					ShowFatalError(CL_RED"lua::addGil : No Gil in currency slot\n"CL_RESET);
					return 0;
				}

				int32 gil = (int32)lua_tointeger(L, -1);

				charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
			
				if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
				{
					ShowFatalError(CL_RED"lua::delGil : No Gil in currency slot\n"CL_RESET);
					return 0;
				}

				int32 gil = (int32)lua_tointeger(L, -1);

				charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, -gil);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
			
				if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
				{
					ShowFatalError(CL_RED"lua::setGil : No Gil in currency slot\n"CL_RESET);
					return 0;
				}

				int32 gil = (int32)lua_tointeger(L, -1) - item->getQuantity();

				charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::messageSpecial(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				uint16 messageID = (uint16)lua_tointeger(L,1);

				uint32 param0 = 0;
				uint32 param1 = 0;
				uint32 param2 = 0;
				uint32 param3 = 0;
				
				bool showName = 0;

				if( !lua_isnil(L,2) && lua_isnumber(L,2) )
					param0 = (uint32)lua_tointeger(L,2);
				if( !lua_isnil(L,3) && lua_isnumber(L,3) )
					param1 = (uint32)lua_tointeger(L,3);
				if( !lua_isnil(L,4) && lua_isnumber(L,4) )
					param2 = (uint32)lua_tointeger(L,4);
				if( !lua_isnil(L,5) && lua_isnumber(L,5) )
					param3 = (uint32)lua_tointeger(L,5);

				if( !lua_isnil(L,6) && lua_isboolean(L,6) )
					showName = ( lua_toboolean(L,6) == 0 ? false : true );
		
				((CCharEntity*)m_PBaseEntity)->pushPacket(
					new CMessageSpecialPacket(
						m_PBaseEntity,
						messageID,
						param0,
						param1,
						param2,
						param3,
						showName)); 
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::messageSystem(lua_State* L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				uint16 messageID = (uint16)lua_tointeger(L,1);

				uint32 param0 = 0;
				uint32 param1 = 0;

				if( !lua_isnil(L,2) && lua_isnumber(L,2) )
					param0 = (uint32)lua_tointeger(L,2);
				if( !lua_isnil(L,3) && lua_isnumber(L,3) )
					param1 = (uint32)lua_tointeger(L,3);
		
				((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSystemPacket(param0,param1,messageID));
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::createShop(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			((CCharEntity*)m_PBaseEntity)->Container->Clean();

			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				((CCharEntity*)m_PBaseEntity)->Container->setType((uint8)lua_tointeger(L, -1));
			}
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addShopItem(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if (lua_gettop(L) < 2) 
			{
				ShowDebug("lua:addShopItem : Not enough information for addItem[itemID,price]\n");
				lua_pushnil(L);
				return 1;
			}
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
				!lua_isnil(L,-2) && lua_isnumber(L,-2) )
			{
				uint16 itemID = (uint16)lua_tonumber(L,-2);
				uint32 price  = (uint32)lua_tonumber(L,-1);

				uint8 slotID = ((CCharEntity*)m_PBaseEntity)->Container->getItemsCount();

				if (slotID < 16)
				{
					((CCharEntity*)m_PBaseEntity)->Container->setItem(slotID, itemID, 0, price);
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getFame(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint8  fameArea = (uint8)lua_tointeger(L, -1); 

				CCharEntity * PChar = (CCharEntity*)m_PBaseEntity;
				uint16 fame = 1;

				switch (fameArea) 
				{
					case 0:
					case 1:
					case 2:
					case 3:
						fame = PChar->profile.fame[fameArea];
						break;
					case 4: 
					{   // Selbina / Rabao
						fame = PChar->profile.fame[0] + PChar->profile.fame[1];
						fame = (uint16)( fame / 2 );
					}
						break;
					case 5: 
					{   // Jeuno
						fame = PChar->profile.fame[0] + PChar->profile.fame[1] + PChar->profile.fame[2];
						fame = (uint16)( fame / 3 );
					}
						break;
				}

				lua_pushinteger( L, fame);
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getFameLevel(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			this->getFame(L);

			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint16 fame = (uint16)lua_tointeger(L, -1); 
				
				uint8 fameLevel = 1;

				if (fame >= 2450)
					fameLevel = 9;
				else if (fame >= 2200)
					fameLevel = 8;
				else if (fame >= 1950)
					fameLevel = 7;
				else if (fame >= 1700)
					fameLevel = 6;
				else if (fame >= 1300)
					fameLevel = 5;
				else if (fame >= 900)
					fameLevel = 4;
				else if (fame >= 500)
					fameLevel = 3;
				else if (fame >= 200)
					fameLevel = 2;

				lua_pushinteger(L, fameLevel);
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setFame(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
				!lua_isnil(L,-2) && lua_isnumber(L,-2) )
			{

				uint8  fameArea = (uint8)lua_tointeger(L, -2); 
				uint16 fame     = (uint16)lua_tointeger(L, -1);
				
				switch(fameArea) 
				{
					case 0: 
					case 1: 
					case 2: 
					case 3: 
						((CCharEntity*)m_PBaseEntity)->profile.fame[fameArea] = fame;
					break;
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addFame(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
				!lua_isnil(L,-2) && lua_isnumber(L,-2) )

			{
				uint8  fameArea = (uint8)lua_tointeger(L, -2); 
				uint16 fame     = (uint16)lua_tointeger(L, -1);
				
				switch(fameArea) 
				{
					case 0: 
					case 1: 
					case 2: 
					case 3: 
						((CCharEntity*)m_PBaseEntity)->profile.fame[fameArea] += fame;
					break;
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}	

//==========================================================//

inline int32 CLuaBaseEntity::getAnimation(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		lua_pushinteger(L, m_PBaseEntity->animation);
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setAnimation(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
		{
			uint8 animation = (uint8)lua_tointeger(L, -1);

			if (m_PBaseEntity->animation != animation)
			{
				m_PBaseEntity->animation = animation;

				if (m_PBaseEntity->objtype == TYPE_PC)
				{
					((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
				} else {
					zoneutils::GetZone(m_PBaseEntity->getZone())->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity,ENTITY_UPDATE));
				}
			}
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setStatus(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
		{
			m_PBaseEntity->status = (STATUSTYPE)lua_tointeger(L, -1);
	
			// необходимо обновить сущность, но пока не будем этим заморачиваться
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::sendTractor(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{	
			// недостаточно условий, tractor можно читать только на мертвую цель

			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
				!lua_isnil(L,-2) && lua_isnumber(L,-2) &&
				!lua_isnil(L,-3) && lua_isnumber(L,-3) &&
				!lua_isnil(L,-4) && lua_isnumber(L,-4) )
			{

				if(((CCharEntity*)m_PBaseEntity)->m_hasTractor == 0) {

					((CCharEntity*)m_PBaseEntity)->m_hasTractor = 1;

					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.x = (float)lua_tonumber(L, -1);
					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.y = (float)lua_tonumber(L, -2);
					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.z = (float)lua_tonumber(L, -3);
					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.rotation = (int8)lua_tonumber(L, -4);
			
					((CCharEntity*)m_PBaseEntity)->pushPacket(new CRaiseTractorMenuPacket((CCharEntity*)m_PBaseEntity, TYPE_TRACTOR));	
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::sendRaise(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				if(((CCharEntity*)m_PBaseEntity)->m_hasRaise == 0) 
				{
					uint8 RaiseLevel = (uint8)lua_tonumber(L, -1);

					((CCharEntity*)m_PBaseEntity)->m_hasRaise = RaiseLevel;
					((CCharEntity*)m_PBaseEntity)->pushPacket(new CRaiseTractorMenuPacket((CCharEntity*)m_PBaseEntity, TYPE_RAISE));	
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addStatusEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
				!lua_isnil(L,2) && lua_isnumber(L,2) &&
				!lua_isnil(L,3) && lua_isnumber(L,3) && 
				!lua_isnil(L,4) && lua_isnumber(L,4) )
			{
				int32 n = lua_gettop(L);

				CStatusEffect * PEffect = new CStatusEffect(
					(EFFECT)lua_tointeger(L,1),
					(uint16)lua_tointeger(L,2),
					(uint16)lua_tointeger(L,3),
					(uint16)lua_tointeger(L,4),
					(n >= 5 ? (uint16)lua_tointeger(L,5) : 0),
					(n >= 6 ? (uint16)lua_tointeger(L,6) : 0));

				((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect);

				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasStatusEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				int32 n = lua_gettop(L);

				bool hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffect(
					(EFFECT)lua_tointeger(L,1),
					(n >= 2 ? (uint16)lua_tointeger(L,2) : 0));

				lua_pushboolean(L, hasEffect);
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delStatusEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				int32 n = lua_gettop(L);

				((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(
					(EFFECT)lua_tointeger(L,1), 
					(n >= 2 ? (uint16)lua_tointeger(L,2) : 0));

				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::eraseStatusEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			bool RemoveAll = (!lua_isnil(L,1) && lua_isboolean(L,1) ? lua_toboolean(L,1) != 0 : false);
			lua_pushboolean( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->EraseStatusEffect(RemoveAll));
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::dispelStatusEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			bool RemoveAll = (!lua_isnil(L,1) && lua_isboolean(L,1) ? lua_toboolean(L,1) != 0 : false);
			lua_pushboolean( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DispelStatusEffect(RemoveAll));
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addMod(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
				!lua_isnil(L,2) && lua_isnumber(L,2))
			{
				((CBattleEntity*)m_PBaseEntity)->addModifier(
					lua_tointeger(L,1),
					lua_tointeger(L,2));
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMod(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1))
			{
				lua_pushinteger(L,((CBattleEntity*)m_PBaseEntity)->getMod(lua_tointeger(L,1))); 
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delMod(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
				!lua_isnil(L,2) && lua_isnumber(L,2))
			{
				((CBattleEntity*)m_PBaseEntity)->delModifier(
					lua_tointeger(L,1),
					lua_tointeger(L,2));
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}	

//==========================================================//

inline int32 CLuaBaseEntity::addExp(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				uint16 Exp = (uint16)lua_tointeger(L,1); 
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::showPosition(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageStandardPacket(
				m_PBaseEntity->loc.p.x,
				m_PBaseEntity->loc.p.y,
				m_PBaseEntity->loc.p.z,
				m_PBaseEntity->loc.p.rotation,
				239));
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::injectPacket(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isstring(L,1) )
			{
				uint8 size = 0;
				FILE* File = fopen(lua_tostring(L,1),"rb");

				if (File)
				{
					CBasicPacket * PPacket = new CBasicPacket();
					
					fseek(File,1,SEEK_SET);
					fread(&size,1,1,File);

					if (size <= 128)
					{
						fseek(File,0,SEEK_SET);
						fread(PPacket,1,size*2,File);
						fclose(File);

						((CCharEntity*)m_PBaseEntity)->pushPacket(PPacket);
					}
				}else{
					ShowError(CL_RED"CLuaBaseEntity::injectPacket : Cannot open file\n"CL_RESET);
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Получаем ID экипированного предмета в указанной ячейке				*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getEquipID(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isstring(L,1) )
			{
				uint8 SLOT = (uint8)lua_tointeger(L,1);

				DSP_DEBUG_BREAK_IF(SLOT > 15);

				CItem* PItem = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)m_PBaseEntity)->equip[SLOT]);

				if((PItem != NULL) && (PItem->getType() & ITEM_ARMOR)) 
				{
					lua_pushinteger(L,PItem->getID()); 
					return 1;
				}
				lua_pushinteger(L,0); 
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Сущность призывает питомца											*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::spawnPet(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isstring(L,1) )
			{
				petutils::SpawnPet((CBattleEntity*)m_PBaseEntity, lua_tointeger(L,1));
				return 0;
			}
			ShowError(CL_RED"CLuaBaseEntity::spawnPet : PetID is NULL\n"CL_RESET);
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Сущность освобождает питомца											*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::despawnPet(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			petutils::DespawnPet((CBattleEntity*)m_PBaseEntity);
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Обновляем ненависть монстров к указанной цели (цель,CE,VE)			*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::updateEnmity(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
	
	}
	return 0;
}

/************************************************************************
*																		*
*  Проверяем, покидал ли персонаж зону после поднятия флага				*
*  необходимости ее покинуть. С параметром устанавливаем флаг, без		*
*  параметра узнаем результат.											*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::needToZone(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	if (!lua_isnil(L,-1) && lua_isboolean(L,-1))
	{
		m_PBaseEntity->loc.NeedToZone = lua_toboolean(L,-1);				
		return 0;
	}
	lua_pushboolean( L, m_PBaseEntity->loc.NeedToZone );
	return 1;
}

/************************************************************************
*																		*
*	Get Container Size												*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getContainerSize(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	
	if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,1) && lua_isnumber(L,1))
			{
				CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
				uint8 size = PChar->getStorage(lua_tointeger(L,1))->GetSize() -1;
				lua_pushinteger(L,size);
				return 1;
			}
	}
	
}
	

/************************************************************************
*																		*
*	Increase Container Size												*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::increaseContainerSize(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	
	if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
				!lua_isnil(L,2) && lua_isnumber(L,2))
			{
				CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
				uint8 size = PChar->getStorage(lua_tointeger(L,1))->GetSize();
				PChar->getStorage(lua_tointeger(L,1))->SetSize(size - 1 + lua_tointeger(L,2));
				PChar->pushPacket(new CInventorySizePacket(PChar));
				charutils::SaveCharInventoryCapacity(PChar);
				return 0;
			}
	}
	lua_pushnil(L);
}
	
/************************************************************************
*																		*
*	Decrease Container Size												*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::decreaseContainerSize(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	
		if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
				!lua_isnil(L,2) && lua_isnumber(L,2))
			{
				CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
				uint8 size = PChar->getStorage(lua_tointeger(L,1))->GetSize();
				PChar->getStorage(lua_tointeger(L,1))->SetSize(size - 1 - lua_tointeger(L,2));
				//CInventorySizePacket::CInventorySizePacket
				PChar->pushPacket(new CInventorySizePacket(PChar));
				charutils::SaveCharInventoryCapacity(PChar);
				return 0;
			}
	}
	lua_pushnil(L);
}

//==========================================================//

const int8 CLuaBaseEntity::className[] = "CBaseEntity";
Lunar<CLuaBaseEntity>::Register_t CLuaBaseEntity::methods[] = 
{
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,warp),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,leavegame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getHP),				
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaxHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaxMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFreeSlotsCount),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getXPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getYPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZone),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRace),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNation),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addQuest),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delQuest),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getQuestStatus),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,completeQuest),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrentMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCurrentMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCompletedMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,completeMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,seenKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,unseenKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addSpell),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,canLearnSpell),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delSpell),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMainJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMainLvl),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSubJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSubLvl),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,unlockJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,levelRestriction),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getVar),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setVar),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,release),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,startEvent),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEvent),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,showText),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageSpecial),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageSystem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendMenu),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendGuild),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setHomePoint),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,tradeComplete),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTitle),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setTitle),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addExp),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,createShop),		
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addShopItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setFame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addFame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFameLevel),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAnimation),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setAnimation),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setStatus),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendRaise),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendTractor),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,eraseStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,dispelStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMod),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMod),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMod),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,injectPacket),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,showPosition),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmity),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEquipID),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,spawnPet),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,despawnPet),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,needToZone),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getContainerSize),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,increaseContainerSize),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,decreaseContainerSize),
	{NULL,NULL}
};