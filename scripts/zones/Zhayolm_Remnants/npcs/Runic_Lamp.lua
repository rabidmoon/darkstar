-----------------------------------
-- Area: Zhayolm Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Zhayolm_Remnants/TextIDs"] = nil;


require("scripts/zones/Zhayolm_Remnants/TextIDs");
require("scripts/globals/treasure");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

function onTrade(player,npc,trade)
    local salvfloor = player:getVar("Card_Level");
	local loca = math.random(205,206);
    if (trade:hasItemQty(2375,1)) then
	  player:PrintToPlayer("Floor 4 Confirmed.", 0x15);
	  player:startEvent(loca);
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
	if (csid >= 205 and csid <= 206 and option == 1) then
	    player:setVar("Bhaflau_Floor",3);
		player:PrintToPlayer("Floor 4 - Max Cap: 55", 0x15);
		player:setVar("Salvage_Level",45);
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,45,3,duration);	
        player:addMP(1500);
        player:addHP(1600);		
	end
end;

