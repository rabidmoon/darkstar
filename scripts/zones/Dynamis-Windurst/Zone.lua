-----------------------------------
--
-- Zone: Dynamis-Windurst
--
-----------------------------------
package.loaded["scripts/zones/Dynamis-Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-Windurst/TextIDs");
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
	local d1 = 0;
	local d2 = 0;
	local d3 = 0;
	local d4 = 0;
	local d5 = 0;
	local d6 = 0;
	local reduction = 0;
	local reentertime = 43200;
	
	
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
        player:setPos(-217.000,1.000,-119.000,94,0xEF);
    end
end;