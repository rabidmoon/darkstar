-----------------------------------
-- 
-- Zone: Zhayolm_Remnants
--   7 Floors 90 min
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Zhayolm_Remnants/TextIDs"] = nil;
require("scripts/zones/Zhayolm_Remnants/TextIDs");
require("scripts/globals/status");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    -- 1st Floor Teleporters
    zone:registerRegion(1, 419, 5, -340, 0, 0, 0)  -- NE	
    zone:registerRegion(2, 419, 5, -499, 0, 0, 0)  -- SE
    zone:registerRegion(3, 258, 5, -499, 0, 0, 0)  -- SW
    zone:registerRegion(4, 258, 5, -340, 0, 0, 0)  -- NW
 
	-- 2nd Floor Teleporters
    -- zone:registerRegion(5, 348, 15, -49, 0, 0, 0)  -- Center	
	-- zone:registerRegion(5, 343, -5, -63, 336, -7, -56)
	zone:registerRegion(5, 339, 4, -59, 0, 0, 0)	
	-- 3rd Floor Teleporters
    zone:registerRegion(6, 339, 5, 419, 0, 0, 0)  -- 	South	
    zone:registerRegion(7, 339, 5, 499, 0, 0, 0)  -- 	North
	-- 4th Floor Teleporters
    zone:registerRegion(8, -380, 5, -619, 0, 0, 0)  -- 	South		
    zone:registerRegion(9, -299, 5, -459, 0, 0, 0)  -- 	North
	-- 5th Floor Teleporters
    zone:registerRegion(10, -340, 5, -100, 0, 0, 0)  -- 	Center	
	-- 6th Floor Teleporters
    zone:registerRegion(11, -339, 5, 121, 0, 0, 0)  -- 	Center	
    -- Boss Exit
   	zone:registerRegion(12, -299, 5, 499, 0, 0, 0)  -- 	Center	
   	zone:registerRegion(13, -381, 5, 499, 0, 0, 0)  -- 	Center	
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
	local zfloor = 1;
	local salvagelvl = player:getVar("Salvage_Level");
	if (salvagelvl == 0) then
	    salvagelvl = 15;
	elseif (salvagelvl >= 25 and salvagelvl <= 34) then
	    zfloor = 2;
	elseif (salvagelvl >= 35 and salvagelvl <= 44) then
	    zfloor = 3;
	elseif (salvagelvl >= 45 and salvagelvl <= 54) then
	    zfloor = 4;
	elseif (salvagelvl >= 55 and salvagelvl <= 64) then
	    zfloor = 5;
	elseif (salvagelvl >= 65 and salvagelvl <= 74) then
	    zfloor = 6;		
	end
	player:setVar("Zhayolm_Floor",zfloor);
	
	local prevzone = player:getPreviousZone();
	if (prevzone == 72) then
	    salvagelvl = 15;
	end
	
	if (player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION) == false) then
	    player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,salvagelvl,3,5400);
	    -- player:PrintToPlayer("You have 100 minutes to complete your objective.", 0x15);	
	end
	
	
	if ((VanadielDayElement() == FIRESDAY) or (VanadielDayElement() == EARTHSDAY)) then
	    player:setVar("Zhayolm_Remnant",1);
	elseif ((VanadielDayElement() == WATERSDAY) or (VanadielDayElement() == WINDSDAY)) then
	    player:setVar("Zhayolm_Remnant",2);
	elseif ((VanadielDayElement() == ICEDAY) or (VanadielDayElement() == LIGHTNINGDAY)) then
	    player:setVar("Zhayolm_Remnant",3);
	elseif ((VanadielDayElement() == LIGHTSDAY) or (VanadielDayElement() == DARKSDAY)) then
	    player:setVar("Zhayolm_Remnant",4);
    end	
    -- player:PrintToPlayer("You have 100 minutes to complete your objective.", 0x15);	
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
    return cs;


end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
    local regionId = region:GetRegionID();
	
	
	-- 200 2nd Floor NE
	-- 201 2nd Floor SE
	-- 202 2nd Floor SW
	-- 203 2nd Floor NW
	-- 204 3rd Floor Center
	-- 205 4th Floor S
	-- 206 4th Floor N
	-- 207 5th Floor S
	-- 208 5th Floor N
	-- 209 6th Floor
	-- 210 Boss
	
	-- FLOOR 1 TELEPORTS
	if (regionId == 1) then
	    player:startEvent(200);
	elseif (regionId == 2) then
	   player:startEvent(201);
	elseif (regionId == 3) then
	   player:startEvent(202);
	elseif (regionId == 4) then
	   player:startEvent(203);	   
	end
	
	-- FLOOR 2 TELEPORT
	if (regionId == 5 and player:getVar("2nd_Floor_NM") == 1) then
	   player:startEvent(204);
	end 

    -- FLOOR 3 TELEPORTERS	
	if (regionId == 6 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(205);
	elseif (regionId == 7 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(206);
    end

    -- FLOOR 4 TELEPORTERS	
	if (regionId == 8 and player:getVar("4th_Floor_NM") == 1) then
	    player:startEvent(207);
	elseif (regionId == 9 and player:getVar("4th_Floor_NM") == 1) then
	    player:startEvent(208);
    end

    -- FLOOR 5 TELEPORTER	
	if (regionId == 10 and player:getVar("5th_Floor_NM") == 1) then
	    player:startEvent(209);
    end	
    -- FLOOR 6 TELEPORTER	
	if (regionId == 11 and player:getVar("6th_Floor_NM") == 1) then
	    player:startEvent(210);
    end	

    -- FLOOR 6 TELEPORTER	
	if (regionId == 12) then
	    player:startEvent(211);
	elseif (regionId == 13) then
	    player:startEvent(211);
    end		
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    -- exit
	if (csid >= 200 and csid <= 203 and option == 1) then
	    player:setVar("Zhayolm_Floor",2);
		player:PrintToPlayer("Floor 2 - Max Cap: 35", 0x15);
	end
	if (csid == 204 and option == 1) then
	    player:setVar("Zhayolm_Floor",3);
		player:setVar("2nd_Floor_NM",0);
		player:PrintToPlayer("Floor 3 - Max Cap: 45", 0x15);
	end	
	if (((csid == 205) or (csid == 206)) and option == 1) then
	    player:setVar("Zhayolm_Floor",4);
		player:setVar("3rd_Floor_NM",0);
		player:PrintToPlayer("Floor 4 - Max Cap: 55", 0x15);
		if (player:getVar("Zhayolm_Card") ~= 1) then
		    player:setVar("Zhayolm_Card",1);
		    player:PrintToPlayer("Zhayolm Card Price has been reduced!", 0x15);
		end
	end	
	if (((csid == 207) or (csid == 208)) and option == 1) then
	    player:setVar("Zhayolm_Floor",5);
		player:setVar("4th_Floor_NM",0);
		player:PrintToPlayer("Floor 5 - Max Cap: 65", 0x15);
	end	
    if (csid == 209 and option == 1) then
	    player:setVar("Zhayolm_Floor",6);
		player:setVar("5th_Floor_NM",0);
		player:PrintToPlayer("Floor 6 - Max Cap: 75", 0x15);
	end	
    if (csid == 210 and option == 1) then
	    player:setVar("Zhayolm_Floor",7);
		player:setVar("6th_Floor_NM",0);
		player:PrintToPlayer("Floor 7", 0x15);
	end		
    if (csid == 211 and option == 1) then
	    player:startEvent(1);
	end
    if (csid == 1) then
	    player:setPos(222.798, -0.5, 19.872, 0, 72);
	end
	



end;



