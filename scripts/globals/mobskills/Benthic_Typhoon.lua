---------------------------------------------
--  Benthic Typhoon
--
--  Description: Delivers an area attack that lowers target's defense and magic defense. Damage varies with TP.
--  Type: Physical (Piercing)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
	target:delHP(dmg);

	local hit = MobPhysicalHit(skill, dmg, target, info.hitslanded);
	local statmod = MOD_INT;
	local typeEffect = EFFECT_MAGIC_DEF_DOWN;
	local resist;
	if(hit) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_THUNDER);
		if(resist > 0.2) then
			target:delStatusEffect(typeEffect);
			target:addStatusEffect(typeEffect,30,0,60*resist);--power=30;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_DEFENSE_DOWN;
	if(hit) then

		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
		if(resist > 0.2) then
			target:delStatusEffect(typeEffect);
			target:addStatusEffect(typeEffect,30,0,60*resist);--power=30;tic=0;duration=60;
		end
	end

	return dmg;
end;
