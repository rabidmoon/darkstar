-----------------------------------
--
-- Zone: Arrapago_Reef (54)
-- approach -422 -4 -425 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    zone:registerRegion(1, -433, 15, -413, 0, 0, 0);
    zone:registerRegion(2,-462,-4,-420,-455,-1,-392) -- approach the Cutter
	



	
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
    elseif (player:getCurrentMission(TOAU) == PREVALENCE_OF_PIRATES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(14);   
   end
	
	-- Besieged
	--if (GetServerVariable("Besieged_Horde") > 0) then
	  --  player:addStatusEffect(EFFECT_BESIEGED,3,0,3600);
		--player:ChangeMusic(1, 142);
		--player:ChangeMusic(2, 142);
	--end

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
    local regionId = region:GetRegionID();
	if (regionId == 1) then
	    player:PrintToPlayer("Zone ENtered 1");
	end
	if (regionId == 2) then
	    player:PrintToPlayer("Zone ENtered 2");
	end
	if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN) and player:getVar("TOAUM15") == 0) then
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
    printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("CSID: %u",csid);
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
        player:startEvent(14);		
    elseif (csid == 0x0022 and player:getVar("TOAUM15") == 1) then
        player:startEvent(0x0023);
    elseif (csid == 14) then
        player:completeMission(TOAU,PREVALENCE_OF_PIRATES);
        player:setVar("AhtUrganStatus",0);
        player:addKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:messageSpecial(KEYITEM_OBTAINED,PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:addMission(TOAU,SHADES_OF_VENGEANCE);	
    elseif (csid == 15) then
        player:setVar("AhtUrganStatus",1)
        player:setPos(0,0,0,0,57)		
	elseif (csid == 90) then -- enter instance: the ashu talif
        player:setPos(0,0,0,0,60);		
    end    
end;