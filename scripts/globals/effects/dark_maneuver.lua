-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
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
local dark = target:getEffectsCount(EFFECT_DARK_MANEUVER);
if (dark == 0) then
local pet = target:getPet();
pet:setMod(MOD_REFRESH, 0);
end
end;