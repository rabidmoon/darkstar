-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  All Cerment Doors
-- Opens Doors for Sky
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");	
require("scripts/globals/keyitems");
local TheShrineofRuAvitau = require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
	
	
function skyDoors(player,npc)	
	local npcID = npc:getID();
	local Door_Offset = 17506718; -- _4y0
	local Door_OffsetB = 17506722; -- _4y0	
    local YellowDoor = GetNPCByID(Door_Offset):getAnimation();
	local BlueDoor = GetNPCByID(Door_OffsetB):getAnimation();
	
	if (player:hasKeyItem(MAGICKED_ASTROLABE)) then
	    for k,f in pairs(TheShrineofRuAvitau.doors[1]) do
	        if (npcID == f) then
		        printf("Yellow Doors");
	            if (YellowDoor == 9) then --closed
                    for i,v in pairs(TheShrineofRuAvitau.doors[1]) do
                        GetNPCByID(v):setAnimation(8)
                    end				
	            elseif (YellowDoor == 8) then -- open
                    for i,v in pairs(TheShrineofRuAvitau.doors[1]) do
                        GetNPCByID(v):setAnimation(9)
                    end	
			    end
                break;				
		    else
		        printf("Blue Doors");
			    if (BlueDoor == 9) then -- Blue Closed
		            printf("Door Closed - Opening It");
                    for i,v in pairs(TheShrineofRuAvitau.doors[2]) do
                        GetNPCByID(v):setAnimation(8)
                    end		    
	            elseif (BlueDoor == 8) then -- open
		            printf("Door Opened - Closing It");
                    for i,v in pairs(TheShrineofRuAvitau.doors[2]) do
                        GetNPCByID(v):setAnimation(9)
                    end
                end				
	        end	
        end		
    end
end;	