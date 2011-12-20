/*
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

#ifndef _CAUCTIONHOUSE_H_
#define _CAUCTIONHOUSE_H_

#include "../common/cbasetypes.h"

#include <vector>

typedef struct  
{
    uint16 ItemID;
    uint32 SinglAmount;
    uint32 StackAmount;
} ahItem;

typedef struct
{
    uint32 Price;
    uint32 Data;
    uint8  Name1[15];
    uint8  Name2[15];
} ahHistory;

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CAuctionHouse
{
private:

	uint8 m_AHID;

public:

	CAuctionHouse(uint8 AuctionHouseID);
   ~CAuctionHouse();

    std::vector<ahHistory*> GetItemHystory(uint16 ItemID);
	std::vector<ahItem*>    GetItemsToCategry(uint8 AHCategoryID);
};


#endif
