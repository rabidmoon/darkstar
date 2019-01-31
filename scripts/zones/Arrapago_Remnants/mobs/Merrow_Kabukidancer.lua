-----------------------------------
-- Area:
-- NPC:  Lamia_Dartist
-- If certain PH is killed spawn Demonic Pugil
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvageambiance");
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs");

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
	salvageChestA(mob, killer)
end;