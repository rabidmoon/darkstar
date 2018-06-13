-----------------------------------
--
-- Zone: Arrapago_Reef (54)
--
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Arrapago_Reef/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
zone:registerRegion(1,-462,-4,-420,-455,-1,-392);
-- Check for Astral Candy and General Capture
    local posession = GetServerVariable("AC_Posession");
	local rug = GetServerVariable("RughadjeenCapture");
	local gad = GetServerVariable("GadalarCapture");
	local zaz = GetServerVariable("ZazargCapture");
	local mih = GetServerVariable("MihliCapture");
	local naj = GetServerVariable("NajelithCapture");
	-- Get Mirrors 
	local mir1hp = GetServerVariable("[AR]Mirror1")
	local mir2hp = GetServerVariable("[AR]Mirror2")
	local mir3hp = GetServerVariable("[AR]Mirror3")	
	
	
	-- Spawn Mirrors Prisoners Achieve and Blu Helper on Reboot
	if (posession == 2) then
	    if (rug == 1) then
            GetNPCByID(16998975):setStatus(STATUS_NORMAL);
		end      
        if (gad == 1) then		
            GetNPCByID(16998976):setStatus(STATUS_NORMAL);
		end
        if (mih == 1) then		
            GetNPCByID(16998977):setStatus(STATUS_NORMAL);	
		end
        if (zaz == 1) then		
            GetNPCByID(16998978):setStatus(STATUS_NORMAL);
		end		
		if (naj == 1) then
            GetNPCByID(16998979):setStatus(STATUS_NORMAL);	
	    end
		
		-- Spawn Mirrors
		printf("AR Zone.lua - Start mirrors");
		
		if (mir1hp ~= 0) then
	    SpawnMob(16998838);
		end
		
		if (mir2hp > 0) then
	    SpawnMob(16998839);
		end
		
		if (mir3hp > 0) then
	    SpawnMob(16998840);	
		end
		
		printf("AR Zone.lua - end mirrors");		
	    -- Spawn Achieve Master
	    local achieve = GetNPCByID(16998895);
	    achieve:setStatus(STATUS_NORMAL);
	    -- Spawn BLU Helper
	   DeterMob(16999067, false);
	   printf("Mirrors");
        GetMobByID(16999067):setRespawnTime(35);	   
	   -- SpawnMob();	
		
    end
	
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
       if (prevZone == 60) then
            if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:getVar("AhtUrganStatus") == 2) then
                cs = 9;
            else
                player:setPos(-456, -3, -405, 64);
            end
	elseif (prevZone == 79 and player:getCurrentMission(TOAU) == PREVALENCE_OF_PIRATES and player:getVar("AhtUrganStatus") == 0) then
	    cs = 13;
        else
            player:setPos(-180.028,-10.335,-559.987,182);
        end
    end
	
	-- Besieged
	if (GetServerVariable("Besieged_Horde") > 0) then
	    player:addStatusEffect(EFFECT_BESIEGED,3,0,3600);
		player:ChangeMusic(1, 142);
		player:ChangeMusic(2, 142);
	end

    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    if (player:getCurrentMission(TOAU) ==  THE_BLACK_COFFIN and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN) and player:getVar("TOAUM15") ==0) then
        player:startEvent(0x0008);
    elseif (player:getCurrentMission(TOAU) == PREVALENCE_OF_PIRATES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(14);
    elseif (player:getCurrentMission(TOAU) == TESTING_THE_WATERS and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN)) then
        player:startEvent(15);
    end
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
    if (csid == 0x0008) then
        player:setVar("TOAUM15",1);
        player:delKeyItem(EPHRAMADIAN_GOLD_COIN);
        player:startEvent(0x0022,1,1,1,1,1,1,1,1);
    elseif (csid == 9) then  -- Finish Black Coffin and then warp to Nashmau to finish
        player:setVar("AhtUrganStatus",3);
        player:setPos(0,0,0,0,53);
    elseif (csid == 13) then
        player:setVar("AhtUrganStatus",1);		
    elseif (csid == 0x0022 and player:getVar("TOAUM15") == 1) then
        player:startEvent(0x0023);
    elseif (csid == 14) then
        player:completeMission(TOAU,PREVALENCE_OF_PIRATES);
        player:setVar("AhtUrganStatus",0);
        player:addKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:messageSpecial(KEYITEM_OBTAINED,PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:addMission(TOAU,SHADES_OF_VENGEANCE);		
    elseif (csid == 90) then -- enter instance: the ashu talif
        player:setPos(0,0,0,0,60);		
    end    
end;