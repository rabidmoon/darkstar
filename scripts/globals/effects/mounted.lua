-----------------------------------
--
-- EFFECT_MOUNTED
--
-----------------------------------
require("scripts/globals/status");


-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if effect:getPower() == 0 then
        target:ChangeMusic(4,212)
        target:setAnimation(ANIMATION_CHOCOBO)
    else
        target:ChangeMusic(4,84)
        target:setAnimation(ANIMATION_MOUNT)
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:setAnimation(ANIMATION_NONE);
end;