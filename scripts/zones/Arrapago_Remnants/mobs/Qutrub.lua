-----------------------------------
-- Area:
-- NPC:  Qutrub
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvageambiance");
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local MobID = mob:getID();
	local chance = math.random(1,100);
    local killx = killer:getXPos();
    local killy = killer:getYPos();
    local killz = killer:getZPos();
    local bhoot = 17080469;
    local nmpop = 30;
	local ph = Arrapago.ph[1].LAMIA_DARTIST2;
	-- First Floor NW Path (Add Ranged Attack)
	if ((MobID >= 17080323) and (MobID <= 17080325) or (MobID >= 17080326) and (MobID <= 17080327) or (MobID >= 17080330) and (MobID <= 17080333)) then
	    if (chance < 10) then
		    if (killer:hasStatusEffect(EFFECT_ATTACK_BOOST) == false) then
			    killer:PrintToPlayer("You have gained a small attack boost!", 0x15);	 
		        killer:addStatusEffect(EFFECT_ATTACK_BOOST,10,0,0);
		    end
        end
		-- Check if Lamia is up, if it isn't, then trigger possible pop for Bhoot
		if (GetMobAction(ph) == 0) then
            if (nmpop < math.random(0,99)) then
	            if (killer:getObjType() == TYPE_PC) then
                    killer:PrintToPlayer("You feel an unknown presense...",0x15);
	            end
	            SpawnMob(bhoot):setPos(killx+1,killy,killz);
                GetMobByID(bhoot):updateClaim(killer);	
	        end
	    end		 
	end	
    mobAmbiance(mob,killer);
	
end;