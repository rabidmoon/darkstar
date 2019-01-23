-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Velionis(ZNM T1)
-- @pos G-11
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  
end;

function onMobFight(mob, target)
    znmScalerT1(mob,target)
end;

function onCriticalHit(mob)



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local nm = 7;
    znmTherionT1(mob, killer, nm)	
end;