---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
-- Dex causes extra damage as noted by using Thunder maneuver
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/trustweaponskills");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onPetAbility(target, pet, skill)
    local basemod = 1;
    local numhits = 1;
	local attmod = 1;
    local accmod = 0;
	local defignore = 1;
	local str_wsc = 0;
	local dex_wsc = 0.75;
	local agi_wsc = 0;
	local vit_wsc = 0;
	local mnd_wsc = 0;
	local acc = pet:getACC();
    local eva = target:getEVA();
	local hitrate = 0;
	local trustlvl = pet:getMainLvl();
	local hitcalc = acc - eva;	
	local barrage = 1;
	
	-- Barrage Calculations	
	if (pet:hasStatusEffect(EFFECT_TRUST_BARRAGE)) then
	    if (hitcalc >= 10) then
	        if (trustlvl < 50) then
		    barrage = math.random(3,4);
		    elseif (trustlvl < 74) then
		    barrage = math.random(4,5);
		    elseif (trustlvl >= 75) then
		    barrage = math.random(5,6);
		    end
        elseif (hitcalc > -30) then
	       if (trustlvl < 50) then
		    barrage = math.random(2,3);
		    elseif (trustlvl < 74) then
		    barrage = math.random(3,4);
		    elseif (trustlvl >= 75) then
		    barrage = math.random(4,5);
		    end	
        else
	        if (trustlvl < 50) then
		    barrage = math.random(2,3);
		    elseif (trustlvl < 74) then
		    barrage = math.random(3,4);
		    elseif (trustlvl >= 75) then
		    barrage = math.random(4,5);
		    end	
        end
    end		

	
	
	
	
	local info = AutoRangedMove(pet,target,skill,basemod,numhits,attmod,accmod,defignore,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_NO_EFFECT,1,1,1);
 
    local dmg = MobFinalAdjustments(info.dmg,pet,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
	printf("Barrage is %u",barrage);
	dmg = dmg * barrage;
	if (dmg > 0) then
       target:addTP(2 * barrage);
       pet:addTP(14 * barrage);
    end

	if (pet:hasStatusEffect(EFFECT_TRUST_BARRAGE)) then
	    pet:delStatusEffect(EFFECT_TRUST_BARRAGE);
		printf("Deleting Barrage");
	end
	
    target:delHP(dmg);
    return dmg;

end;
