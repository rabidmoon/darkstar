﻿/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#ifndef _CENTITYUPDATEPACKET_H
#define _CENTITYUPDATEPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

enum MODELTYPE
{
	MODEL_STANDARD	= 0,
	MODEL_EQUIPED	= 1,
	MODEL_DOOR		= 2,
	MODEL_ELEVATOR	= 3,
	MODEL_SHIP		= 4,
	MODEL_UNK_5		= 5,
	MODEL_UNK_6		= 6		// все куклы входят в эту категорию. но помимо них есть еще и некоторые монстры
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CBaseEntity;

class CEntityUpdatePacket: public CBasicPacket
{
public:

	CEntityUpdatePacket(CBaseEntity* PEntity, ENTITYUPDATE type);
};

#endif