-----------------------------------
-- Area:
-- NPC:  Vagrant Lindwurm
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

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
	salvageAmbient(mob,killer);
	
    -- Porogo Gent Spawn Chance
    local killx = killer:getXPos();
    local killy = killer:getYPos();
    local killz = killer:getZPos();
    local nm = 17076278;
    local chance = 25;

	
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 20 and level <= 25) then
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
		if (plvl >= 20 and plvl <= 25) then
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