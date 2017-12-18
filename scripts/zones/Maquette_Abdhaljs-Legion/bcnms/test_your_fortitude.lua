-----------------------------------
-- Area: Horlias peak
-- Name: under_observation
-- BCNM40
-----------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Horlais_Peak/TextIDs");

-- List of spawning points
-- 12 9 -12 109

-- 12 10 52 68

-- -52 10 52 23

-- -52 9 -12 157

-- Main Mob -20 12 19 1

-- ZOne in 28 12 19 180


-----------------------------------
-- EXAMPLE SCRIPT
-- 
-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool, 
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
    print("leave code "..leavecode);
	
	
	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		-- player:setVar("KUPIPI_TRIB_FIGHT",2);  -- Win Fight
	elseif (leavecode == 3) then
	    DespawnMob(17526936);
		-- printf("Despawning Mammet");
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end
	
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);	
end;
