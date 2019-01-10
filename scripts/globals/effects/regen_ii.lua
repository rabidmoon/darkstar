-----------------------------------
--
--  EFFECT_REGEN_II
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

	-- target:addMod(MOD_REGEN, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    printf("TICK ON REGEN");
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	-- target:delMod(MOD_REGEN, effect:getPower());
end;