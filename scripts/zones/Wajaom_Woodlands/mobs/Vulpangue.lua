-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Vulpangue(ZNM T1)
-- @pos -697 -7 -123 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/globals/status");
require("scripts/zones/Davoi/TextIDs");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  mob:setLocalVar("PartySize",8);
end;

function onMobFight(mob, target)


end;

function onCriticalHit(mob)



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, player)
  player:setVar("Vulpangue_Win",1);
  player:addCurrency('zeni_point',50);
  player:PrintToPlayer("You obtain 50 Zeni Points.", 0x15);	
end;