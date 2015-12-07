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
    local duration = target:getStatusEffect(EFFECT_VISITANT):getTimeRemaining();
	local seconds = math.floor(duration / 1000);
    if (target:getVar("Abyssea_Time") >= 3) then
        target:setVar("Abyssea_Time",duration);
    end
	
	
-- TODO: messages about remaining time.
-- Some will need to handled outside of this effect (zone ejection warnings after visitant is gone).
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;