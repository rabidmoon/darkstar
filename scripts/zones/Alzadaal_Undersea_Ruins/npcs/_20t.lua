-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Runic Seal Silver Sea
-- @pos 580 0 440 72
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
	player:startEvent(0x19a, 0, 10, 0, 0, 10);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	if (csid == 410) and (option == 524288) then
	-- Add checks for players to ensure they are on the same mission (see pashow [S] waypoint)
    player:killcs(); -- Kills the Cutscene without text
	end
	
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
  	local party = player:getParty();  
	if (csid == 410) then
		if (player:hasKeyItem(REMNANTS_PERMIT)) then
		    printf("PLAYER HAS KEY ITEM!!!!");
			if (party ~= nil) then
				for i,v in ipairs(party) do
					if (v:hasKeyItem(REMNANTS_PERMIT) == false) then
						player:messageSpecial(MEMBER_NO_REQS);
						return
					elseif v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50 then
						player:messageSpecial(MEMBER_TOO_FAR);
						return
					end
				end
			end
		    for i,k in ipairs(party) do
	            k:delKeyItem(REMNANTS_PERMIT);
				k:setVar("Salvage_Level",35);
				k:setVar("Salvage_Entry",os.time());	
				k:startEvent(0x19b, 10);
	            k:setPos(339,16,-189,62,0x4C);
		    end
			
		else
		    printf("No item");
		    player:messageSpecial(MEMBER_NO_REQS);
		end
	end
end;	
	