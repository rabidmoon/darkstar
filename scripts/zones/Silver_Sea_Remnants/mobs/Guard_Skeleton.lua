-----------------------------------
-- Area:
-- NPC:  Heraldic Imp
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Silver_Sea_Remnants/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob) 
    salvageScaler(mob)
end;


function onMobFight(mob,target)
 
 


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    salvageAmbient(mob,killer)
    salvageChestS(mob, killer)

end;