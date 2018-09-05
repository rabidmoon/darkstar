---------------------------------------------------
-- Rampanat Stance
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
--require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onpetSkillCheck(target,pet,skill)
    return 0, 0;
end;

function onPetAbility(target, pet, skill, action)
    local master = pet:getMaster();
	base = pet:getMainLvl() + 3*pet:getMainLvl()*(skill:getTP()/100); --base is around 5~150 level depending
	M = 5;
	multiplier = 1+(1- (pet:getHP()/pet:getMaxHP())) * M;	--higher multiplier the lower your HP. at 15% HP, multiplier is 1+0.85*M
	base = base * multiplier;
	
	skill:setMsg(MSG_SELF_HEAL);
    pet:addStatusEffect(EFFECT_MAGIC_DEF_BOOST,30,0,45);
	master:delMP(150);
	return MobHealMove(target, base);
end;
