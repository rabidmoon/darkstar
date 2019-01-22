---------------------------------------------------
-- Jump
-- Trust: Excenmille
-- 
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    printf("Check Skill");
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    
	local dmg = mob:getHP();
    mob:addStatusEffect(EFFECT_POISON, 1500,3,6);
	
    target:delHP(dmg);
    return dmg;
end;
