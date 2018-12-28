-----------------------------------
-- Area:
-- NPC:  Devil Manta
-- Role: Portal Unlock
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Arrapago_Remnants/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    
	mob:setLocalVar("Scale",1);
	mob:setLocalVar("Floor",1);

end;


function onMobFight(mob,target)
 
 


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("4th_Floor_NM",1);
    else
        killer:PrintToPlayer("The device emits a faint hum...",0x15);
		killer:setVar("4th_Floor_NM",1);
    end	

end;