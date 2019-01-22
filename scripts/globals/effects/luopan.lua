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
	local regen = target:getLocalVar("regen");
	local fury = target:getLocalVar("fury");
	local barrier = target:getLocalVar("barrier");
	local precision = target:getLocalVar("precision");
	local voidance = target:getLocalVar("voidance");
	local acumen = target:getLocalVar("acumen");
	local fend = target:getLocalVar("fend");
	local focus = target:getLocalVar("focus");	
	local slow = target:getLocalVar("slow");
	local attunement = target:getLocalVar("attunement");
	
	
	local str = target:getLocalVar("str");
	local dex = target:getLocalVar("dex");
	local agi = target:getLocalVar("agi");
	local vit = target:getLocalVar("vit");
	local chr = target:getLocalVar("chr");
	local mnd = target:getLocalVar("mnd");
	local int = target:getLocalVar("int");
	
	
	
	
	
	local poison = target:getLocalVar("poison");
	local damage = target:getLocalVar("dot"); -- get DoT Damage
	local potboost = target:getLocalVar("potboost"); -- get Potency Boost
	local effect = "";
	
	-- Buffs
	if (refresh == 1) then
	    effect = EFFECT_REFRESH_II;
	end	

	if (str == 1) then
	    effect = EFFECT_STR_BOOST_III;
	end
	
	if (dex == 1) then
	    effect = EFFECT_DEX_BOOST_III;
	end

	if (agi == 1) then
	    effect = EFFECT_AGI_BOOST_III;
	end

	if (vit == 1) then
	    effect = EFFECT_VIT_BOOST_III;
	end

	if (chr == 1) then
	    effect = EFFECT_CHR_BOOST_III;
	end

	if (mnd == 1) then
	    effect = EFFECT_MND_BOOST_III;
	end

	if (int == 1) then
	    effect = EFFECT_INT_BOOST_III;
	end	
	
	if (fury == 1) then
	    effect = EFFECT_ATTACK_BOOST_II;
	end
	
	if (barrier == 1) then
	    effect = EFFECT_DEFENSE_BOOST_II;
	end

	if (precision == 1) then
	    effect = EFFECT_ACCURACY_BOOST_II;
	end

	if (voidance == 1) then
	    effect = EFFECT_EVASION_BOOST_II;
	end	
	
	if (acumen == 1) then
	    effect = EFFECT_MAGIC_ATK_BOOST_II;
	end
	
	if (fend == 1) then
	    effect = EFFECT_MAGIC_DEF_BOOST_II;
	end
	
	if (focus == 1) then
	    effect = EFFECT_MAGIC_ACC_BOOST_II;
	end

	if (attunement == 1) then
	    effect = EFFECT_EVASION_BOOST_II;
	end	
	
	-- Debuffs
	
	if (poison == 1) then
	   effect = EFFECT_POISON;
	end
	
	
	-- printf("Pot Boost is %u",potboost);
	potency = math.floor(potency * (potboost/100));


	
	-- printf("LUOPAN IS NOW %u",poison);
	 printf("Potency on RIGHT NOW is %u",potency);
	
	-- Damage over Time for Luopan
	-- 1hp/tic at level 5 and then -18hp/tic at 75 (1260 hp)

	if (master:hasStatusEffect(EFFECT_DEMATERIALIZE)) then
	    damage = 0;
		target:addStatusEffect(EFFECT_PHYSICAL_SHIELD,0,1,0,6);
		target:addStatusEffect(EFFECT_MAGIC_SHIELD,0,1,0,6);
		target:addStatusEffect(EFFECT_ARROW_SHIELD,0,1,0,6);
    end		
	printf("The damage is %u",damage);
	target:delHP(damage);
	
	-- AoE Effects 
	-- local targets = master:getEnmityList();
	local party = master:getParty();
	local proxyMob = target:getTargetsWithinArea(9.5, 16);
	local nearbyChars = target:getTargetsWithinArea(8, 7);
    
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
	        for i,members in pairs(nearbyChars) do
			    if (members:getObjType() ~= TYPE_MOB and not members:hasStatusEffect(EFFECT_LUOPAN) and members:getAllegiance() == target:getAllegiance()) then
				    printf("Target Found!");
				    members:addStatusEffect(effect, potency, 3, 3);
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