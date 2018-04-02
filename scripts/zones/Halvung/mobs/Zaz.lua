-----------------------------------
-- Area: Halvung
-- NPC:  Mil
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Halvung/IDs");

path = {
    -29,9,299
	}
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local length = GetServerVariable("Helper_Fight_Length");
	mob:setLocalVar("TimeToWarp", length);
    onMobRoam(mob);
	mob:addMod(MOD_DEFP,-15);
	mob:addMod(MOD_EVA,-40);
    mob:addMod(MOD_REGAIN,20);	
    mob:addMod(MOD_ATTP,30);
    mob:addMod(MOD_ATT,600);	
	mob:addMod(MOD_STR,350);
	local boost = GetServerVariable("SiegeDonation");
    local mobdmg = mob:getWeaponDmg();
	mob:setDamage(mobdmg + (8 + (boost/2)));	
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    local warp = mob:getLocalVar("TimeToWarp");
	local respawntime = math.random(900,1200);
	if (os.time() >= warp) then
	    mob:injectActionPacket(4, 261);
		mob:setHP(0);
		if (GetMobAction(17031741) ~= ACTION_ATTACK) then
	        GetMobByID(17031741):setRespawnTime(respawntime);
		    DespawnMob(17031741);
		    DespawnMob(17031565);
		    DespawnMob(17031566);
		    DespawnMob(17031567);			
        end			
	end
end;

function onMobFight(mob,target)
  


end

function onPath(mob)
	local MobID = mob:getID();
    for id = Besieged.acnms[3].acnms_start,Besieged.acnms[3].acnms_end do 
        if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 30) then
	            mob:addEnmity(GetMobByID(id),0,1);
			break;
	        end
        end
	end
    for id = Besieged.acnms[2].hamirror_start,Besieged.acnms[2].hamirror_end do 
        if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 20) then
	            mob:addEnmity(GetMobByID(id),0,1);
			break;
	        end
        end
	end		
    pathfind.patrol(mob, path, PATHFLAG_RUN);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetMobByID(17031741):setRespawnTime(1200);
	DespawnMob(17031741);
end;

function onMobRoam(mob)
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path), PATHFLAG_RUN);
    end
end;