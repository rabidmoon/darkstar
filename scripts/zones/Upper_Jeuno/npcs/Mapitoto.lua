-----------------------------------
-- Area: Upper Jeuno
--  NPC: Mount NPC
-----------------------------------

require("scripts/globals/chocobo");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(10049,1) and player:hasKeyItem(CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(RAPTOR_COMPANION);
		player:messageSpecial(KEYITEM_OBTAINED,RAPTOR_COMPANION);
	elseif (trade:hasItemQty(10051,1) and player:hasKeyItem(CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(CRAB_COMPANION);
		player:messageSpecial(KEYITEM_OBTAINED,CRAB_COMPANION);
	elseif (trade:hasItemQty(10051,1) and player:hasKeyItem(CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(TIGER_COMPANION);
		player:messageSpecial(KEYITEM_OBTAINED,TIGER_COMPANION);
    end		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)




end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);


end;