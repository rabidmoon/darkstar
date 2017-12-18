-----------------------------------
-- Area: Ghelsba outpost
-- NPC:  Furies
-- BCNM20
-----------------------------------


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:setLocalVar("alive",0);
end;


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("spawn_timer",os.time() + math.random(120,135)); -- Random Spawn timer between 2m and 2m 15 seconds
	mob:setLocalVar("spawn",1);
	mob:setLocalVar("alive",1);
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local coeurl = 17526937;
    local dhalmel = 17526938;
    local sheep = 17526939;
    local tiger = 17526940;
    local manticoreNM = 17526941;
    local nextspawn = mob:getLocalVar("spawn_timer");
	local spawn = mob:getLocalVar("spawn");
	
	if (nextspawn < os.time() and spawn == 1) then
	  mob:setLocalVar("spawn",0);
	  ominousFightMsg(mob,target)
	  SpawnMob(tiger):updateEnmity(target);
	end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------
function onMobDespawn(mob)
   
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
    local mammet = 17526936;
    local coeurl = 17526937;
    local dhalmel = 17526938;
    local sheep = 17526939;
    local tiger = 17526940;
    local manticoreNM = 17526941;
    local waveprogress = GetMobByID(mammet):getLocalVar("Wave_Progress");
    local currentwave = GetMobByID(mammet):getLocalVar("Wave");
	local dead = mob:setLocalVar("alive",1); -- 1 Means it is dead
	
	
    waveprogress = 1 + waveprogress;
	GetMobByID(mammet):setLocalVar("Wave_Progress",waveprogress);
-- Spawn Next Mob if it isn't already up or hasn't been killed
    if (GetMobByID(dhalmel):getLocalVar("alive") == 0) then
	  SpawnMob(dhalmel):updateEnmity(killer);
	  ominousKillMsg(mob,killer)
    elseif (GetMobByID(sheep):getLocalVar("alive") == 0) then
	  SpawnMob(sheep):updateEnmity(killer);
	  ominousKillMsg(mob,killer)	  
    elseif (GetMobByID(tiger):getLocalVar("alive") == 0) then
	  SpawnMob(tiger):updateEnmity(killer);
	  ominousKillMsg(mob,killer)  
    end	  
	
    local wave1killed = (GetMobAction(tiger) == 0 and GetMobAction(dhalmel) == 0 and GetMobAction(sheep) == 0);
-- Check to see if all mobs from the wave are dead
    if (waveprogress == 4) then
      SpawnMob(manticoreNM);  
    end
end;
