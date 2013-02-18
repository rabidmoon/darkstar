---------------------------------------------------
-- Geocrush
-- Titan deals Earth elemental damage and stuns target.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_STUN;
	if(applyPlayerResistance(mob,typeEffect,target,true,EFFECT_STUN,MOD_INT, ELE_EARTH) > 0.5) then
		if(target:hasStatusEffect(typeEffect) == false) then
			target:addStatusEffect(typeEffect,1,0,6);
		end
	end

	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_EARTH,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;

end