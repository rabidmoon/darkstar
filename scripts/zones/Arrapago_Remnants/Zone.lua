-----------------------------------
-- 
-- Zone: Arrapago_Remnants
-- 7 floors 90 min
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Arrapago_Remnants/TextIDs"] = nil;
require("scripts/zones/Arrapago_Remnants/TextIDs");
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    -- First Floor
    zone:registerRegion(1, 420, 5, -339, 0, 0, 0)  -- NW
    zone:registerRegion(2, 420, 5, -499, 0, 0, 0)  -- SW
    zone:registerRegion(3, 259, 5, -499, 0, 0, 0)  -- SE
    zone:registerRegion(4, 259, 5, -339, 0, 0, 0)   -- NE
	-- Second Floor
    zone:registerRegion(5, 340, 5, 100, 0, 0, 0)
	-- Third Floor
    zone:registerRegion(6, 339, 5, 419, 0, 0, 0)
    zone:registerRegion(7, 339, 5, 500, 0, 0, 0)
	-- Fourth Floor
    zone:registerRegion(8, -379, 5, -620, 0, 0, 0)
    zone:registerRegion(9, -300, 5, -461, 0, 0, 0)
	-- Fifth Floor
    zone:registerRegion(10, -339, 5, -99, 0, 0, 0)
	-- Sixth Floor
    zone:registerRegion(11, -339, 5, 300, 0, 0, 0)	
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
	
	
	local pos = player:getPos();
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
	    player:setPos(339,0,-593);
	end
     	-- 339 0 -593
	local sa = 0;
	local sb = 0;
	local ss = 0;
	local sz = 0;
	
	local arrwin = player:getVar("Arrapago_Win");
	local bhafwin = player:getVar("Bhafflau_Win");
	local silverwin = player:getVar("Silver_Win");
	local zhayolmwin = player:getVar("Zhayolm_Win");
	local reduction = 0;
	
	if (arrwin == 1) then
	    sa = 1;
	end

	if (bhafwin == 1) then
	    sb = 1;
	end

	if (silverwin == 1) then
	    ss = 1;
	end

	if (zhayolmwin == 1) then
	    sz = 1;
	end	
	
	reduction = sa + sb + ss + sz;
	local afloor = 1;
	local salvagelvl = player:getVar("Salvage_Level");
	if (salvagelvl == 0) then
	    salvagelvl = 15;
	elseif (salvagelvl >= 25 and salvagelvl <= 34) then
	    afloor = 2;
	elseif (salvagelvl >= 35 and salvagelvl <= 44) then
	    afloor = 3;
	elseif (salvagelvl >= 45 and salvagelvl <= 54) then
	    afloor = 4;
	elseif (salvagelvl >= 55 and salvagelvl <= 64) then
	    afloor = 5;
	elseif (salvagelvl >= 65 and salvagelvl <= 74) then
	    afloor = 6;		
	end
	player:setVar("Arrapago_Floor",afloor);
	
	local prevzone = player:getPreviousZone();
	if (prevzone == 72) then
	    salvagelvl = 15;
	end
	
	if (player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION) == false) then
	    player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,salvagelvl,3,5400);
	    -- player:PrintToPlayer("You have 100 minutes to complete your objective.", 0x15);	
	end
	
	local entertime = player:getVar("Salvage_Entry");
	local currentTime = os.time()
	local fixduration = currentTime - entertime;
	local finaltime = 5400 - fixduration;
	if (fixduration < 5400) then	
	    player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,salvagelvl,3,5400 - fixduration);
	    -- player:PrintToPlayer("You have 100 minutes to complete your objective.", 0x15);	
    else
		player:setVar("1st_Floor_NM",0);
	    player:setVar("2nd_Floor_NM",0);
	    player:setVar("3rd_Floor_NM",0);
	    player:setVar("4th_Floor_NM",0);
	    player:setVar("5th_Floor_NM",0);
	    player:setVar("6th_Floor_NM",0);
		player:setVar("Salvage_Floor",0);
		cs = 1;
    end		
   --  player:PrintToPlayer("You have 100 minutes to complete your objective.", 0x15);	
    return cs;


end;




-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)


    -- 200 Floor 2 top right
	-- 201 floor 2 bottom right
	-- 202 floor 2 bottom left
	-- 203 floor 2 top right
	-- 204 floor 3 center
	-- 205 floor 4 bottom
	-- 206 floor 4 top
	-- 207 floor 5 bottom left
	-- 208 floor 5 upper right
	-- 209 floor 6 
   local regionId = region:GetRegionID();
	-- FLOOR 1 TELEPORTS
	if (regionId == 1 and player:getVar("1st_Floor_NM") == 1) then
	    player:startEvent(200);
	elseif (regionId == 2 and player:getVar("1st_Floor_NM") == 1) then
	   player:startEvent(201);
	elseif (regionId == 3 and player:getVar("1st_Floor_NM") == 1) then
	   player:startEvent(202);
	elseif (regionId == 4 and player:getVar("1st_Floor_NM") == 1) then
	   player:startEvent(203);	   
	end
	
	-- FLOOR 2 TELEPORTS
	if (regionId == 5 and player:getVar("2nd_Floor_NM") == 1) then
	    player:startEvent(204);
	end

	-- FLOOR 3 TELEPORTS
	if (regionId == 6 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(205);
	elseif (regionId == 7 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(206);
    end

	-- FLOOR 4 TELEPORTS
	if (regionId == 8 and player:getVar("4th_Floor_NM") == 1) then
	    player:startEvent(207);
	elseif (regionId == 9 and player:getVar("4th_Floor_NM") == 1) then
	    player:startEvent(208);
    end	

	-- FLOOR 5 TELEPORTS
	if (regionId == 10 and player:getVar("5th_Floor_NM") == 1) then
	    player:startEvent(209);
	end

	-- FLOOR 6 TELEPORTS
	if (regionId == 11 and player:getVar("6th_Floor_NM") == 1) then
	    player:startEvent(210);
	end	
	
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

	if (csid >= 200 and csid <= 203 and option == 1) then
	    player:setVar("Arrapago_Floor",2);
		player:PrintToPlayer("Floor 2 - Max Cap: 35", 0x15);
	end
	if (csid == 204 and option == 1) then
	    player:setVar("Arrapago_Floor",3);
		player:setVar("2nd_Floor_NM",0);
		player:PrintToPlayer("Floor 3 - Max Cap: 45", 0x15);
	end	
	if (((csid == 205) or (csid == 206)) and option == 1) then
	    player:setVar("Arrapago_Floor",4);
		player:setVar("3rd_Floor_NM",0);
		player:PrintToPlayer("Floor 4 - Max Cap: 55", 0x15);
		if (player:getVar("Arrapago_Card") ~= 1) then
		    player:setVar("Arrapago_Card",1);
		    player:PrintToPlayer("Arrapago Card Price has been reduced!", 0x15);
		end
	end
	if (((csid == 207) or (csid == 208)) and option == 1) then
	    player:setVar("Arrapago_Floor",5);
		player:setVar("4th_Floor_NM",0);
		player:PrintToPlayer("Floor 5 - Max Cap: 65", 0x15);
	end	
    if (csid == 209 and option == 1) then
	    player:setVar("Arrapago_Floor",6);
		player:setVar("5th_Floor_NM",0);
		player:PrintToPlayer("Floor 6 - Max Cap: 75", 0x15);
	end	
    if (csid == 210 and option == 1) then
	    player:setVar("Arrapago_Floor",7);
		player:setVar("6th_Floor_NM",0);
		player:PrintToPlayer("Floor 7", 0x15);
	end		
	

	
end;




