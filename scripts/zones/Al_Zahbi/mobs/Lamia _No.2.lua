-----------------------------------
-- Area: Al Zahbi
-- NPC:  Lamia _No.2
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/besiegedhelper");

local Besieged = require("scripts/zones/Al_Zahbi/IDs");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ROAM_DISTANCE, 10);
	mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,3600);		
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("roamTime", os.time());
	local rand = randPath(mob);
	mob:setLocalVar("GoingToAC",1);	
	mob:setLocalVar("PickPath",rand);
	undeadStrength(mob)
    onMobRoam(mob);
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
	besiegedMobAggro(mob)
    local roamTime = mob:getLocalVar("roamTime");
	local randpath = mob:getLocalVar("PickPath");	
    if (os.time() - roamTime > 2) then
        pathfind.patrol(mob, Besieged.mobpath[randpath], PATHFLAG_NONE);
	    mob:setLocalVar("roamTime", os.time());
	end	
end;


function onMobRoamAction(mob)



end


function onMobRoam(mob)
    local move = mob:getLocalVar("GoingToAC");
	local randpath = mob:getLocalVar("PickPath");	
    local captured = GetServerVariable("Generals_Captured");
	local pos = mob:getPos();   
if ((captured == 5 and move == 1) or (GetServerVariable("Dead_Helpers") > 30 and move == 1)) then
	   -- printf("Generals are captured");
		mob:clearPath();
	    gotoAC(mob);
    elseif (pos.x >= 77 and pos.z > 118) then
	    undeadLoss(mob)		
    end	
    if (mob:isFollowingPath() == false) then
		local randpath = mob:getLocalVar("PickPath");
        mob:pathThrough(pathfind.first(Besieged.mobpath[randpath]), PATHFLAG_NONE);
    end
	besiegedMobAggro(mob)
end;
