-----------------------------------
--
-- Zone: Jade_Sepulcher (67)
--
-----------------------------------
package.loaded["scripts/zones/Jade_Sepulcher/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Jade_Sepulcher/TextIDs");

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
    if (prevZone == 67 and player:getVar("Najelith_Fight") == 1) then
        player:addTempItem(5349,1);
        player:PrintToPlayer("REGISTERED to Najelith Trust Fight");
		player:setVar("Najelith_Fight",0);
		-- player:setPos(0,-22,24,64);
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToBcnm(1392);
                player:PrintToPlayer("REGISTERED");
                if (inst == 1) then
                    player:bcnmEnter(1392);
                else
                    cs = 0;
                end
            else
                player:bcnmEnter(1392);
            end
        else
            inst = player:bcnmRegister(1392);
            if (inst == 1) then
                player:bcnmEnter(1392);
            else
                cs = 0;
            end
        end	
    elseif (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(340.383,-13.625,-157.447,189);
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