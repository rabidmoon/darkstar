-----------------------------------
--
-- Zone: Maquette Abdhaljs-Legion
--
-----------------------------------
package.loaded["scripts/zones/Maquette_Abdhaljs-Legion/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Maquette_Abdhaljs-Legion/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

if (prevZone == 110) then
player:addTempItem(5349,1);
 player:PrintToPlayer("REGISTERED22");
 if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToBcnm(1387);
                player:PrintToPlayer("REGISTERED");
                if (inst == 1) then
                    player:bcnmEnter(1387);
                else
                     cs = 0;
                end
            else
                player:bcnmEnter(1387);
            end
        else
            inst = player:bcnmRegister(1387);

            if (inst == 1) then
                player:bcnmEnter(1387);
            else
                cs = 0;
            end

       
  
    end

	end
	

	encuranceResetZone(player,prevZone)

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
