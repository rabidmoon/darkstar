-----------------------------------
-- Area: Mamook
-- NPC:  Sagelord_Molaal_Ja
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Mamook/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,0);
    -- mob:setMobMod(MOBMOD_ROAM_DISTANCE, 10); 
    onMobRoam(mob);	
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
    for id = Besieged.acnms[1].mahelper_start,Besieged.acnms[1].mahelper_end do 
        if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 10) then
	            mob:addEnmity(GetMobByID(id),0,1);
			break;
	        end
        end
	end	
end;