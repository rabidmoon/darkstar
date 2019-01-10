-----------------------------------
--
--  EFFECT_LUOPAN
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local master = target:getMaster();
	local level = master:getMainLvl();
	local bufftype = target:getLocalVar("bufftype");
	local potency = target:getLocalVar("Potency");
    local refresh = target:getLocalVar("refresh");
	local poison = target:getLocalVar("poison");
	local damage = target:getLocalVar("dot"); -- get DoT Damage
	local effect = "";
	
	if (refresh == 1) then
	    effect = EFFECT_REFRESH_II;
	end
	
	if (poison == 1) then
	   effect = EFFECT_POISON;
	end


	
	printf("LUOPAN IS NOW %u",poison);
	printf("Potency on RIGHT NOW is %u",potency);
	
	-- Damage over Time for Luopan
	-- 1hp/tic at level 5 and then -18hp/tic at 75 (1260 hp)
    if (master:hasStatusEffect(EFFECT_LASTING_EMANATION)) then
	    damage = damage - (math.floor(level / 15));
	elseif (master:hasStatusEffect(EFFECT_ECLIPTIC_ATTRITION)) then
	    damage = damage + (math.floor(level / 16));	
	end
	
	target:delHP(damage);
	
	-- AoE Effects 
	-- local targets = master:getEnmityList();
	local party = master:getParty();
	local proxyMob = target:getTargetsWithinArea(9.5, 16);
    
	if (bufftype == 2) then
	    for i,monsters in ipairs(proxyMob) do
		    if (monsters:getObjType() == TYPE_MOB) then
                if (poison == 1) then 
                    monsters:addStatusEffect(effect, potency, 3, 6);
				end  
			    
		    end
	    end
    elseif (bufftype == 1) then
	    if (party ~= nil) then
	        for i,members in pairs(party) do
			    if (members:checkDistance(target) < 10) then
				    members:addStatusEffect(effect, potency, 0, 3);
				end
			end
		else
		    if (master:checkDistance(target) < 10) then
			    master:addStatusEffect(effect, potency, 0, 3);
			end
		end
	end
	
	
	
	

	
	
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;