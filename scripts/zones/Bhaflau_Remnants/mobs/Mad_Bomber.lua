-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Mad Bomber
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:AnimationSub(2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)



end;


function onMobDespawn(mob)
end;
