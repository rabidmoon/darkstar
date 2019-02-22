-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Chigre(ZNM T1)
-- @pos G-7
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    znmT1Size(mob)   
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
    local nm = 9;
    znmTherionT1(mob, killer, nm)	
end;