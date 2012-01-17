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

#include "lua_spell.h"


/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaSpell::CLuaSpell(lua_State *L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PLuaSpell = (CSpell*)(lua_touserdata(L,-1));
		lua_pop(L,1);
	}else{
		m_PLuaSpell = NULL;
	}
}

/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaSpell::CLuaSpell(CSpell* PSpell)
{
	m_PLuaSpell = PSpell;
}

/************************************************************************
*                                                                       *
*  Устанавливаем сообщение заклинания                                   *
*                                                                       *
************************************************************************/

inline int32 CLuaSpell::setMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL); 
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    m_PLuaSpell->setMessage(lua_tointeger(L,-1));
	return 0;
}

/************************************************************************
*																		*
*  Инициализация методов в lua											*
*																		*
************************************************************************/

const int8 CLuaSpell::className[] = "CSpell";
Lunar<CLuaSpell>::Register_t CLuaSpell::methods[] = 
{
    LUNAR_DECLARE_METHOD(CLuaSpell,setMsg),
	{NULL,NULL}
}; 