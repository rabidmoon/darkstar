-----------------------------------
-- Area: Upper Jeuno
-- NPC: Galmut's door
-- Starts and Finishes Quest: A Clock Most Delicate, Save the Clock Tower (just start), The Clockmaster
-- @zone 244
-- @pos -80 0 104
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	aClockMostdelicate = player:getQuestStatus(JEUNO,A_CLOCK_MOST_DELICATE);
	
	if(player:getFameLevel(JEUNO) >= 5 and aClockMostdelicate == QUEST_AVAILABLE) then 
		if(player:getVar("aClockMostdelicateVar") == 0) then 
			player:startEvent(0x0077); -- Start long cs quest with option "a clock most delicate"
		else
			player:startEvent(0x0076); -- Start short cs quest with option "a clock most delicate"
		end
	elseif(aClockMostdelicate == QUEST_ACCEPTED) then 
		if(player:hasKeyItem(CLOCK_TOWER_OIL) == true) then 
			player:startEvent(0x00ca); -- Ending quest "a clock most delicate"
		else
			player:startEvent(0x0075); -- During quest "a clock most delicate"
		end
	elseif(player:getQuestStatus(JEUNO,SAVE_THE_CLOCK_TOWER) == QUEST_COMPLETED and player:getQuestStatus(JEUNO,THE_CLOCKMASTER) == QUEST_AVAILABLE) then 
		player:startEvent(0x0098); -- Start & finish quest "The Clockmaster"
	elseif(player:getQuestStatus(JEUNO,THE_CLOCKMASTER) == QUEST_COMPLETED) then 
		player:startEvent(0x006e); -- After quest "The Clockmaster"
	else
		player:startEvent(0x0074); -- Standard dialog
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
	if(csid == 0x0077 and option == 1) then 
		player:addQuest(JEUNO,A_CLOCK_MOST_DELICATE);
	elseif(csid == 0x0077 and option == 0) then 
		player:setVar("aClockMostdelicateVar",1);
	elseif(csid == 0x0076 and option == 1) then 
		player:addQuest(JEUNO,A_CLOCK_MOST_DELICATE);
		player:setVar("aClockMostdelicateVar",0);
	elseif(csid == 0x00ca) then 
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12727);
		else 
			player:completeQuest(JEUNO,A_CLOCK_MOST_DELICATE);
			player:addQuest(JEUNO,SAVE_THE_CLOCK_TOWER); -- Start next quest "Save the Clock Tower"
			player:setTitle(PROFESSIONAL_LOAFER);
			player:delKeyItem(CLOCK_TOWER_OIL);
			player:addGil(1200);
			player:messageSpecial(GIL_OBTAINED,1200);
			player:addItem(12727);
			player:messageSpecial(ITEM_OBTAINED,12727);
			player:addFame(JEUNO,30);
		end
	elseif(csid == 0x0098) then 
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17083);
		else 
			player:addQuest(JEUNO,THE_CLOCKMASTER);
			player:completeQuest(JEUNO,THE_CLOCKMASTER);
			player:setTitle(TIMEKEEPER);
			player:addGil(1200);
			player:messageSpecial(GIL_OBTAINED,1200);
			player:addItem(17083);
			player:messageSpecial(ITEM_OBTAINED,17083);
			player:addFame(JEUNO,30);
		end
	end
end;



