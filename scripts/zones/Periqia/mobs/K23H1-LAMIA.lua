-----------------------------------
-- Area: Periqia (Shades of Vengeance)
--  MOB: K23H1-LAMIA
-----------------------------------
require("scripts/zones/Periqia/TextIDs");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local instance = mob:getInstance();
    local progress = math.random(3,6);
    instance:setProgress(instance:getProgress() + progress);
	local iprogress = instance:getProgress();
	if (iprogress >= 10) then
	    for i,v in pairs(Periqia.mobs[79]) do
        DespawnMob(v, instance);
        end
	end	
end;