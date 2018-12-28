-----------------------------------
-- Area: Arrapago Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Arrapago_Remnants/TextIDs"] = nil;


require("scripts/zones/Arrapago_Remnants/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");


function onTrade(player,npc,trade)
    local salvkey = player:getVar("Arrapago_Key");
	local loca4 = math.random(205,206);
    if (trade:hasItemQty(2376,1) and salvkey == 1) then
	    player:PrintToPlayer("Floor 4 Confirmed.", 0x15);
	    player:startEvent(loca4);
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    -- exit
	local duration = player:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getDuration();
	if (((csid == 205) or (csid == 206)) and option == 1) then
	    player:setVar("Arrapago_Floor",4);
		player:PrintToPlayer("Floor 4 - Max Cap: 55", 0x15);
		player:setVar("Salvage_Level",45);		
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,45,3,duration);	
        player:addMP(1500);
        player:addHP(1600);			
	end	


end;

