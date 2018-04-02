-----------------------------------
--
-- Zone: Halvung (62)
--
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Halvung/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

-- Check for Astral Candy and General Capture
    local posession = GetServerVariable("AC_Posession");
	local rug = GetServerVariable("RughadjeenCapture");
	local gad = GetServerVariable("GadalarCapture");
	local zaz = GetServerVariable("ZazargCapture");
	local mih = GetServerVariable("MihliCapture");
	local naj = GetServerVariable("NajelithCapture");
	-- Get Mirrors 
	local mir1hp = GetServerVariable("[HA]Mirror1")
	local mir2hp = GetServerVariable("[HA]Mirror2")
	local mir3hp = GetServerVariable("[HA]Mirror3")	

	-- Spawn Mirrors Prisoners Achieve and Blu Helper on Reboot
	if (posession == 3) then
	    if (rug == 1) then
            GetNPCByID(17031704):setStatus(STATUS_NORMAL);
		end      
        if (gad == 1) then		
            GetNPCByID(17031705):setStatus(STATUS_NORMAL);
		end
        if (mih == 1) then		
            GetNPCByID(17031706):setStatus(STATUS_NORMAL);	
		end
        if (zaz == 1) then		
            GetNPCByID(17031707):setStatus(STATUS_NORMAL);
		end		
		if (naj == 1) then
            GetNPCByID(17031708):setStatus(STATUS_NORMAL);	
	    end
		
		-- Spawn Mirrors
		printf("Halvung Zone.lua - Start mirrors");
		
		if (mir1hp ~= 0) then
	    SpawnMob(17031568);
		printf("Spawning Mirror 1");
		end
		
		if (mir2hp > 0) then
		printf("Spawning Mirror 2");		
	    SpawnMob(17031569);
		end
		
		if (mir3hp > 0) then
		printf("Spawning Mirror 3");		
	    SpawnMob(17031570);	
		end
		
		printf("Halvung Zone.lua - end mirrors");		
	    -- Spawn Achieve Master
	    local achieve = GetNPCByID(17031612);
	    achieve:setStatus(STATUS_NORMAL);
	    -- Spawn BLU Helper
	    DeterMob(17031741, false);
	    printf("Mirrors");
        GetMobByID(17031741):setRespawnTime(35);	   
	    -- SpawnMob();	
		
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(160.54,-22.001,139.988,244);
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;