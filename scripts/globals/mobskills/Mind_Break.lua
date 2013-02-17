---------------------------------------------
--  Mind Break
--
--  Description: Reduces maximum MP in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local message = MSG_MISS;
    local typeEffect = EFFECT_MAX_MP_DOWN;
    if(target:isFacing(mob)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_DARK);
        if(resist > 0.1) then
            message = MSG_ENFEEB_IS;
            target:delStatusEffect(typeEffect);
            target:addStatusEffect(typeEffect,42,0,120*resist);--power=30;tic=0;duration=120;
        end
    else
        message = MSG_NO_EFFECT;
    end
    skill:setMsg(message);
    return typeEffect;
end;
