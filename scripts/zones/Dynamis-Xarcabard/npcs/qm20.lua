-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  ??? (Spawn when mega is defeated)
-- Animated Shield
-----------------------------------
package.loaded["scripts/zones/Dynamis-Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(3379,1)) then
        SpawnMob(17330214):updateEnmity(player); 
		player:tradeComplete();
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)


	
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