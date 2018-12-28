-----------------------------------
-- 
-- Zone: Nyzul_Isle
-- 
-----------------------------------
package.loaded["scripts/zones/Nyzul_Isle/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Nyzul_Isle/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
local cs = -1;
    if (prevZone == 72 and player:getVar("Rughadjeen_Fight") == 1) then
        player:addTempItem(5349,1);
        player:PrintToPlayer("REGISTERED to Rud Trust Fight");
		player:setVar("Rughadjeen_Fight",0);
		-- player:setPos(0,-22,24,64);
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToBcnm(1393);
                player:PrintToPlayer("REGISTERED");
                if (inst == 1) then
                    player:bcnmEnter(1393);
                else
                    cs = 0;
                end
            else
                player:bcnmEnter(1393);
            end
        else
            inst = player:bcnmRegister(1393);
            if (inst == 1) then
                player:bcnmEnter(1393);
            else
                cs = 0;
            end
        end
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



