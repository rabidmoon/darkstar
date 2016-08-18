-----------------------------------
--  
-- 	EFFECT_LEVEL_RESTRICTION
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:levelRestriction(effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
 local duration = target:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getTimeRemaining();
 local zone = target:getZoneID();
	local seconds = math.floor(duration / 1000);
if (target:getObjType() == TYPE_PC) and (zone == 185) or (zone == 186) or (zone == 187) then	
	if (target:getVar("Dynamis_Time_Remaining") > 180000) then
	    target:setVar("Dynamis_Time_Remaining",duration);
		-- target:PrintToPlayer(duration);
	end	
	if (target:getVar("Dynamis_Time_Remaining") < 9000) then
	    target:setVar("Dynamis_Time_Remaining",duration);
        target:PrintToPlayer("You have "..seconds.." second(s) remaining in Dynamis", 0xD);
	end	
	    if (target:getVar("Dynamis_Time_Remaining") < 30000 and (target:getVar("Dynamis_Time_Remaining") > 27500)) then
	    target:setVar("Dynamis_Time_Remaining",duration);
        target:PrintToPlayer("You have 30 seconds remaining in Dynamis", 0xD);
	end	
    if (target:getVar("Dynamis_Time_Remaining") < 180000 and (target:getVar("Dynamis_Time_Remaining") > 177500)) then
	    target:setVar("Dynamis_Time_Remaining",duration);
        target:PrintToPlayer("You have 3 minutes remaining in Dynamis", 0xD);
	end	
	if (target:getVar("Dynamis_Time_Remaining") <= 177000) then
	    target:setVar("Dynamis_Time_Remaining",duration);
       -- target:PrintToPlayer(duration);
	end	
end	


if (target:getObjType() == TYPE_PC) and (zone == 86) then
   if (duration < 180000) and (duration > 177500) then
   target:PrintToPlayer("You have 3 minutes remaining until you are ejected", 0xD);
   elseif (duration < 30000) and (duration > 27500) then
   target:PrintToPlayer("You have 30 seconds remaining until you are ejected", 0xD);
   end
end   




end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local zone = target:getZoneID();
	target:levelRestriction(0);
	local chest = target:getVar("IxionChest");
	
	if (zone == 185) then
	target:setPos(161.000,-2.000,161.000,94,0xE6); -- Sandy
	elseif (zone == 186) then
	target:setPos(112.000,0.994,-72.000,127,0xEA); -- Bastok
	elseif (zone == 187) then
	target:setPos(-217.000,1.000,-119.000,94,0xEF);  -- Windurst
	elseif (zone == 86) and (chest == 1) then
	target:setVar("IxionChest",0);
	target:setPos(-319,0,523,94,0x62); -- S Campaign [S]
	elseif (zone == 86) and (chest == 2) then
	target:setVar("IxionChest",0);
	target:setPos(618,25,429,94,0x5A); -- Pashhow Marshlands [S]
	end

					        
end;