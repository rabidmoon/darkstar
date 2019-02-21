-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Serjeant Tombstone
-- Map1 Position: http://www.dynamislounge.com/html/zone/frame_san1.htm
-- Map2 Position: http://www.dynamislounge.com/html/zone/frame_san2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, sandyList, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	

end;
