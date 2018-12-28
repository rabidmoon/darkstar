-----------------------------------
-- Area: Hazhalm Testing Grounds
--  NPC: Entry Gate (TOAU-36)
-- pos@ 488 -226 -19
-----------------------------------
local ID = require("scripts/zones/Hazhalm_Testing_Grounds/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;



function onTrigger(player,npc)
	if (player:getVar("ZAZARG_CIPHER") == 1) then
	    local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getZoneID() == player:getZoneID() then
                    v:setVar("ZAZARG_Fight",1);
					printf("party triggered");
				    v:setPos(432,-215,27,133,78) 
                end
           end
        end
		player:setVar("ZAZARG_CIPHER",0);
	elseif (player:getCurrentMission(TOAU) == GAZE_OF_THE_SABOTEUR and player:getVar("AhtUrganStatus") == 1) then
        -- player:startEvent(7);
    end
end;	



function onEventUpdate(player,csid,option)

end;

function onEventFinish(player,csid,option)

    if (csid == 7) then
        player:completeMission(TOAU,GAZE_OF_THE_SABOTEUR);
        player:setVar("AhtUrganStatus",0);
        player:setTitle(EMISSARY_OF_THE_EMPRESS);
        player:addKeyItem(LUMINIAN_DAGGER);
        player:messageSpecial(KEYITEM_OBTAINED,LUMINIAN_DAGGER);
        player:addMission(TOAU,PATH_OF_BLOOD);
    end

end;