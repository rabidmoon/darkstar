-----------------------------------
--
--  EFFECT_DEFENSE_BOOST_II
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)   
	target:addMod(MOD_DEF, effect:getPower());
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
	    if (member:getObjType() ~= TYPE_MOB and not member:hasStatusEffect(EFFECT_INDI_BARRIER) and member:getAllegiance() == target:getAllegiance() and geoname == plead) then
		    member:addStatusEffect(EFFECT_DEFENSE_BOOST_II, effect:getPower(), 0, 3);
	    end
	end
	 
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEF, effect:getPower());
end;