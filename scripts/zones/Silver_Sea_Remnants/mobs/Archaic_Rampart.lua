-----------------------------------
-- Area:
-- NPC:  Archaic_Rampart
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Silver_Sea_Remnants/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    
	mob:setLocalVar("Scale",1);
	mob:setLocalVar("Floor",1);

end;


function onMobFight(mob,target)
 
 


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    if (mob:getID() >= 17088718 and mob:getID() <= 17088784) then  
    -- Second Floor Ashu Talif Crew
		local killx = mob:getXPos();
		local killy = mob:getYPos();
		local killz = mob:getZPos();
		local nm = 17088785; -- Citadel_Chelonians
		local chance = 20;
		local moblow = 17088718;
		local mobhigh = 17088784;
		local lvlmin = 65;
		local lvlmax = 75;
	    checkSpawn(mob, killer,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)
	end
	-- salvageArChest(mob, killer)


end;