---------------------------------------------------
-- Archeron Kick
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
	local master = pet:getMaster();
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 12;
	local dmgmodsubsequent = 0;
	local totaldamage = 0;
	skill:setSkillchain(135);
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);

	target:updateEnmityFromDamage(pet,totaldamage);
    target:addStatusEffect(EFFECT_STUN,1,0,6);
	target:delHP(totaldamage);
	master:delMP(150);
	return totaldamage;
 	
end;
