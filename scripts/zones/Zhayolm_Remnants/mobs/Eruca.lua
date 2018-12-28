-----------------------------------
-- Area:
-- NPC:  Eurca
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("Stagger",1);
	mob:setLocalVar("MagicCount",1);

	

end;

function onMobEngaged(mob,target)

	local level = target:getMainLvl();
	local ptsize = target:getPartySize();
	local sizediff = level - 29;
	if (ptsize > 8) then
	    sizediff = sizediff + 5;
	elseif (ptsize > 6) then
	    sizediff = sizediff + 3;
	end
	
	mob:addMod(MOD_ATT,3*sizediff);
	mob:addMod(MOD_DEF,19*sizediff);
	mob:addMod(MOD_ACC,4*sizediff);
	mob:addMod(MOD_MACC,2*sizediff);		
	mob:addMod(MOD_EVA,9*sizediff);
	mob:addMod(MOD_INT,2*sizediff);
	mob:addMod(MOD_CHR,2*sizediff);
	mob:addMod(MOD_MND,2*sizediff);
	mob:addMod(MOD_STR,2*sizediff);
    mob:addMod(MOD_VIT,2*sizediff);
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,sizediff*11,0,5000);
	mob:addHP(5000);
	
	
	
	   
	printf("Engaged");

end

function onMobFight(mob,target)
 
    local battletime = mob:getBattleTime();
    local pd = mob:getLocalVar("PD");
	local randpd = math.random(90,115);

    if (battletime > pd + randpd) then
        mob:useMobAbility(437);
        mob:setLocalVar("PD", battletime);
	end


end;

function onMagicHit(caster, target, spell)
    local count = target:getLocalVar("MagicCount");
    if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getElement() == 3) then
	    if (count < 20) then
		    target:addMod(MOD_DEF,-5);
			count = count + 1;
			printf("Weakened Target");
			target:setLocalVar("MagicCount",count);
			target:dispelStatusEffect();
			return EFFECT_DEFENSE_DOWN;
		end
	else
	    return 0;
	end
	


end

function onWeaponskillHit(mob, attacker, weaponskill)
    local stagger = mob:getLocalVar("Stagger");
    if (weaponskill == 2 or weaponskill == 18 or weaponskill == 65 or weaponskill == 82 or weaponskill == 97 or weaponskill == 130
        or weaponskill == 162 or weaponskill == 179 or weaponskill == 209) then
		if (stagger == 1) then
	        mob:weaknessTrigger(3);
			mob:setLocalVar("Stagger",2);
			mob:setLocalVar("PD",700);  -- Stagger "removes" perfect dodge
		    mob:addStatusEffect(EFFECT_TERROR,1,0,5);
		    return EFFECT_TERROR;
		end
	else
	    return 0;
	end
end
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("3rd_Floor_NM",1);
    else
        killer:PrintToPlayer("The device emits a faint hum...",0x15);
		killer:setVar("3rd_Floor_NM",1);
    end	
 
end;