-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Shiva's Gate
-- @pos 215 -34 20 195 (south at G-8)
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 local state0 = 8;
	 local state1 = 9;
	 local DoorOffset = npc:getID() - 26; -- _5f1
	
 if (player:hasKeyItem(MAGICKED_ASTROLAB)) then	
	if (npc:getAnimation() == 8) then
	 	state0 = 9;
			state1 = 8;
		end
	-- Gates
	-- Shiva's Gate
	GetNPCByID(DoorOffset):setAnimation(state0);
	GetNPCByID(DoorOffset+1):setAnimation(state0);
	GetNPCByID(DoorOffset+2):setAnimation(state0);
	GetNPCByID(DoorOffset+3):setAnimation(state0);
	GetNPCByID(DoorOffset+4):setAnimation(state0);

		return 0;
		end





	if (npc:getAnimation() == 9) then
		player:messageSpecial(SOLID_STONE);
	end
	return 0;
end;
-- 
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;