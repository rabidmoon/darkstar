-----------------------------------
-- Area: Mamook
--  NPC: Iriri Samariri(ZNM T1)
-- @pos F-7
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
    znmT2Size(mob)  
end;

function onMobFight(mob, target)
    znmScalerT2(mob,target)
end;

function onCriticalHit(mob)



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local nm = 11;
    znmTherionT2(mob, killer, nm)	
end;