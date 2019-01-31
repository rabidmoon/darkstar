-----------------------------------
-- Area:
-- NPC:  Poroggo Gent
-- First floor Proggo will spawn chests
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
    salvageAmbient(mob,killer)
    salvageChestZ(mob, killer)
    if (mob:getID() >= 17076426 and mob:getID() <= 17076473) then  
		local killx = mob:getXPos();
		local killy = mob:getYPos();
		local killz = mob:getZPos();
		local nm = 17076486; -- Poroggo Madame
		local chance = 20;
		local moblow = 17076426;
		local mobhigh = 17076473;
		local lvlmin = 50;
		local lvlmax = 55;
	    checkSpawn(mob, killer,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)
	end
end;