-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  ??? (Spawn when mega is defeated)
-- Animated KNuckles and Dagger
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
    if (trade:hasItemQty(3364,1)) then
        SpawnMob(17330199):updateEnmity(player); 
		player:tradeComplete();
	elseif (trade:hasItemQty(3365,1)) then
        SpawnMob(17330200):updateEnmity(player);
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