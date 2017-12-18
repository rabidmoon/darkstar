-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Runic Seal
-- @pos 125 -2 20 72
-----------------------------------

package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-- a, b, c, d, e


-- b. Menu Choices

-- e. Location to be warped to
-- 9: Bhaflau Remnants


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:startEvent(0x199, 0, 10, 0, 0, 9);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
     printf("RESULT: %u",option);
	if (csid == 409) and (option == 524288) then
	-- Add checks for players to ensure they are on the same mission (see pashow [S] waypoint)
    player:killcs(); -- Kills the Cutscene without text
	end
	
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	player:startEvent(0x19b, 9);
    
	if (csid == 411) then
	player:setPos(340,15,-509,147,0x4B);
	end
end;	
	