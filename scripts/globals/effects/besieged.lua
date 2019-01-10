-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/keyitems");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    printf("Apply Effect");
	target:setVar("Besieged_Cure_Points",1);
	target:setVar("Besieged_WS_Points",1);
    local wins = GetServerVariable("Consecutive_BWins");
	local buff = wins * 2;
	if (buff >= 50) then
	    buff = 50;
	end
	
	
	target:addMod(MOD_DMGPHYS, -buff);
	target:addMod(MOD_DMGMAGIC, -buff);
	target:addMod(MOD_DMGRANGE, -buff);	
	target:setVar("BesiegedBuffs",buff);
	
	
	
	-- Load Temps!!!
	-- Based on Rank
	if (target:hasKeyItem(PSC_WILDCAT_BADGE) == true) then
	    target:PrintToPlayer("You have been gifted with Tier I Temp items!",0x15);
	    target:addTempItem(4181,1); -- Instant Reraise
	    target:addTempItem(5432,1); -- Dusty Ether	
	    target:addTempItem(5431,1); -- Dusty Potion	
	    target:addTempItem(5433,1); -- Dusty Elixir Restore 25% HP and MP		
	end
    if (target:hasKeyItem(PFC_WILDCAT_BADGE) == true) then
	    target:PrintToPlayer("You have been gifted with Tier II Temp items!",0x15);	
	    target:addTempItem(4155,1);	-- Remedy
	    target:addTempItem(5439,1);	-- Vicar's Drink
    end
	if (target:hasKeyItem(SP_WILDCAT_BADGE) == true) then
	    target:PrintToPlayer("You have been gifted with Tier III Temp items!",0x15);	
	    target:addTempItem(4144,1);	-- High Elixir Restores 50% hp and MP	
	    target:addTempItem(5435,1);	-- Fools Drink (null phys dmg)
	    target:addTempItem(5434,1);	-- Fans Drink (null mag dmg)		
    end
	if (target:hasKeyItem(LC_WILDCAT_BADGE) == true) then
	    target:PrintToPlayer("You have been gifted with Tier IV Temp items!",0x15);	
	    target:addTempItem(5388,1);	-- Assassins Drink	
	    target:addTempItem(5386,1);	-- Fighters Drink
	    target:addTempItem(4146,1);	-- Revitalizer	
    end	
    if (target:hasKeyItem(C_WILDCAT_BADGE) == true) then
	    target:PrintToPlayer("You have been gifted with Tier V Temp items!",0x15);	
	    target:addTempItem(4254,1); -- Mexalixir Restore 100% HP and MP
	    target:addTempItem(5242,1);	-- Wizards Drink MP+100%
	    target:addTempItem(5241,1);	-- Giants Drink HP+100%
	    target:addTempItem(5390,1);	-- Bravers Drink Attributes by 15	
    end		
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local tick = effect:getLastTick();
	-- 60 second evaluations
	 print(tick);
	if (tick == 1000 or tick == 800 or tick == 600 or tick == 400 or tick == 200) then
	    printf("tick");
	    local getcurepts = target:getVar("Besieged_Cure_Points");
		local getwspts = target:getVar("Besieged_WS_Points");
		local getmagpts = target:getVar("Besieged_Mag_Points");
		local totalbes = (math.floor(getcurepts / 10) + getwspts + getmagpts);
		
		-- divide total by 6 create new var Besieged_Eval_Cap which is set by Abquhbah

		local mercpoint = target:getVar("Mercenary_Points");
		local bescap = target:getVar("Besieged_Cap");

		
		
		
        -- local totalbes = getbes + bespoint; -- Get total points along with current points
		if (totalbes > bescap) then  -- set points given based on cap
		    totalbes = bescap;
		end	
		
		
		target:setVar("Mercenary_Points",totalbes + mercpoint);
		-- local totalpts = gettotal + mercpoint;
		local finalpts = target:getVar("Mercenary_Points");
		
		-- add cap based on rank

		target:PrintToPlayer("You gain "..totalbes.." Mercenary Points.  Total: "..finalpts.."",0x1C);
		
        -- Reset points
	    target:setVar("Besieged_Cure_Points",0);
		target:setVar("Besieged_WS_Points",0);
		target:setVar("Besieged_Mag_Points",0);	
    end		
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
   local zone = target:getZoneID();
   local buff = target:getVar("BesiegedBuffs");
   if (zone == 54 or zone == 62 or zone == 65) then
 		local getcurepts = target:getVar("Besieged_Cure_Points");
		local getwspts = target:getVar("Besieged_WS_Points");
		local getmagpts = target:getVar("Besieged_Mag_Points");
		local gettotal = (math.floor(getcurepts / 10) + getwspts + getmagpts);

		-- add cap based on rank
		
        target:addExp(gettotal);
	end	
	
	target:delMod(MOD_DMGPHYS, -buff);
	target:delMod(MOD_DMGMAGIC, -buff);
	target:delMod(MOD_DMGRANGE, -buff);

end;