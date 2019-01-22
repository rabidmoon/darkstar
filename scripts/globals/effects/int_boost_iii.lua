-----------------------------------
--
--  EFFECT_INT_BOOST_III
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_INT,effect:getPower());
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
	local boostINT_effect_size = effect:getPower();
	if (boostAGI_effect_size > 0) then
		target:delMod(MOD_INT,boostINT_effect_size);
	end
end;
