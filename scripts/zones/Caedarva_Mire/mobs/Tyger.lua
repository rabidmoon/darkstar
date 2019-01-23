-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Tyger
-- @pos -766 -12 632
-- Spawn with Singed Buffalo: @additem 2593
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(MOD_SLEEPRES,30);
    mob:addMod(MOD_BINDRES,30);
    mob:addMod(MOD_GRAVITYRES,30);
    mob:addMod(MOD_ATT, 200);
end;


-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    znmScalerT4(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local nm = 30;
    znmTherionT4(mob, killer, nm)	
end;