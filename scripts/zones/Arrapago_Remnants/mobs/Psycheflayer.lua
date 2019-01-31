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
    salvageChestA(mob, killer)
    if (mob:getID() >= 17080440 and mob:getID() <= 17080451) then
        -- 3rd Floor Psycheflayers
        local killx = mob:getXPos();
        local killy = mob:getYPos();
        local killz = mob:getZPos();
        local nm = 17080475; -- Qiqirin Astrologer
        local chance = 20;
	    local moblow = 17080440;
	    local mobhigh = 17080451;
	    local lvlmin = 40;
	    local lvlmax = 45;
    elseif (mob:getID() >= 17080477 and mob:getID() <= 17080482) then
        -- 4th Floor PsycheFlayers
        local killx = mob:getXPos();
        local killy = mob:getYPos();
        local killz = mob:getZPos();
        local nm = 17080514; -- Qiqirin Treasure Hunter
        local chance = 20;
	    local moblow = 17080477;
	    local mobhigh = 17080482;
	    local lvlmin = 50;
	    local lvlmax = 55;
	end
	-- salvageArChest(mob, killer)
	checkSpawn(mob, killer,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)

end;