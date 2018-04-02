-----------------------------------
--
-- Zone: Mamook (65)
--
-----------------------------------
package.loaded["scripts/zones/Mamook/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Mamook/TextIDs");

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
	local mir1hp = GetServerVariable("[MA]Mirror1")
	local mir2hp = GetServerVariable("[MA]Mirror2")
	local mir3hp = GetServerVariable("[MA]Mirror3")	

	-- Spawn Mirrors Prisoners Achieve and Blu Helper on Reboot
	if (posession == 4) then
	    if (rug == 1) then
            GetNPCByID(17043982):setStatus(STATUS_NORMAL);
		end      
        if (gad == 1) then		
            GetNPCByID(17043983):setStatus(STATUS_NORMAL);
		end
        if (mih == 1) then		
            GetNPCByID(17043984):setStatus(STATUS_NORMAL);	
		end
        if (zaz == 1) then		
            GetNPCByID(17043985):setStatus(STATUS_NORMAL);
		end		
		if (naj == 1) then
            GetNPCByID(17043986):setStatus(STATUS_NORMAL);	
	    end
		
		-- Spawn Mirrors
		printf("Mamook Zone.lua - Start mirrors");
		
		if (mir1hp ~= 0) then
	    SpawnMob(17043847);
		printf("Spawning Mirror 1");
		end
		
		if (mir2hp > 0) then
		printf("Spawning Mirror 2");		
	    SpawnMob(17043848);
		end
		
		if (mir3hp > 0) then
		printf("Spawning Mirror 3");		
	    SpawnMob(17043849);	
		end
		
		printf("Mamook Zone.lua - end mirrors");		
	    -- Spawn Achieve Master
	    local achieve = GetNPCByID(17043919);
	    achieve:setStatus(STATUS_NORMAL);
	    -- Spawn BLU Helper
	    DeterMob(17044059, false);
	    printf("Mirrors");
        GetMobByID(17044059):setRespawnTime(35);	   
	    -- SpawnMob();	
		
    end

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-117.491,-20.115,-299.997,6);
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