---------------------------------------------------
-- Trick Attack
-- Trust: Lion
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
--require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0, 0;
end;

function onPetAbility(target, pet, skill)
 pet:addStatusEffectEx(EFFECT_TRUST_TRICK_ATTACK,EFFECT_TRICK_ATTACK,1,0,60);
 return EFFECT_TRICK_ATTACK;

end;
