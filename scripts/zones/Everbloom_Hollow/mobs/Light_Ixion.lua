-----------------------------------
-- Area: Balga's Dais
-- NPC:  Black Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:setLocalVar("astralflows",1);
end;



function onMobFight(mob, target)

local astralFlows = mob:getLocalVar("astralflows");
local afTrigger = math.random(25,50);



if (mob:getHPP() <= afTrigger) and (astralFlows == 1) then
mob:useMobAbility(2575);
mob:setLocalVar("astralflows",2);
end




end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
    local ixion = killer:getVar("IxionWin");
	killer:PrintToPlayer("Ixion: A mere mortal defeat me...???",0x0D);
	killer:setVar("IxionChest",2);
	if (ixion ~= 1) then
	killer:setVar("IxionWin",1);
	killer:PrintToPlayer("You may now summon Ixion using Light Spirit pact under Astral Flow",0x15);
	end
	local timeleft = killer:getSpecialBattlefieldLeftTime();
	local reset = 600;
	local addtime = 0;
	
	if (timeleft > reset) then
    addtime = timeleft - reset;
    killer:addTimeToSpecialBattlefield(-addtime);
    killer:PrintToPlayer("Battlefield Timer has been reset to 5 minutes",0x0D);	
	elseif (timeleft <= reset) then
    addtime = timeleft + reset;
    killer:addTimeToSpecialBattlefield(addtime);
    killer:PrintToPlayer("Battlefield Timer has been reset to 5 minutes",0x0D);
	end


end;