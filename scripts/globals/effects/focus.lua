-----------------------------------
--
-- 	EFFECT_FOCUS
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_ACC,effect:getPower());
   target:addMod(MOD_MARTIAL_ARTS,15);
   target:addMod(MOD_ATT,15);
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
   target:delMod(MOD_ACC,effect:getPower());
   target:delMod(MOD_MARTIAL_ARTS,15);
   target:delMod(MOD_ATT,15);
end;