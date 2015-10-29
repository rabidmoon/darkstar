-----------------------------------
-- Area: Toraimarai Canal
--  Dark Aspic
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	checkRegime(killer,mob,619,3);
	checkRegime(killer,mob,620,1);
end;