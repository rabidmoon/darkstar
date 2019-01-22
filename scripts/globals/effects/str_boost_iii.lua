-----------------------------------
--
--  EFFECT_STR_BOOST_III
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR,effect:getPower());
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
	local boostSTR_effect_size = effect:getPower();
	if (boostAGI_effect_size > 0) then
		target:delMod(MOD_STR,boostSTR_effect_size);
	end
end;
