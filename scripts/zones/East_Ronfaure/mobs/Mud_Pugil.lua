-----------------------------------
--  Area: West Ronfaure
--  MOB:  Pugils
-----------------------------------

require("/scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,64,1);
end;