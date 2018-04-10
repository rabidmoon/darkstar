-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  ??? (Spawn when mega is defeated)
-- Animated Polearm and Scythe
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
    if (trade:hasItemQty(3371,1)) then
        SpawnMob(17330205):updateEnmity(player); 
		player:tradeComplete();
	elseif (trade:hasItemQty(3370,1)) then
        SpawnMob(17330206):updateEnmity(player);
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