-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Blue Mage
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Arrapago_Reef/IDs");

path = {
    472,-10,115,
    478,-10,128,
    479,-10,140,
    507,-15,140
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
		if (GetMobAction(16999067) ~= ACTION_ATTACK) then
	        GetMobByID(16999067):setRespawnTime(respawntime);
		    DespawnMob(16999067);
			DespawnMob(16998835);
			DespawnMob(16998836);
			DespawnMob(16998837);			
        end			
	end
end;

function onMobFight(mob,target)
  


end

function onPath(mob)
	local MobID = mob:getID();
    for id = Besieged.acnms[1].acnms_start,Besieged.acnms[1].acnms_end do 
        if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 30) then
	            mob:addEnmity(GetMobByID(id),0,1);
			break;
	        end
        end
	end
    for id = Besieged.acnms[3].armirror_start,Besieged.acnms[3].armirror_end do 
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
	GetMobByID(16999067):setRespawnTime(1200);
	DespawnMob(16999067);
end;

function onMobRoam(mob)
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path), PATHFLAG_RUN);
    end
end;