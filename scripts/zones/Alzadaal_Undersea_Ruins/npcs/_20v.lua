-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Runic Seal Zhayolm Remnants
-- @pos -579 0 -404 72
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
-- Enter Text = 411,x

-- x = 7 Zhayolm
-- x = 8 Arrapago
-- x = 9 Bhaflau
-- x = 10 SIlver sea



-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x197, 0, 10, 0, 0, 7);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	if (csid == 407) and (option == 524288) then
	  --player:updateEvent(405,3,3,3,3,3,3,3)
	    player:killcs();
	end
	
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
  	local party = player:getParty();  
	if (csid == 407) then
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
				k:startEvent(0x19b, 7);
	            k:setPos(339,0,-578,194,0x49);
		    end
			
		else
		    printf("No item");
		    player:messageSpecial(MEMBER_NO_REQS);
		end
	end
end;	
	