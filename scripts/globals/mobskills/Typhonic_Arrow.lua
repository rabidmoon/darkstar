---------------------------------------------------
-- Typhonic Arrow
-- 
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 9.5;

    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,9,12,14);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

    target:delHP(dmg);
    return dmg;
end
