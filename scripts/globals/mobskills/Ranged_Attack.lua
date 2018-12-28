---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local tp = mob:getTP();
	mob:setLocalVar("TP",tp);
	return 0;
	
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
	local dmgmod = 1;
	if (mob:getID() == 17051905) then
	    dmgmod = 0.5;
	else
        dmgmod = 1.5;
	end

    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

	if (mob:getID() == 17051905) then
        if (dmg > 0) then
            local mobtp = mob:getLocalVar("TP");
           mob:addTP(mobtp);
		   print(mobtp);
        end
	end

    target:delHP(dmg);
    return dmg;
end;
