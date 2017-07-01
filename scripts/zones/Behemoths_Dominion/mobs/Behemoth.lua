-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
	mob:setLocalVar("PartySize",3); 
end	

function onMobFight(mob, target)
    mobScaler(mob,target);
end;

function onMobRoam(mob)
    local spawnTime = mob:getLocalVar("popTime");

    if (os.time() - spawnTime > 180) then
        DespawnMob(mob:getID());
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(BEHEMOTHS_BANE);
	if (killer:getObjType() == TYPE_PC) then
	killer:setVar("Behemoth_Win",1);
	killer:addCurrency('prestiege', 100);
	killer:PrintToPlayer("You obtain 100 Prestiege Points!", 0xD);
	end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local Behemoth = mob:getID();
    local King_Behemoth = mob:getID()+1;
    local ToD = GetServerVariable("[POP]King_Behemoth");
    local kills = GetServerVariable("[PH]King_Behemoth");
    local popNow = (math.random(1,5) == 3 or kills > 6);

    if (LandKingSystem_HQ ~= 1 and ToD <= os.time(t) and popNow == true) then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if (LandKingSystem_NQ == 0) then
            DeterMob(Behemoth, true);
        end

        DeterMob(King_Behemoth, false);
        UpdateNMSpawnPoint(King_Behemoth);
        GetMobByID(King_Behemoth):setRespawnTime(math.random(75600,86400));
    else
        if (LandKingSystem_NQ ~= 1) then
            UpdateNMSpawnPoint(Behemoth);
            mob:setRespawnTime(math.random(75600,86400));
            SetServerVariable("[PH]King_Behemoth", kills + 1);
        end
    end
end;