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

#include "../common/showmsg.h"
#include "../common/timer.h"

#include "packets/inventory_finish.h"
#include "packets/treasure_find_item.h"
#include "packets/treasure_lot_item.h"

#include <string.h>

#include "charutils.h"
#include "mobentity.h"
#include "treasure_pool.h"


#define TREASURE_CHECKTIME		  2500		// частота проверки контейнера - 2.5 секунд
#define TREASURE_LIVETIME		300000		// время жизни предметов в контейнере - 5 минут

/************************************************************************
*                                                                       *
*  Инициализация TreasurePool											*
*                                                                       *
************************************************************************/

CTreasurePool::CTreasurePool(TREASUREPOOLTYPE PoolType)
{
    m_Tick  = 0;
    m_count = 0;
	m_TreasurePoolType = PoolType;

	for (uint8 i = 0; i < TREASUREPOOL_SIZE; ++i)
	{
		m_PoolItems[i].ID = 0;
        m_PoolItems[i].SlotID = i;
	}
	members.reserve(PoolType);
	ShowDebug(CL_CYAN"TreasurePool::Create\n"CL_RESET);
}

/************************************************************************
*                                                                       *
*  Узнаем текущий тип контейнера										*
*                                                                       *
************************************************************************/

TREASUREPOOLTYPE CTreasurePool::GetPoolType()
{
	return m_TreasurePoolType;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::AddMember(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	members.push_back(PChar);
	
	if (m_TreasurePoolType == TREASUREPOOL_SOLO && members.size() > 1)
	{
		m_TreasurePoolType = TREASUREPOOL_PARTY;
	}
    ShowDebug(CL_CYAN"TreasurePool::AddMember <%s>\n"CL_RESET, PChar->GetName());
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::DelMember(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	if(m_TreasurePoolType != TREASUREPOOL_ZONE){
		//Zone drops e.g. Dynamis DO NOT remove previous lot info. Everything else does.
		for( int i=0; i<10; i++){
			if(m_PoolItems[i].Lotters.size()>0){
				for(int j=0; j<m_PoolItems[i].Lotters.size(); j++){
					//remove their lot info
					if(PChar->id == m_PoolItems[i].Lotters[j].member->id){
						m_PoolItems[i].Lotters.erase(m_PoolItems[i].Lotters.begin()+j);
					}
				}
			}
		}
	}

	for (uint32 i = 0; i < members.size(); ++i) 
	{
		if (PChar == members.at(i))
		{
			PChar->PTreasurePool = NULL;
			members.erase(members.begin()+i);
			break;
		}
	}
	if (m_TreasurePoolType != TREASUREPOOL_ZONE && members.empty())
	{
		ShowDebug(CL_CYAN"TreasurePool::Delete self <%s>\n"CL_RESET, PChar->GetName());
		delete this;
		return;
	}
    ShowDebug(CL_CYAN"TreasurePool::DelMember <%s>\n"CL_RESET, PChar->GetName());
}

/************************************************************************
*                                                                       *
*  Добавляем предмет в хранилище										*
*                                                                       *
************************************************************************/

uint8 CTreasurePool::AddItem(uint16 ItemID, CMobEntity* PMob)
{	
	uint8  SlotID;
	uint8  FreeSlotID;
	uint32 oldest = -1;
    
	for (SlotID = 0; SlotID < 10; ++SlotID) 
	{	
		if (m_PoolItems[SlotID].ID == 0) 
		{
			FreeSlotID = SlotID;
			break;
		} 
		else 
		{
			if (m_PoolItems[SlotID].TimeStamp < oldest) 
			{
				FreeSlotID = SlotID;
				oldest = m_PoolItems[SlotID].TimeStamp;
			}
		}
	}
	if (SlotID == 10)
	{
		m_PoolItems[FreeSlotID].TimeStamp = 0;
		CheckTreasureItem(gettick(), FreeSlotID);
	}

    m_count++;
    m_PoolItems[FreeSlotID].ID = ItemID;
	m_PoolItems[FreeSlotID].TimeStamp = gettick() - 2500;
	
	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureFindItemPacket(&m_PoolItems[FreeSlotID], PMob));
	}
    if (m_TreasurePoolType == TREASUREPOOL_SOLO)
    {
        CheckTreasureItem(gettick(), FreeSlotID);
    }
	return m_count;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::UpdatePool(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	if (PChar->status != STATUS_DISAPPEAR)
	{
		for (uint8 i = 0; i < TREASUREPOOL_SIZE; ++i) 
		{	
			PChar->pushPacket(new CTreasureFindItemPacket(&m_PoolItems[i], NULL));
		}
		ShowDebug(CL_CYAN"TreasurePool::Update <%s>\n"CL_RESET, PChar->GetName());
	}
}

/************************************************************************
*                                                                       *
*  Персонаж отказывается/голосует за предмет в хранилище				*
*                                                                       *
************************************************************************/

void CTreasurePool::LotItem(CCharEntity* PChar, uint8 SlotID, uint16 Lot)
{
    DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

    if (SlotID >= TREASUREPOOL_SIZE) return;

	LotInfo li;
	li.lot = Lot;
	li.member = PChar;
	bool hasLottedBefore = false;

	if(Lot==0){ //passed mask is FF FF
		Lot = 65535;
		//if this member has lotted on this item previously, set their lot to 0.
		for(int i=0; i<m_PoolItems[SlotID].Lotters.size();i++){
			if(m_PoolItems[SlotID].Lotters[i].member->id == PChar->id){
				m_PoolItems[SlotID].Lotters[i].lot = 0;
				hasLottedBefore = true;
				break;
			}
		}
	}

	if(!hasLottedBefore){
		m_PoolItems[SlotID].Lotters.push_back(li);
	}

	//Player lots Item for XXX message
	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureLotItemPacket(PChar,SlotID,Lot));
	}

	//if all lotters have lotted, evaluate immediately.
	if(m_PoolItems[SlotID].Lotters.size() == members.size()){
		CheckTreasureItem(m_Tick,SlotID);
	}

}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::CheckItems(uint32 tick) 
{	
    if (m_count != 0)
    {
        if ((tick - m_Tick > TREASURE_CHECKTIME))
        {
            for (uint8 i = 0; i < TREASUREPOOL_SIZE; ++i) 
	        {
		        CheckTreasureItem(tick, i);
	        }
            m_Tick = tick;
        }
    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::CheckTreasureItem(uint32 tick, uint8 SlotID) 
{
	if (m_PoolItems[SlotID].ID == 0) return;
    
    if ((tick - m_PoolItems[SlotID].TimeStamp) > TREASURE_LIVETIME ||
        (m_TreasurePoolType == TREASUREPOOL_SOLO && members[0]->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0) ||
		m_PoolItems[SlotID].Lotters.size() == members.size()) 
	{
        if (!m_PoolItems[SlotID].Lotters.empty())
		{
			//give item to highest lotter
			LotInfo highestInfo;
			highestInfo.lot = 0;
			highestInfo.member = NULL;

			for(uint8 i = 0; i < m_PoolItems[SlotID].Lotters.size(); i++){
				LotInfo curInfo = m_PoolItems[SlotID].Lotters[i];
				if(curInfo.lot > highestInfo.lot){
					highestInfo = curInfo;
				}
			}

			//sanity check
			if(highestInfo.member != NULL && highestInfo.lot!=0){
				if(highestInfo.member->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0){
					//add item as they have room!
					if (charutils::AddItem(highestInfo.member, LOC_INVENTORY, m_PoolItems[SlotID].ID, 1, true) != ERROR_SLOTID)
					{
						TreasureWon(highestInfo.member, SlotID);
					} else {
						TreasureError(highestInfo.member, SlotID);
					}
				}
				else{
					//drop the item
					TreasureLost(SlotID);
				}
			}
			else{ //no one has lotted on this item, drop it
				TreasureLost(SlotID);
			}

			//.....
		}
		else
		{
            for (uint8 i = 0; i < members.size(); ++i)
            {
                if (members[i]->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0) 
                {
                    LotInfo lot = { 0, members[i] };
                    m_PoolItems[SlotID].Lotters.push_back(lot);
                }
            }
            if (!m_PoolItems[SlotID].Lotters.empty())
            {
                CCharEntity* PChar = m_PoolItems[SlotID].Lotters.at(rand() % m_PoolItems[SlotID].Lotters.size()).member;

                if (charutils::AddItem(PChar, LOC_INVENTORY, m_PoolItems[SlotID].ID, 1, true) != ERROR_SLOTID)
		        {
                    TreasureWon(PChar, SlotID);
		        } else {
                    TreasureError(PChar, SlotID);
                }
                return;
            }
            TreasureLost(SlotID);
		}
	}	
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::TreasureWon(CCharEntity* winner, uint8 SlotID) 
{
    DSP_DEBUG_BREAK_IF(winner == NULL);
	DSP_DEBUG_BREAK_IF(winner->PTreasurePool != this);
    DSP_DEBUG_BREAK_IF(m_PoolItems[SlotID].ID == 0);

    m_PoolItems[SlotID].TimeStamp = 0;

	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureLotItemPacket(winner, SlotID, 0, ITEMLOT_WIN));
	}
    m_count--;

    m_PoolItems[SlotID].ID = 0;
    m_PoolItems[SlotID].Lotters.clear();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::TreasureError(CCharEntity* winner, uint8 SlotID)
{
    DSP_DEBUG_BREAK_IF(winner == NULL);
	DSP_DEBUG_BREAK_IF(winner->PTreasurePool != this);
    DSP_DEBUG_BREAK_IF(m_PoolItems[SlotID].ID == 0);

    m_PoolItems[SlotID].TimeStamp = 0;

    for (uint32 i = 0; i < members.size(); ++i)
	{
	    members[i]->pushPacket(new CTreasureLotItemPacket(winner, SlotID, -1, ITEMLOT_WINERROR));
    }
    m_count--;

    m_PoolItems[SlotID].ID = 0;
    m_PoolItems[SlotID].Lotters.clear();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTreasurePool::TreasureLost(uint8 SlotID) 
{
    DSP_DEBUG_BREAK_IF(m_PoolItems[SlotID].ID == 0);

    m_PoolItems[SlotID].TimeStamp = 0;

	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureLotItemPacket(SlotID, ITEMLOT_WINERROR));
	}
    m_count--;

    m_PoolItems[SlotID].ID = 0;
    m_PoolItems[SlotID].Lotters.clear();
}
