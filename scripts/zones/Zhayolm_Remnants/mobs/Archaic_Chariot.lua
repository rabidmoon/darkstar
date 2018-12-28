-----------------------------------
-- Area:
-- NPC:  Archaic Chariot
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("Stagger",1);
	mob:setLocalVar("MagicCount",1);
	mob:setLocalVar("CritCount",1);

	

end;

function onMobEngaged(mob,target)


	mob:addMod(MOD_ATT,40);
	mob:addMod(MOD_DEF,10);
	mob:addMod(MOD_ACC,20);
	mob:addMod(MOD_MACC,20);		
	mob:addMod(MOD_INT,10);
	mob:addMod(MOD_CHR,10);
	mob:addMod(MOD_MND,10);
	mob:addMod(MOD_STR,10);
    mob:addMod(MOD_VIT,10);

	
	
	
	   
	-- printf("Engaged");

end

function onMobFight(mob,target)
 



end;



function onCriticalHit(mob)





end



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local mobid = mob:getID();
    if (mobid == 17076502 or mobid == 17076535) then
	    if (killer:getObjType() ~= TYPE_PC) then
	        local master = killer:getMaster();
            master:PrintToPlayer("You hear a faint hum in the distance...",0x15);
		    master:setVar("5th_Floor_NM",1);
        else
            killer:PrintToPlayer("You hear a faint hum in the distance...",0x15);
		    killer:setVar("5th_Floor_NM",1);
        end	
	end
 
end;