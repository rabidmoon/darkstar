---------------------------------------------
--  Diffusion Ray
--
--  Description: Light Magic Damage
--  Type: Magical
--  Range: Conal
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


	local dmgmod = 3;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,ELE_LIGHT,dmgmod,0,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
