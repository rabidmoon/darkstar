-----------------------------------
-- Area: Everbloom Hollow
-- NPC:  Armoury Crate
-- 
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Everbloom_Hollow/TextIDs");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	
    player:getBCNMloot();
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,75,3,300);
	player:setPos(-345, 12, 19);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;