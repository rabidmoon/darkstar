-----------------------------------
-- Area: Upper Jeuno
-- NPC: Monberaux
-- Starts and Finishes Quest: The Lost Cardian (finish), The kind cardian (start)
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- @pos -43 0 -1
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(555,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz1"); -- NPC Part1
		if(a == 0 or (a ~= 4 and a ~= 5 and a ~= 6 and a ~= 12 and a ~= 20 and a ~= 7 and a ~= 28 and a ~= 13 and a ~= 22 and 
		   a ~= 14 and a ~= 21 and a ~= 15 and a ~= 23 and a ~= 29 and a ~= 30 and a ~= 31)) then 
			player:startEvent(0x005b,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheLostCardien = player:getQuestStatus(JEUNO,THE_LOST_CARDIAN);
	CooksPride = player:getQuestStatus(JEUNO,COOK_S_PRIDE);
	
	if(CooksPride == QUEST_COMPLETED and TheLostCardien == QUEST_AVAILABLE and player:getVar("theLostCardianVar") == 2) then 
		player:startEvent(0x0021); -- Long CS & Finish Quest "The Lost Cardian"
	elseif(CooksPride == QUEST_COMPLETED and TheLostCardien == QUEST_AVAILABLE and player:getVar("theLostCardianVar") == 3) then 
		player:startEvent(0x0022); -- Shot CS & Finish Quest "The Lost Cardian"
	elseif(TheLostCardien == QUEST_COMPLETED and player:getQuestStatus(JEUNO,THE_KIND_CARDIAN) == QUEST_ACCEPTED) then 
		player:startEvent(0x0020);
	else
		player:startEvent(0x001c); -- Standard dialog
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if(csid == 0x005b) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 4);
	elseif(csid == 0x0021 and option == 0 or csid == 0x0022 and option == 0) then 
		player:completeQuest(JEUNO,THE_LOST_CARDIAN);
		player:addQuest(JEUNO,THE_KIND_CARDIAN); -- Start next quest "THE_KING_CARDIAN"
		player:setTitle(TWOS_COMPANY);
		player:setVar("theLostCardianVar",0);
		player:addGil(2100);
		player:messageSpecial(GIL_OBTAINED,2100);
		player:addKeyItem(TWO_OF_SWORDS);
		player:messageSpecial(KEYITEM_OBTAINED,TWO_OF_SWORDS); -- Two of Swords (Key Item)
		player:addFame(JEUNO,30);
	elseif(csid == 0x0021 and option == 1) then 
		player:setVar("theLostCardianVar",3);
	end
end;



