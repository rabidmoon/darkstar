-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
--  MOB: Ashu Talif Crew
-----------------------------------

require("scripts/globals/status");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

function onMobRoam(mob)


	



end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)



 
end;

function onMobFight(mob,target)
    local instance = mob:getInstance();
	local progress = instance:getProgress();
    if (progress == 10) then
		mob:addStatusEffect(EFFECT_TERROR,1,0,120);
		
		mob:untargetable(true); 
	    mob:setHP(0);
		mob:setPos(0,-28,-7);

    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, killer)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
