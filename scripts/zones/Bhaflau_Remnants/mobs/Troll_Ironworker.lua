-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Troll Ironworker
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    -- local duration = target:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getTimeRemaining();
	-- local seconds = math.floor(duration / 1000);
	local salvagelvl = killer:getVar("Salvage_Level");
    local lvldif = (mob:getMainLvl() - killer:getMainLvl());
	local multiplier = 0;
	local floornumber = killer:getVar("Bhaflau_Floor");
	local ambpts = killer:getVar("Ambience_Points");
	if (mob:checkBaseExp()) then 
		if (lvldif < 0) then  -- EP
			multiplier = 0;
		elseif (lvldif == 0) then 
			multiplier = 3;
		elseif (lvldif <= 2) then
			multiplier = 8;
		elseif (lvldif <= 7) then
			multiplier = 10.5;
		else 
			multiplier = 13;
		end
	end
local ambience = math.floor(((lvldif + 15) * multiplier));
killer:PrintToPlayer(string.format("%s gains "..ambience.." ambience points.", killer:getName()), 0x15);
ambience = ambpts + ambience;
killer:setVar("Ambience_Points", ambience);



     if (killer:getVar("Ambience_Points") >= 1500) then
	 ambience = ambience - 1500;
	 killer:setVar("Ambience_Points",ambience);
	 salvagelvl = salvagelvl + 1;
	 if (salvagefloor == 1) and (salvagelvl > 10) then
	 salvagelvl = 10;
	 elseif (salvagefloor == 2) and (salvagelvl > 10) then
	 salvagelvl = 10;
	 elseif (salvagefloor == 3) and (salvagelvl > 15) then
	 salvagelvl = 15;
	 elseif (salvagefloor == 4) and (salvagelvl > 15) then
	 salvagelvl = 15;
	 end
	 
	 killer:PrintToPlayer("The dark energy has weakened around you.  You are now Level "..salvagelvl..".", 0x15);	 
	 killer:setVar("Salvage_Level",salvagelvl);
	 killer:addStatusEffect(EFFECT_LEVEL_RESTRICTION,salvagelvl,3,5400);

	 end
	 

	 


end;