---------------------------------------------------
-- Frog Kick
-- Deals damage to a single target.
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end