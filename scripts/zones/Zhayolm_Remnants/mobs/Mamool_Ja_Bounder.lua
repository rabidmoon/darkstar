-----------------------------------
-- Area:
-- NPC:  Mamool Ja Zenist
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

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
	salvageAmbient(mob,killer);
	
	 	
end;