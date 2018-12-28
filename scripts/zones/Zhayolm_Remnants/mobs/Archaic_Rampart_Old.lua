-----------------------------------
-- Area:
-- NPC:  Archaic Rampart
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    salvageRampart(mob,target);  
	mob:setLocalVar("Scale",1);
	local mobid = mob:getID();
	if (mobid >= 17076529 or mobid <= 17076531) then -- 5th Floor North Path Rampart Mind Gazer
	    if (mobid == 17076529) then
	        mob:setLocalVar("NMspawn",2);
	        mob:setLocalVar("SpawnID",17076532);
		end
		if (mobid == 17076530) then
	        mob:setLocalVar("NMspawn",2);
	        mob:setLocalVar("SpawnID",17076533);
	    end
		if (mobid == 17076531) then
	        mob:setLocalVar("NMspawn",2);
	        mob:setLocalVar("SpawnID",17076534);
        end
	end
	
    if (mobid == 17076556) then -- 5th Floor North Path Rampart		Torama
        mob:setLocalVar("NMspawn",2);
	    mob:setLocalVar("SpawnID",17076557);
	end
    
	if (mobid == 17076515) then -- 5th Floor Sorth Path Rampart		Wajoam Tiger
        mob:setLocalVar("NMspawn",2);
	    mob:setLocalVar("SpawnID",17076516);
	end
	
	if (mobid >= 17076496 or mobid <= 17076498) then -- 5th Floor Sorth Path Rampart Slime Mold
	    if (mobid == 17076496) then
	        mob:setLocalVar("NMspawn",2);
	        mob:setLocalVar("SpawnID",17076499);
		end
		if (mobid == 17076497) then
	        mob:setLocalVar("NMspawn",2);
	        mob:setLocalVar("SpawnID",17076500);
	    end
		if (mobid == 17076498) then
	        mob:setLocalVar("NMspawn",2);
	        mob:setLocalVar("SpawnID",17076501);
        end	
	end
	
    if (mobid == 17076573) then -- 6th Floor Sorth Path Rampart		Manticore
        mob:setLocalVar("NMspawn",2);
	    mob:setLocalVar("SpawnID",17076574);
    end	
	
    if (mobid == 17076575) then -- 6th Floor Sorth Path Rampart		Manticore
        mob:setLocalVar("NMspawn",2);
	    mob:setLocalVar("SpawnID",17076576);		
	end
	-- 17076575
end;

function onMobEngaged(mob,target)
    printf("TEST");
	


end


function onMobFight(mob,target)
	local spawnTime = mob:getLocalVar("spawnTime");
	local spawnnum = mob:getLocalVar("SpawnID");
	local randspawn = math.random(20,40);
	if (mob:getBattleTime() - spawnTime > randspawn) then
	    mob:useMobAbility(1778);
		mob:setLocalVar("spawnTime", mob:getBattleTime());
	end
	



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	printf("MOB IS DOWN");
end;