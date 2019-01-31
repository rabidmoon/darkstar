-----------------------------------
-- Area:
-- NPC:  Draco Lizard
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Zhayolm_Remnants/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    
    salvageScaler(mob)

end;


function onMobFight(mob,target)
 
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    salvageAmbient(mob,killer)
    salvageChestZ(mob, killer)
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local nm = 17076335; -- Jakko
    local chance = 20;

	salvageChest(mob, killer)
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 30 and level <= 35 and GetNPCByID(nm):getStatus() ~= STATUS_NORMAL) then
            if (chance < math.random(0,99)) then 
                master:PrintToPlayer("You feel an unknown presense...",0x15);
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);
            end
		else
            printf("Not of the correct level yet");		
    	end
    else
        local plvl = killer:getVar("Salvage_Level");
		if (plvl >= 30 and plvl <= 35 and GetNPCByID(nm):getStatus() ~= STATUS_NORMAL) then
            if (chance < math.random(0,99)) then
	            if (killer:getObjType() == TYPE_PC) then
                    killer:PrintToPlayer("You feel an unknown presense...",0x15);
	            end
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);	
	        end
		else
		    printf("Not of the correct level yet");	
        end	
    end		
end;