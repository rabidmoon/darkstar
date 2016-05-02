-----------------------------------
--
-- Zone: Dynamis-San_dOria
--
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

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
	 player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,75,3,5400);
     player:PrintToPlayer("You have 60 minutes remaining in Dynamis", 0xD);
	 player:setVar("Dynamis_Time_Remaining",5400000);
	 player:setVar("ScyldMultiplier",0);
	 player:setVar("Dynamis_Reenter",os.time() + 14400);
	 

	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
	player:setVar("ScyldMultiplier",0);
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
        player:setPos(161.000,-2.000,161.000,94,0xE6);
    end
end;