---------------------------------------------
--  Artificial Gravity
--
--  Description: Weight
--  Type: Magical
--  Wipe Shadows
--  Range: 10.0' AoE
--  Notes: 
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,MOBPARAM_1_SHADOW);
	target:delHP(dmg);

	local typeEffect1 = EFFECT_WEIGHT;

	MobStatusEffectMove(mob, target, typeEffect1, 4, 0, 25);

	return dmg;
end;
