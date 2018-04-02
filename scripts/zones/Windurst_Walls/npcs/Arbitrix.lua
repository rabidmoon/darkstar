-----------------------------------
--	Area: Windurst Walls
--	NPC:  Arbitrix
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/endgameaugments");
-----------------------------------
-- onTrade Action
-----------------------------------


function onTrade(player,npc,trade)
    local augment;
  
    if (trade:hasItemQty(13934,1)) then
	    player:setVar("EndGameTradeAugID",13934);
    elseif (trade:hasItemQty(13935,1)) then
	    player:setVar("EndGameTradeAugID",13935);
    elseif (trade:hasItemQty(14387,1)) then
	    player:setVar("EndGameTradeAugID",14387);
    elseif (trade:hasItemQty(14388,1)) then
	    player:setVar("EndGameTradeAugID",14388);		
    end	

     
    
    augment = endGameAugments(player,npc,trade);
	player:addItem(augment[1],augment[2],augment[3],augment[4],augment[5],augment[6],augment[7],augment[8],augment[9],augment[10]); 
  
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



