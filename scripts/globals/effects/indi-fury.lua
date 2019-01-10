-----------------------------------
--
--  EFFECT_ATTACK_BOOST_II
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    printf("Attack POWA adding");
	target:addMod(MOD_ATTP, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
printf("TICK");
-- Party Effect
    local plead = target:getPartyLeader();
	local geoname = target:getName();

	local nearbyChars = target:getTargetsWithinArea(9.5, 7);
    for i,member in ipairs(nearbyChars) do
	    if (member:getObjType() ~= TYPE_MOB and not member:hasStatusEffect(EFFECT_INDI_FURY) and member:getAllegiance() == target:getAllegiance() and geoname == plead) then
		    member:addStatusEffect(EFFECT_ATTACK_BOOST_II, effect:getPower(), 0, 3);
	    end
	end
	 
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_ATTP, effect:getPower());
end;