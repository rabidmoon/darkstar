-----------------------------------
--
-- Zone: Hazhalm_Testing_Grounds (78)
--
-----------------------------------
package.loaded["scripts/zones/Hazhalm_Testing_Grounds/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Hazhalm_Testing_Grounds/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (prevZone == 78 and player:getVar("Zazarg_Fight") == 1) then
        player:addTempItem(5349,1);
        player:PrintToPlayer("REGISTERED to Rud Trust Fight");
		player:setVar("Zazarg_Fight",0);
		-- player:setPos(0,-22,24,64);
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToBcnm(1391);
                player:PrintToPlayer("REGISTERED");
                if (inst == 1) then
                    player:bcnmEnter(1391);
                else
                    cs = 0;
                end
            else
                player:bcnmEnter(1391);
            end
        else
            inst = player:bcnmRegister(1391);
            if (inst == 1) then
                player:bcnmEnter(1391);
            else
                cs = 0;
            end
        end	
    elseif (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(652.174,-272.632,-104.92,148);
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
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