-----------------------------------
-- Area: Al Zahbi
-- NPC:  Najelith
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
end;

function onMonsterMagicPrepare(mob)


end;

function onSpellPrecast(mob, spell)
 

end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    printf("General Najelith has fallen");
	local besieged = GetServerVariable("Besieged_Horde");	
    local captured = GetServerVariable("Generals_Captured");
	local players = mob:getZone():getPlayers();	
	for i, person in pairs(players) do
        person:PrintToPlayer("General Najelith has fallen",0x1C);
	end		
    SetServerVariable("NajelithCapture",1);
	captured = captured + 1;	
	SetServerVariable("Generals_Captured",captured);
    -- Set Prisoner Status
	if (besieged == 1) then
	    SetServerVariable("Najelith_Prison",1);
		local pris = GetNPCByID(16998979);
	    pris:setStatus(STATUS_NORMAL);
	elseif (besieged == 2) then
	    SetServerVariable("Najelith_Prison",2);	
		local pris = GetNPCByID(17031708);
	    pris:setStatus(STATUS_NORMAL);	
	elseif (besieged == 3) then
	    SetServerVariable("Najelith_Prison",3);
		local pris = GetNPCByID(17043986);
	    pris:setStatus(STATUS_NORMAL);			
	end	
end;

function onPath(mob)
   
    besiegedNPCAggro(mob) 
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



