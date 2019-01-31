-----------------------------------
-- Area: Nashmau
-- NPC: Paparoon
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local alexcount = trade:getItemCount();
	local alextrade = trade:getItemQty(2488);
	local alexbank = player:getVar("Alexandrite_Bank");
	local remaining = 30000;
	if (alextrade == alexcount) then
	    alexbank = alexbank + alextrade;
		player:setVar("Alexandrite_Bank",alexbank);
		remaining = remaining - alexbank;
		player:startEvent(29,remaining);
	end
	    
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x001A);
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
	local alexbank = player:getVar("Alexandrite_Bank");
	if (alexbank >= 30000 and csid == 29) then
	    player:addItem(3443,1);
		player:messageSpecial(ITEM_OBTAINED,3443)
		player:setVar("Alexandrite_Bank",0);
	end
end;



