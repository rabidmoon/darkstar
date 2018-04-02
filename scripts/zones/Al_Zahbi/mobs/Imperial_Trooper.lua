-----------------------------------
-- Area: Throne Room
-- NPC:  Volker
-- Throne room volker npc bastok mission 9-2
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");


function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,3600);
	helperStrength(mob)
    mob:addHP(15000);	
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)


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
    local dead = GetServerVariable("Dead_Helpers");
	dead = dead + 1;
	SetServerVariable("Dead_Helpers",dead);
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



