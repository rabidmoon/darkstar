---------------------------------------------------
-- Trust Barrage
-- Trust: Najelith
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
 pet:addStatusEffect(EFFECT_TRUST_BARRAGE,1,0,30);
 return EFFECT_BARRAGE;

end;
