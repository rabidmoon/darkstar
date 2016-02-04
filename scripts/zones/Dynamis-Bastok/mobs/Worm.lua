-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Avatar Icon
-- Map1 Position: http://images2.wikia.nocookie.net/__cb20090312004752/ffxi/images/8/84/Win1.jpg
-- Map2 Position: http://images2.wikia.nocookie.net/__cb20090312004839/ffxi/images/6/61/Win2.jpg
-----------------------------------
package.loaded["scripts/zones/Dynamis-Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Windurst/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

end;


-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)


end;
    

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local duration = 45;
	local attBoost = 10;
	local level = killer:getMainLvl();
	local scyld = level - 65;
	

	
	if ((math.random(1,100) >= 50)) then
	killer:addStatusEffect(EFFECT_DEFENSE_BOOST,attBoost,0,duration);
	killer:PrintToPlayer("The Worm has endowed you with a Defense Bonus.", 0xD);
	end
	killer:addCurrency("scyld", scyld);
	killer:PrintToPlayer(string.format("%s gains "..scyld.." scyld.", killer:getName()), 0x15);
	
end;
