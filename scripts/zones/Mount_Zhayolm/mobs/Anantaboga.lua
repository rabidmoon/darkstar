-----------------------------------
-- Area: Mount Zhayolm
-- NPC: Anantaboga
-- @pos E-6
-----------------------------------

require("scripts/globals/magic");
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
    local nm = 13;
    znmTherionT2(mob, killer, nm)	
end;