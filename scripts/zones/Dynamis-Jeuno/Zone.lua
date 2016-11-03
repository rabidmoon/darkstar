-----------------------------------
--
-- Zone: Dynamis-Jeuno
--
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-Jeuno/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

	local reentertime = player:getVar("Dyna_Reduction");

	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,75,3,5400);

	 player:setVar("Dynamis_Time_Remaining",5400000);
	 player:setVar("ScyldMultiplier",0);
	 player:setVar("Dynamis_Reenter",os.time() + reentertime);
	 
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

    if (csid == 0) then
        player:setPos(48.930,10.002,-71.032,195,0xF3);
    end

end;