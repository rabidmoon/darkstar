-----------------------------------
-- 
-- Zone: Arrapago_Remnants
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Arrapago_Remnants/TextIDs"] = nil;
require("scripts/zones/Arrapago_Remnants/TextIDs");
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 420, 5, -339, 0, 0, 0)
    zone:registerRegion(2, 420, 5, -499, 0, 0, 0)
    zone:registerRegion(3, 259, 5, -499, 0, 0, 0)
    zone:registerRegion(4, 259, 5, -339, 0, 0, 0)
    zone:registerRegion(5, 340, 5, 100, 0, 0, 0)
    zone:registerRegion(6, 340, 5, -249, 340, -5, -249)	
    zone:registerRegion(7, 336, 2, -247, 341, -2, -247)		
end;

-----------------------------------
-- onInstanceZoneIn
-----------------------------------

function onInstanceZoneIn(player,instance)
    local cs = -1;

    local pos = player:getPos();
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos();
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot);
    end

    player:addTempItem(5399);
	printf("Instance registered for Remnants");
    local instance = player:getInstance();
    player:messageSpecial(Arrapago.text.TIME_TO_COMPLETE, instance:getTimeLimit());	
	
	player:PrintToPlayer("You have 90 minutes to complete your objective.", 0x15);	 	
	player:setVar("Salvage_Level",5);
	local salvagelvl = player:getVar("Salvage_Level");
    
	
end;



-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
   local regionId = region:GetRegionID();
   if (regionId == 7) then
      printf("Region Entered");
      player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,5,3,5400);
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
    if (csid == 102) then
        player:setPos(0,0,0,0,79);
    end
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceLoadFailed()
    return 72;
end;


