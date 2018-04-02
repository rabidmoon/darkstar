-----------------------------------
--
-- EFFECT_SANCTION
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower(); -- 1 = regen, 2 = refresh, 3 = food.
    local subPower = effect:getSubPower(); -- subPower sets % required to trigger regen/refresh.

    -- target:addLatent(LATENT_SANCTION_EXP, ?, MOD_EXP_BONUS, ?);
    -- Possibly handle exp bonus in core instead

    if (power == 1) then
        -- target:addLatent(LATENT_SANCTION_REGEN, subPower, MOD_REGEN, 1);
    elseif (power == 2) then
        -- target:addLatent(LATENT_SANCTION_REGEN, subPower, MOD_REGEN, 1);
    elseif (power == 3) then
        -- target:addMod(MOD_FOOD_DURATION), ???);
        -- food duration not implemented.
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)

    -- Add/Remove Buffs based on trigger points
	-- Trigger Points Based on Consectutive wins
    local subPower = effect:getSubPower(); 
	local power = effect:getPower(); -- 1 = regen, 2 = refresh, 3 = food.
	local duration = target:getStatusEffect(EFFECT_SANCTION):getDuration();
	local hp = target:getHP();
	local mp = target:getMP();
	
	-- HP Regen
	if (power == 1) then
	    if (hp < subPower and target:hasStatusEffect(EFFECT_REGEN) == false) then -- Trigger Regen
        	target:addStatusEffect(EFFECT_REGEN,1,3,duration);
		elseif (hp >= subPower and target:hasStatusEffect(EFFECT_REGEN) == true) then -- Remove regen
		    target:delStatusEffect(EFFECT_REGEN);
		end
	end
	
	-- MP Refresh
	if (power == 2) then
	    if (mp < subPower and target:hasStatusEffect(EFFECT_REFRESH) == false) then -- Trigger Regen
        	target:addStatusEffect(EFFECT_REFRESH,1,3,duration);
		elseif (mp >= subPower and target:hasStatusEffect(EFFECT_REFRESH) == true) then -- Remove regen
		    target:delStatusEffect(EFFECT_REFRESH);
		end
	end














end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local power = effect:getPower(); -- 1 = regen, 2 = refresh, 3 = food.
    local subPower = effect:getSubPower(); -- subPower sets % required to trigger regen/refresh.

    -- target:delLatent(LATENT_SANCTION_EXP, ?, MOD_EXP_BONUS, ?);

    if (power == 1) then
        -- target:delLatent(LATENT_SANCTION_REGEN, subPower, MOD_REGEN, 1);
    elseif (power == 2) then
        -- target:delLatent(LATENT_SANCTION_REGEN, subPower, MOD_REGEN, 1);
    elseif (power == 3) then
        -- target:delMod(MOD_FOOD_DURATION), ???);
        -- food duration not implemented.
    end
end;