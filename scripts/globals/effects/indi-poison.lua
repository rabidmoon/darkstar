-----------------------------------
--
--  EFFECT_INDI_POISON
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)   

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)

-- Place Aura on Mob

	local nearbyTargets = target:getTargetsWithinArea(7, 8);
    for i,member in ipairs(nearbyTargets) do
	    if (member:getObjType() == TYPE_MOB) then
		    local mob = member:getID();
			GetMobByID(mob):updateEnmity(target);
		    member:addStatusEffect(EFFECT_POISON_II, effect:getPower(), 0, 6);
	    end
	end
	 
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;