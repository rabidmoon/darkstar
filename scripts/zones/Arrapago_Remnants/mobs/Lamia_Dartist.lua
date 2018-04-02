-----------------------------------
-- Area:
-- NPC:  Lamia_Dartist
-- If certain PH is killed spawn Demonic Pugil
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvageambiance");
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local MobID = mob:getID();
	local chance = math.random(1,100);
    local pugil = 17080534;  -- Replace with Mega
    local nmpop = 30;
	local ph = Arrapago.ph[1].LAMIA_DARTIST1;
	if (MobID == ph) then
        if (killer:getObjType() == TYPE_PC) then
            killer:PrintToPlayer("A heavy aura can be sensed nearby...",0x15);
	    end
	    SpawnMob(pugil);               
	end
end;