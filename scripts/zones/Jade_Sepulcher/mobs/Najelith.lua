-----------------------------------
-- Area: Jade Sepulcher
-- MOB: Najelith
-----------------------------------

package.loaded["scripts/zones/Jade_Sepulcher/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Jade_Sepulcher/TextIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
	
end;

function onMobSpawn(mob)
    mob:setLocalVar("Ranged_Attack",0);
	mob:setLocalVar("HasteBuff",1);
	mob:setLocalVar("Barrage",1);		
	mob:setLocalVar("EES",1);
end
-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local currentBtime = mob:getBattleTime();
	local rangedAttack = mob:getLocalVar("Ranged_Attack");
	local haste = mob:getLocalVar("HasteBuff");
	local barr = mob:getLocalVar("Barrage");	
    -- Ranged Attacks

	--mob:setLocalVar("EES",1);


	local ees = mob:getLocalVar("EES");
	local twohr = math.random(30,60);
	local hp = mob:getHPP();
	
	
	if (haste == 1 and hp < 50) then
	    mob:addMod(MOD_HASTE_MAGIC,1500);
	    mob:setLocalVar("HasteBuff",2);	
		mob:addStatusEffect(EFFECT_ENAERO, 10, 0, 1500);
	elseif (barr == 1 and hp < 25) then
	    mob:addMod(MOD_RATT,40);
		mob:addMod(MOD_DEF,110);
	    mob:setLocalVar("Barrage",2);
    end
		
    if (hp < twohr and ees == 1) then
        mob:useMobAbility(763);
        mob:setLocalVar("EES",0);
    end		
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onMonsterMagicPrepare(mob, target)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, killer)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local party;
	if (killer:getObjType() == TYPE_PET) then
	    local player = killer:getMaster();
	elseif (killer:getObjType() == TYPE_PC) then
	    local player = killer;
	end
	party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
			    player:PrintToPlayer("Najelith : You've done well...visit me in Aht Urghan when you get a chance." ,0x0D);
                v:setVar("Najelith_Fight",2); 
           end
        end
end;