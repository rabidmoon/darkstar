-----------------------------------
-- Area: Halvung
-- NPC:  Gurfurlur the Menacing
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
	killer:addTitle(TROLL_SUBJUGATOR);
end;