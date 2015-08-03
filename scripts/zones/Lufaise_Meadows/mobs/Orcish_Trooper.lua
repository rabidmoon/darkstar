
-----------------------------------
-- mob : Orcish Trooper
-- zone : Lufaise_Meadows
-----------------------------------




-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	local kills = killer:getVar("FOMOR_HATE");
	if (kills > 0) then
		killer:setVar("FOMOR_HATE",kills -1);
	end
end;