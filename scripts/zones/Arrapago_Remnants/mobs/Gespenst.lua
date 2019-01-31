-----------------------------------
-- Area:
-- NPC:  Qutrub
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Arrapago_Remnants/TextIDs");

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

     salvageAmbient(mob,killer)
    salvageChestA(mob, killer)   
    -- Qiqirin Astrologer
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local nm = 17080475; -- Qiqirin Astrologer
    local chance = 20;
	local moblow = 17080463;
	local mobhigh = 17080474;
	local lvlmin = 40;
	local lvlmax = 45;

	-- salvageArChest(mob, killer)
	checkSpawn(mob, killer,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)

end;