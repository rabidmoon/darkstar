-----------------------------------
-- Area:
-- NPC:  Armored_Chariot
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    -- Mob will always try to drop two items
    local firstroll = math.random(1,60);
    local secondroll = math.random(1,60);	
	if (firstroll <= 10) then
        SetDropRate(6780,15729,1000); -- Bodbs Pigaches
	elseif (firstroll <= 20) then	
		SetDropRate(6780,16098,1000); -- Ea's Tiara
	elseif (firstroll <= 30) then	
		SetDropRate(6780,14560,1000); -- Ea's Doublet
	elseif (firstroll <= 40) then	
		SetDropRate(6780,15631,1000); -- Freyrs Trousers
	elseif (firstroll <= 50) then	
		SetDropRate(6780,15713,1000); -- Phobos's Sabatons
	elseif (firstroll <= 60) then	
		SetDropRate(6780,14971,1000); -- Tsukikazu Gote	
    end
	
	if (secondroll <= 10) then
        SetDropRate(6780,15729,1000); -- Bodbs Pigaches
	elseif (secondroll <= 20) then	
		SetDropRate(6780,16098,1000); -- Ea's Tiara
	elseif (secondroll <= 30) then	
		SetDropRate(6780,14560,1000); -- Ea's Doublet
	elseif (secondroll <= 40) then	
		SetDropRate(6780,15631,1000); -- Freyrs Trousers
	elseif (secondroll <= 50) then	
		SetDropRate(6780,15713,1000); -- Phobos's Sabatons
	elseif (secondroll <= 60) then	
		SetDropRate(6780,14971,1000); -- Tsukikazu Gote	
    end	

	if (killer:getObjType() == TYPE_PET) then
	    local master = killer:getMaster();
		master:addTitle(SUN_CHARIOTEER);
	else
	    killer:addTitle(SUN_CHARIOTEER);
	end
end;