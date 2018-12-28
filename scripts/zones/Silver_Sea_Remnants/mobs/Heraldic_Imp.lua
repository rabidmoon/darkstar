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
    salvageAmbient(mob,killer);
    if (mob:getID() >= 17088558 and mob:getID() <= 17088637) then  
    -- Second Floor Ashu Talif Crew
		local killx = mob:getXPos();
		local killy = mob:getYPos();
		local killz = mob:getZPos();
		local nm = 17088595; -- Dekka
		local chance = 20;
		local moblow = 17088558;
		local mobhigh = 17088637;
		local lvlmin = 45;
		local lvlmax = 55;
	    checkSpawn(mob, killer,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)
	end
	-- salvageArChest(mob, killer)


end;