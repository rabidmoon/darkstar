-----------------------------------
-- Area: Ghelsba outpost
-- NPC:  Furies
-- BCNM20
-----------------------------------


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:setLocalVar("alive",1);
end;


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
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
    mob:setLocalVar("alive",0);
end;
