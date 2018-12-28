-----------------------------------
-- Area: Talacca_Cove
-- NPC:  rock slab (corsair job flag quest)
-- -100.000,-9.399,-87.000,
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Talacca_Cove/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:hasItemQty(10115,1)) then
	    local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getZoneID() == player:getZoneID() then
                    v:setVar("Mihli_Fight",1);
					printf("party triggered");
				    v:setPos(-179,32,125,187,57) 
                end
           end
        end
		player:tradeComplete();
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	LuckOfTheDraw = player:getVar("LuckOfTheDraw");

	if (LuckOfTheDraw == 4) then
		player:startEvent(0x0003);	
    elseif (player:hasCompletedMission(TOAU,LEGACY_OF_THE_LOST)) then
        player:PrintToPlayer("You are now able to summon Gessho as a Trust!", 0x1C);
		player:addSpell(918);	
	elseif (EventTriggerBCNM(player,npc)) then
        return;
    end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);


	if (csid == 0x0003) then					-- complete corsair job flag quest
		if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,5493);
		else
		    player:setVar("LuckOfTheDraw",5); -- var will remain for af quests		
		    player:addItem(5493);
		    player:messageSpecial(ITEM_OBTAINED,5493);	
		    player:delKeyItem(FORGOTTEN_HEXAGUN);
		    player:unlockJob(17);
		    player:messageSpecial(YOU_CAN_NOW_BECOME_A_CORSAIR);
		    player:completeQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);
	    end
	elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end	

end;