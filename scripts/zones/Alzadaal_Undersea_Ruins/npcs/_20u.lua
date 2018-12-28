-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Arrapago)
-- !pos -580 0 -159 72
-----------------------------------

package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x198, 0, 10, 0, 0, 8);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
	if (csid == 408) and (option == 524288) then
	  --player:updateEvent(405,3,3,3,3,3,3,3)
	    player:killcs();
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
  	local party = player:getParty();  
	if (csid == 408) then
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
				k:startEvent(0x19b, 8);
	            k:setPos(340,0,-270,194,0x4A);
		    end
			
		else
		    printf("No item");
		    player:messageSpecial(MEMBER_NO_REQS);
		end
	end
end;

