-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Lamia_No11
-- POS:  509 -15 131
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Al_Zahbi/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,0);
    -- mob:setMobMod(MOBMOD_ROAM_DISTANCE, 10); 
    -- onMobRoam(mob);	
end;


-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

end;


function onMobRoam(mob)
	local MobID = mob:getID();
    for id = Besieged.acnms[2].arhelper_start,Besieged.acnms[2].arhelper_end do 
        if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 10) then
	            mob:addEnmity(GetMobByID(id),0,1);
			break;
	        end
        end
	end	
end;