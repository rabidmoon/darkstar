-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Merc Dealer
-- Allows players to buy ??? items if they are at the correct Merc Level
-- @pos 5.195 -1 98.966 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/keyitems");
local Besieged = require("scripts/zones/Aht_Urhgan_Whitegate/IDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
  
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:PrintToPlayer("Mercenary Dealer : I've got questionable items, if you are at the correct rank.  Let me check your status...",0xD);	
	if (player:hasKeyItem(CAPTAIN_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet 
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000,	-- ??? cloth			 
	             0x0893,50000,	-- ??? Hands
	             0x08EE,75000,	-- ??? Box
			     0x08E4,100000}   -- ??? headwear
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Captain %s", player:getName()),0xD); 
        showShop(player, STATIC, stock);  
    elseif (player:hasKeyItem(SL_WILDCAT_BADGE) == true) then	
        stock = {0x0894,10000,	-- ??? Feet 
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000,	-- ??? cloth			 
	             0x0893,50000,	-- ??? Hands
	             0x08EE,75000}	-- ??? Box
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Second Lieutenant %s", player:getName()),0xD); 
        showShop(player, STATIC, stock);  	
    elseif (player:hasKeyItem(SM_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet 
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000,	-- ??? cloth			 
	             0x0893,50000}	-- ??? Hands
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Sergeant Major %s", player:getName()),0xD); 
        showShop(player, STATIC, stock);  	
    elseif (player:hasKeyItem(C_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet 
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000}	-- ??? cloth			 
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Corporal %s", player:getName()),0xD); 
        showShop(player, STATIC, stock);  	
    elseif (player:hasKeyItem(SP_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000}	-- ??? Feet 			 
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Superior Private %s", player:getName()),0xD); 
        showShop(player, STATIC, stock); 	
	else
	    player:PrintToPlayer(string.format("Mercenary Dealer : Sorry %s, but you will need a Superior Private rank or higher to access my wares.", player:getName()),0xD); 
	end
	
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	
	
end;