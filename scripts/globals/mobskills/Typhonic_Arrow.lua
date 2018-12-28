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
	local dmgmod = 1;
	if (mob:getID() == 17051905) then
        dmgmod = 3.5;
	else
	    dmgmod = 9.5;
	end

    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,9,12,14);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

    target:delHP(dmg);
	if (not target:hasStatusEffect(EFFECT_SILENCE)) then
	    local duration = math.random(10,20);
	    target:addStatusEffect(EFFECT_SILENCE, 3, 0, duration)
	end
    return dmg;
end
