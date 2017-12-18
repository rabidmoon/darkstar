-----------------------------------
-- Area: Maquette Abdhaljs Legion
-- NPC:  Manticore NM
-- Endurance
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- mob:untargetable(true);
     mob:setPos(-15,15,85);
	 mob:addStatusEffect(EFFECT_BIND,1,0,1200);
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   
end;

function onMobFight(mob,target)
   
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
    -- local tpb = killer:getVar("TrustPointBonus");
	-- if (tpb < 5) then
	-- killer:setVar("TrustPointBonus",5);
	-- end
end;
