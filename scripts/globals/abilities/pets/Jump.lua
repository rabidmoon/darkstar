---------------------------------------------------
-- Sneak Attack
-- Trust: Nanaa Mihgo
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
 local dmg = 0;
 local basedmg = pet:getWeaponDmg();
 local vit = pet:getStat(MOD_VIT);
 
 dmg = basedmg * (1 + (vit/256));
 
 target:delHP(dmg);
 pet:addTP(15.4);
 return dmg;

end;
