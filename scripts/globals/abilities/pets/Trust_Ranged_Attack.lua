---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
-- Dex causes extra damage as noted by using Thunder maneuver
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/trustweaponskills");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onPetAbility(target, pet, skill)
    -- Simple function to calculate ranged damage here instead of in core for Trust
	local tpreturn = 19;
    local level = pet:getMainLvl();
	local dmg = 0;
	local hits = 0;
	local barrage = 0;
	local fstr = 0;		
	local ranged = pet:getRangedDmg();
    local str = pet:getStat(MOD_STR);
	local vit = target:getStat(MOD_VIT);
	local dstr = str - vit;
	local att = pet:getMod(MOD_RATT);
	local def = target:getStat(MOD_DEF);
	local ragi = pet:getStat(MOD_AGI);
	local agi = target:getStat(MOD_AGI);
	local dagi = math.floor((ragi - ragi) / 10);
	local critrate = 10 + dagi;
	local cratio = 0;
	local chance = math.random(1,100);
	if (chance < critrate) then
	    cratio = (att / def) * 1.25;
	else
	    cratio = (att / def);
	end
	
	-- randomize the pdif damage
	local ratio = math.random((cratio*0.8)*1000, (cratio*1.2)*1000);
	ratio = ratio / 1000;


    -- calculate fstr
	if (dstr >= 12) then
	    fstr = (dstr + 4) / 2;
	elseif (dstr >= 6 and dstr <= 11) then
	    fstr = (dstr + 6) / 2;
	elseif (dstr >= 1 and dstr <= 5) then
	    fstr = (dstr + 7) / 2;
	elseif (dstr >= -2 and dstr <= 0) then
	    fstr = (dstr + 8) / 2;
	elseif (dstr >= -7 and dstr <= -3) then
	    fstr = (dstr + 9) / 2;
	elseif (dstr >= -15 and dstr <= -8) then
	    fstr = (dstr + 10) / 2;
	elseif (dstr >= -21 and dstr <= -16) then
	    fstr = (dstr + 12) / 2;
	elseif (dstr <= -22) then
	    fstr = (dstr + 13) / 2;
    end	

    -- Cap values
	local rank = math.floor(ranged / 9);
	local lowerCap = -(7 + rank*2)*2;
	local upperCap = (14 + rank*2)*2;
	
	if (fstr <= lowerCap) then
	    fstr = lowerCap;
	elseif (fstr >= upperCap) then
	    fstr = upperCap;
	end	
	
	-- lets calculate hitrate
	local acc = pet:getACC();
	local eva = target:getEVA();
	local hitrate = 75 + math.floor((acc - eva) / 2);
	

	if (pet:hasStatusEffect(EFFECT_TRUST_BARRAGE)) then
	    -- calculate barrage here
		if (level < 50) then
		    barrage = 4;
		elseif (level < 74) then
		    barrage = 5;
		elseif (level >= 75) then
		    barrage = 6;
		end
		
		for i = 1,barrage,1
		do
		    local bchance = math.random(1,100);
		    if (bchance <= hitrate) then
			    dmg = dmg + ((ranged + fstr) * ratio);
				hits =  hits + 1; -- Handle TP return			
			else
			    break;
			end
		end
		-- pet:delStatusEffect(EFFECT_TRUST_BARRAGE);
		-- printf("Deleting Barrage");
	else
	    local hitchance = math.random(1,100);
		if (hitchance <= hitrate) then
	        dmg = (ranged + fstr) * ratio;
			hits = 1;
		else
		    dmg = 0; -- Miss
		end
	end
	
    target:delHP(dmg);
	
	if (pet:hasStatusEffect(EFFECT_TRUST_BARRAGE)) then
		pet:delStatusEffect(EFFECT_TRUST_BARRAGE);
		printf("Deleting Barrage");
	end
	if (dmg > 0 and hits == 1) then -- Single non barrage hit
	    pet:addTP(tpreturn);
	elseif (dmg > 0 and hits > 1) then -- barrage hit
	    tpreturn = hits * tpreturn;
		pet:addTP(tpreturn);
	end
    return dmg;

end;

function fstrCalc(target, pet)
    local str = pet:getStat(MOD_STR);
	local vit = target:getStat(MOD_VIT);
	local dstr = str - vit;
	local fstr = 0;
	local ranged = pet:getRangedDmg();

	
	
	if (dstr >= 12) then
	    fstr = (dstr + 4) / 2;
	elseif (dstr >= 6 and dstr <= 11) then
	    fstr = (dstr + 6) / 2;
	elseif (dstr >= 1 and dstr <= 5) then
	    fstr = (dstr + 7) / 2;
	elseif (dstr >= -2 and dstr <= 0) then
	    fstr = (dstr + 8) / 2;
	elseif (dstr >= -7 and dstr <= -3) then
	    fstr = (dstr + 9) / 2;
	elseif (dstr >= -15 and dstr <= -8) then
	    fstr = (dstr + 10) / 2;
	elseif (dstr >= -21 and dstr <= -16) then
	    fstr = (dstr + 12) / 2;
	elseif (dstr <= -22) then
	    fstr = (dstr + 13) / 2;
    end	

    -- Cap values
	local rank = math.floor(ranged / 9);
	local lowerCap = -(7 + rank*2)*2;
	local upperCap = (14 + rank*2)*2;
	
	if (fstr <= lowerCap) then
	    fstr = lowerCap;
	elseif (fstr >= upperCap) then
	    fstr = upperCap;
	end
	
	return fstr;

end;
