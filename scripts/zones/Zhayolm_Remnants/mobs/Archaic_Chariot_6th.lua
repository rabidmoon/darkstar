-----------------------------------
-- Area:
-- NPC:  First Rampart
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

    salvageScaler(mob);
	

end;

function onMobEngaged(mob,target)


end

function onMobFight(mob,target)
 



end;



function onCriticalHit(mob)




end



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
	    master:setVar("6th_Floor_NM",1);
    else
        killer:PrintToPlayer("The device emits a faint hum...",0x15);
		killer:setVar("6th_Floor_NM",1);	
    end
end;