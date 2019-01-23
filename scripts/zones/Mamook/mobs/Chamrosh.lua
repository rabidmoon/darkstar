-----------------------------------
-- Area: Mamook
--  NPC: Chamrosh(ZNM T1)
-- @pos ??
-----------------------------------
package.loaded["scripts/zones/Mamook/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mamook/TextIDs");
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
    local nm = 2;
    znmTherionT1(mob, killer, nm)	
end;