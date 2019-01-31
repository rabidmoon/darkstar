-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Wandering Wamoura
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/salvagescaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    salvageScaler(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	salvageAmbient(mob,killer);
    salvageChestB(mob, killer)

end;