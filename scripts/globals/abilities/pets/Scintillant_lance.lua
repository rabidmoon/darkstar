---------------------------------------------------
-- Rampanat Stance
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
--require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0, 0;
end;

function onPetAbility(target, pet, skill, action)
    local dINT = math.floor(pet:getStat(MOD_INT) - target:getStat(MOD_INT));
    local tp = skill:getTP();

    local damage = math.floor(825 + 0.25*(tp));
    damage = damage + (dINT * 1.5);
    damage = MobMagicalMove(pet,target,skill,damage,ELE_LIGHT,1,TP_NO_EFFECT,0);
    damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_LIGHT);
    damage = AvatarFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

    target:delHP(damage);
    target:updateEnmityFromDamage(pet,damage);

	target:delHP(damage);
    return damage;
end;
