---------------------------------------------------
-- Rampanat Stance
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
--require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0, 0;
end;

function onPetAbility(target, pet, skill, action)
	local master = pet:getMaster()
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 4.5;

	local totaldamage = 0;
	skill:setSkillchain(50);	
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,3,3,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);

	
    target:addStatusEffect(EFFECT_STUN,1,0,6);
	master:delMP(9);
    return totaldamage;
	
	
end;
