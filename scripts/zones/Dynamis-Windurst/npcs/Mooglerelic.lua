-------------------------
-- Area: Dynamis - Windurst
-- NPC: Relic Armor Moogle
-- Trade 8000 Scyld and Artifact armor of the same time to receive Relic
-------------------------


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local af2 = 8000; 
local uscyld = player:getCurrency("scyld");

------------------------------
--           MNK            --  
------------------------------

if (trade:hasItemQty( 14090, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14090,1);
   player:addItem(15133,1);
   player:messageSpecial(ITEM_OBTAINED,15133,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15133);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end



------------------------------
--           WHM           --  
------------------------------

if (trade:hasItemQty( 14091, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14091,1);
   player:addItem(15134,1);
   player:messageSpecial(ITEM_OBTAINED,15134,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15134);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end









end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


stock = {0x3B1D,999999999, -- MNK
		 0x3B1E,999999999, -- WHM
	     0x3B02,999999999, -- RDM
		 0x3AE5,999999999, -- THF
		 0x3B05,999999999, -- DRK
		 0x3AE8,999999999, -- BST
		 0x3AE9,999999999, -- BRD
		 0x3B1B,999999999, -- SMN
		 0x3B1A,999999999, -- DRG
		 0x3B18,999999999, -- SAM
		 0x3FDD,999999999, -- COR
		 0x2C7C,999999999, -- PUP
		 0x2CD6,999999999, -- DNC
		 0x3AC0,999999999} -- SCH


player:PrintToPlayer("Moogle : For cheaper price trade me Artifact of same slot and 8000 Scyld.  I'll give your Artifact back I promise!", 0xD);
 
 
showShop(player, STATIC, stock);  

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