-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Blue Mage
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
	local boost = GetServerVariable("SiegeDonation");
	local mobdmg = mob:getWeaponDmg();
	mob:setDamage(mobdmg + (boost));
    onMobRoam(mob);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobFight(mob,target)
    local warp = mob:getLocalVar("TimeToWarp");
	local respawntime = math.random(900,1200);
	if (os.time() >= warp) then
	    mob:injectActionPacket(4, 261);
		mob:setHP(0);
        printf("Siege has ended");
        SetServerVariable("Besieged_Horde",0);		
		DespawnMob(17031741);		
		if (GetMobAction(17031741) ~= ACTION_ATTACK) then
	        GetMobByID(17031741):setRespawnTime(respawntime);
			SetServerVariable("[HA]SiegeTime",os.time() + respawntime);
			-- Get the HP of the Mirrors and set to Server Variable in case of crash
			local mirror1 = GetMobByID(17031568):getHP();
			local mirror2 = GetMobByID(17031569):getHP();
			local mirror3 = GetMobByID(17031570):getHP();
            printf("Mirror 1 HP is %u",mirror1);
			printf("Mirror 2 HP is %u",mirror2);
			printf("Mirror 3 HP is %u",mirror3);
			if (GetMobAction(17031568) == ACTION_NONE) then
			   -- mirror1 = 2;
			end
			if (GetMobAction(17031569) == ACTION_NONE) then
			  --  mirror2 = 2;
			end	
			if (GetMobAction(17031570) == ACTION_NONE) then
			   -- mirror3 = 2;
			end				
     		SetServerVariable("[HA]Mirror1",mirror1);
     		SetServerVariable("[HA]Mirror2",mirror2);
     		SetServerVariable("[HA]Mirror3",mirror3);	
            -- Despawn Lamia and Helper	

		    DespawnMob(17031565);
		    DespawnMob(17031566);
		    DespawnMob(17031567);			
            -- Despawn Helper NM's
			for i,v in pairs(Besieged.nmmobs[1]) do
                DespawnMob(v);
            end
			-- Despawn all BLU's

            -- Despawn Possible Generals
            DespawnMob(17031754);
            DespawnMob(17031755);
            DespawnMob(17031756);
            DespawnMob(17031757);
            DespawnMob(17031758);			
            -- Calculate Experience Points
		   
	    end			
    end			

end;

function onPath(mob)
	local MobID = mob:getID();
	local randmirror = math.random(1,3);
    -- for id = Besieged.acnms[3].armirror_start,Besieged.acnms[3].armirror_end do 
	local id = Besieged.mirrors[randmirror]
        if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 20) then
	            mob:addEnmity(GetMobByID(id),0,1);
			
	        end
        end
	
    pathfind.patrol(mob, path, PATHFLAG_RUN);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    death = GetServerVariable("Helper_Death");
	death = death + 1;
	SetServerVariable("Helper_Death",death);
	print("HELPER DIED");	


end;

function onMobRoam(mob)
    local warp = mob:getLocalVar("TimeToWarp");
	local respawntime = math.random(900,1200);
	if (os.time() >= warp) then
	    mob:injectActionPacket(4, 261);
		mob:setHP(0);
        printf("Bluemage.lua - Siege has ended");					
		if (GetMobAction(17044059) ~= ACTION_ATTACK) then
	        GetMobByID(17044059):setRespawnTime(respawntime);
			SetServerVariable("[AR]SiegeTime",os.time() + respawntime);			
			-- Get the HP of the Mirrors and set to Server Variable in case of crash
			local mirror1 = GetMobByID(17043847):getHP();
			local mirror2 = GetMobByID(17043848):getHP();
			local mirror3 = GetMobByID(17043849):getHP();
            printf("Mirror 1 HP is %u",mirror1);
			printf("Mirror 2 HP is %u",mirror2);
			printf("Mirror 3 HP is %u",mirror3);
			if (GetMobAction(17043847) == ACTION_NONE) then
			   -- mirror1 = 2;
			end
			if (GetMobAction(17043848) == ACTION_NONE) then
			  --  mirror2 = 2;
			end	
			if (GetMobAction(17043849) == ACTION_NONE) then
			   -- mirror3 = 2;
			end				
     		SetServerVariable("[AR]Mirror1",mirror1);
     		SetServerVariable("[AR]Mirror2",mirror2);
     		SetServerVariable("[AR]Mirror3",mirror3);	
            -- Despawn Lamia and Helper	

			-- DespawnMob(16998835);
			-- DespawnMob(16998836);
			-- DespawnMob(16998837);				
        end			
	end
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path), PATHFLAG_RUN);
    end
end;