---------------------------------------------------
-- Sentinel
-- Trust: Curilla
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
 pet:addStatusEffect(EFFECT_TRUST_SENTINEL,90,3,30,0,0);
 return EFFECT_SENTINEL;

end;
