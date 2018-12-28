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
	
	-- local dayOfWeek = VanadielDayElement();
	local playerEnter = 0;
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
		playerEnter = master:getVar("Zhayolm_Remnant");
		if (playerEnter == 3) then
            master:PrintToPlayer("The device emits a faint hum...",0x15);
		    master:setVar("4th_Floor_NM",1);
		end
    else
	    playerEnter = killer:getVar("Zhayolm_Remnant");
		if (playerEnter == 3) then
            killer:PrintToPlayer("The device emits a faint hum...",0x15);
		    killer:setVar("4th_Floor_NM",1);
        end	
    end
end;