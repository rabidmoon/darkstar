-----------------------------------
-- Area: Al Zahbi
-- NPC:  Rughadjeen
-- Campaign General
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");


function onMobInitialize(mob)

end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

	mob:setMobMod(MOBMOD_ROAM_COOL, 20);
	mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,3600);
	generalStrength(mob)
    mob:addHP(55000);
end;

function onMobEngaged(mob, target)

end;

function onMobFight(mob, target)
   -- if (mob:getTP() > 100) then
   -- mob:useMobAbility(1878);
   -- end
end;

function onMonsterMagicPrepare(mob)


end;

function onSpellPrecast(mob, spell)
 

end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    printf("General Rughadjeen has fallen");
	local besieged = GetServerVariable("Besieged_Horde");	
    local captured = GetServerVariable("Generals_Captured");
	local players = mob:getZone():getPlayers();	
	for i, person in pairs(players) do
        person:PrintToPlayer("General Rughadjeen has fallen",0x1C);
	end		
    SetServerVariable("RughadjeenCapture",1);
	captured = captured + 1;	
	SetServerVariable("Generals_Captured",captured);	
    -- Set Prisoner Status
	if (besieged == 1) then
	    SetServerVariable("Rughadjeen_Prison",1);
		local rud = GetNPCByID(16998975);
	    rud:setStatus(STATUS_NORMAL);
	elseif (besieged == 2) then
	    SetServerVariable("Rughadjeen_Prison",2);	
		local rud = GetNPCByID(17031704);
	    rud:setStatus(STATUS_NORMAL);	
	elseif (besieged == 3) then
	    SetServerVariable("Rughadjeen_Prison",3);
		local rud = GetNPCByID(17043982);
	    rud:setStatus(STATUS_NORMAL);		
	end	
end;

function onPath(mob)
   
    besiegedGeneralAggro(mob) 
    local zone = mob:getZone();
	local players = zone:getPlayers();
   -- for i,v in pairs(players) do
     --   if (mob:checkDistance(v) < 30 and v:getHPP() < 50) then
	   --     printf("Player needs a cure");
		--	mob:setLocalVar("Cure",1);
	    -- end
    -- end
end;


function onMobRoamAction(mob)
    


end



