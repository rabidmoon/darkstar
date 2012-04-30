-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Behemoth
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setTitle(BEHEMOTHS_BANE);
end;