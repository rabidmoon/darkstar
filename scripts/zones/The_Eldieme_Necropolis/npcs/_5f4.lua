-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Titan's Gate
-- @pos 180 -34 -15 195
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
	local DoorOffset = npc:getID() - 20; -- _5f1
	
 if (player:hasKeyItem(MAGICKED_ASTROLAB)) then	
	if (npc:getAnimation() == 8) then
		state0 = 9;
		state1 = 8;
	end
	-- Gates
	-- Leviathan's Gate
    GetNPCByID(DoorOffset+15):setAnimation(state1);
	GetNPCByID(DoorOffset+16):setAnimation(state1);
	GetNPCByID(DoorOffset+17):setAnimation(state1);
	GetNPCByID(DoorOffset+18):setAnimation(state1);
	GetNPCByID(DoorOffset+19):setAnimation(state1);

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