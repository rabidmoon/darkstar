-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Gal
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Mamook/IDs");

path = {
    66,16,-169,
    38,14,-162
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
	mob:setDamage(mobdmg + (25 + (boost/2)));	
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
		if (GetMobAction(17044059) ~= ACTION_ATTACK) then
	        GetMobByID(17044059):setRespawnTime(respawntime);
		    DespawnMob(17044059);
			DespawnMob(17043872);
			DespawnMob(17043873);
			DespawnMob(17043874);			
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
    for id = Besieged.acnms[2].mamirror_start,Besieged.acnms[2].mamirror_end do 
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
	GetMobByID(17044059):setRespawnTime(1200);
	DespawnMob(17044059);
end;

function onMobRoam(mob)
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path), PATHFLAG_RUN);
    end
end;