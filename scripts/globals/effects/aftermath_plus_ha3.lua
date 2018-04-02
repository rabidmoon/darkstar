-----------------------------------
--
-- EFFECT_AFTERMATH_PLUSHA3
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
    if (effect:getTickCount() == 3) then
		target:delStatusEffectSilent(EFFECT_AFTERMATH_PLUSHA3);
        target:addStatusEffectEx(EFFECT_LEVEL_FOUR_SC,EFFECT_AFTERMATH_LV3,0,3,50);		
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;