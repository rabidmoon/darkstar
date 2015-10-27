-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Odin's Gate
-- @pos 180 -34 55 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

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
	local DoorOffset = npc:getID() - 22; -- _5f1
	
 if (player:hasKeyItem(MAGICKED_ASTROLAB)) then	
	if (npc:getAnimation() == 8) then
		state0 = 9;
		state1 = 8;
	end
	-- Gates
	-- Odin's Gate
	GetNPCByID(DoorOffset+5):setAnimation(state1);
	GetNPCByID(DoorOffset+6):setAnimation(state1);
	GetNPCByID(DoorOffset+7):setAnimation(state1);
	GetNPCByID(DoorOffset+8):setAnimation(state1);
	GetNPCByID(DoorOffset+9):setAnimation(state1);

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