-----------------------------------
--
-- 	EFFECT_DODGE
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_EVA,effect:getPower());
	target:addMod(MOD_COUNTER,10);
	target:addMod(MOD_GUARD,10);
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
	target:delMod(MOD_EVA,effect:getPower());
	target:delMod(MOD_COUNTER,10);
	target:delMod(MOD_GUARD,10);
end;