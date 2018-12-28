-----------------------------------
-- Area:
-- NPC:  Archaic Gears
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    
	mob:setLocalVar("Scale",1);
	

end;


function onMobFight(mob,target)
     hpScaler(mob);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	salvageAmbient(mob,killer);
    -- Porogo Gent Spawn Chance
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	local mobids = mob:getID();
	local nm = 0;
	salvageChest(mob, killer)	
	if (mobids >= 17076517 and mobids <= 17076555) then
        nm = 17076558; -- Poroggo Madame
        local chance = 20;
	    if (killer:getObjType() ~= TYPE_PC) then
			local master = killer:getMaster();
			local level = master:getVar("Salvage_Level");
			if (level >= 60 and level <= 65 and GetNPCByID(nm):getStatus() ~= STATUS_NORMAL) then
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
			if (plvl >= 60 and plvl <= 65 and GetNPCByID(nm):getStatus() ~= STATUS_NORMAL) then
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
	end
end;