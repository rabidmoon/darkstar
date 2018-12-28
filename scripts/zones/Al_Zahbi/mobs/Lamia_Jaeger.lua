-----------------------------------
-- Area: Al Zahbi
-- NPC:  Lamia Jaeger
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");

local Besieged = require("scripts/zones/Al_Zahbi/IDs");

function onMobInitialize(mob)
    -- mob:setMobMod(MOBMOD_ROAM_DISTANCE, 10);
	mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,3600);		
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("roamTime", os.time());
    mob:setMobMod(MOBMOD_ROAM_DISTANCE,500);
		
    mob:pathThrough(pathfind.fromStart(Besieged.mobpath[3]), PATHFLAG_RUN);
		

	
end;

function onMobEngaged(mob, target)
end;

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    -- killer:PrintToPlayer("MOB DEAD");
    undeadVictory(mob,killer);
end;

function onPath(mob)

	if (mob:atPoint(pathfind.get(Besieged.mobpath[3],3)) and mob:isFollowingPath() == true) then
        mob:clearPath();
		mob:addStatusEffect(EFFECT_BIND, 0, 0, 6);
		printf("DONE BINDING MOB");
        		
    end		
end;


function onMobRoamAction(mob)



end


function onMobRoam(mob)
    printf("ROAMING NOW");
	 if (mob:isFollowingPath() == false) then
	 printf("Nothing to see here");
	  -- mob:pathThrough(pathfind.fromStart(Besieged.mobpath[16]), PATHFLAG_RUN);
	 end
end;
