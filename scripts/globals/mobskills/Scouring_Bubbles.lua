---------------------------------------------
--  Vertical Slash
--
--  Description: Vertically slashes a single target. Additional effect: Accuracy Down
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 2;
	local dmgmod = 13;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,11,17,22);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

	-- local typeEffect = EFFECT_ACCURACY_DOWN;

    -- MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 25, 0, 120);

	target:delHP(dmg);
	return dmg;
end;
