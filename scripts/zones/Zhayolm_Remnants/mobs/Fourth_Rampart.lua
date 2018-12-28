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

    salvageScaler(mob)	

end;


function onMobFight(mob,target)
    


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
		local playerEnter = master:getVar("Zhayolm_Remnant");
		if (playerEnter == 4) then
            master:PrintToPlayer("You hear a faint hum in the distance...",0x15);
		    master:setVar("4th_Floor_NM",1);
		end
    else
	    local playerEnter = killer:getVar("Zhayolm_Remnant");
		if (playerEnter == 4) then
            killer:PrintToPlayer("You hear a faint hum in the distance...",0x15);
		    killer:setVar("4th_Floor_NM",1);
        end	
    end
end;