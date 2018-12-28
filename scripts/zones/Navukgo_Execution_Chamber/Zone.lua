-----------------------------------
--
-- Zone: Navukgo_Execution_Chamber (64)
--
-----------------------------------
package.loaded["scripts/zones/Navukgo_Execution_Chamber/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Navukgo_Execution_Chamber/TextIDs");

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
    if (prevZone == 64 and player:getVar("Gadalar_Fight") == 1) then
        player:addTempItem(5349,1);
        player:PrintToPlayer("REGISTERED to Rud Trust Fight");
		player:setVar("Gadalar_Fight",0);
		-- player:setPos(0,-22,24,64);
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToBcnm(1390);
                player:PrintToPlayer("REGISTERED");
                if (inst == 1) then
                    player:bcnmEnter(1390);
                else
                    cs = 0;
                end
            else
                player:bcnmEnter(1390);
            end
        else
            inst = player:bcnmRegister(1390);
            if (inst == 1) then
                player:bcnmEnter(1390);
            else
                cs = 0;
            end
        end	
    elseif (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-660.185,-12.079,-199.532,192);
    end
	
	if (player:getCurrentMission(TOAU) == SHIELD_OF_DIPLOMACY and player:getVar("AhtUrganStatus") == 0) then
        cs = 1;
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
	    if (csid == 1) then
        player:setVar("AhtUrganStatus",1);
    end
end;