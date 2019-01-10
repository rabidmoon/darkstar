-----------------------------------
--
--  EFFECT_INDI_PRECISION
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- printf("Regen adding");
	target:addMod(MOD_ACC, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)

-- Party Effect
    local plead = target:getPartyLeader();
	local geoname = target:getName();

	local nearbyChars = target:getTargetsWithinArea(8, 7);
    for i,member in ipairs(nearbyChars) do
	    if (member:getObjType() ~= TYPE_MOB and not member:hasStatusEffect(EFFECT_INDI_PRECISION) and member:getAllegiance() == target:getAllegiance() and geoname == plead) then
		    printf("Add effect");
		    member:addStatusEffect(EFFECT_ACCURACY_BOOST_II, effect:getPower(), 0, 3);
	    end
	end
	 
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_ACC, effect:getPower());
end;