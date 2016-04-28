-------------------------
-- Area: Dynamis - San d'Oria
-- NPC: Relic Armor Moogle
-- Trade 6000 Scyld and Artifact armor of the same time to receive Relic
-------------------------
require("scripts/zones/Dynamis-Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local af2 = 6000; 
local uscyld = player:getCurrency("scyld");


------------------------------
--           WAR           --  
------------------------------

if (trade:hasItemQty( 2037, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15312,1);
   player:messageSpecial(ITEM_OBTAINED,15312,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15312);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end



------------------------------
--           MNK            --  
------------------------------

if (trade:hasItemQty( 2042, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
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

if (trade:hasItemQty( 2043, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15074,1);
   player:messageSpecial(ITEM_OBTAINED,15074,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15074);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           RDM            --  
------------------------------

if (trade:hasItemQty( 2057, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14093,1);
   player:messageSpecial(ITEM_OBTAINED,14093,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14093);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           PLD            --  
------------------------------

if (trade:hasItemQty( 2065, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15108,1);
   player:messageSpecial(ITEM_OBTAINED,15108,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15108);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           BST            --  
------------------------------

if (trade:hasItemQty( 2076, 1)) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15125,1);
   player:messageSpecial(ITEM_OBTAINED,15125,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15125);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           BRD            --  
------------------------------

if (trade:hasItemQty( 2078, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15081,1);
   player:messageSpecial(ITEM_OBTAINED,15081,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15081);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           RNG            --  
------------------------------

if (trade:hasItemQty( 2086, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15127,1);
   player:messageSpecial(ITEM_OBTAINED,15127,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15127);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end




------------------------------
--           SMN            --  
------------------------------

if (trade:hasItemQty( 2017, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15146,1);
   player:messageSpecial(ITEM_OBTAINED,15146,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15146);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           NIN            --  
------------------------------

if (trade:hasItemQty( 2096, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15129,1);
   player:messageSpecial(ITEM_OBTAINED,15129,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15129);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end



------------------------------
--           DRG            --  
------------------------------

if (trade:hasItemQty( 2102, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15145,1);
   player:messageSpecial(ITEM_OBTAINED,15145,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15145);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end


------------------------------
--           BLU            --  
------------------------------

if (trade:hasItemQty( 2664, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15025,1);
   player:messageSpecial(ITEM_OBTAINED,15025,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15025);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end



------------------------------
--           COR            --  
------------------------------

if (trade:hasItemQty( 2670, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(16349,1);
   player:messageSpecial(ITEM_OBTAINED,16349,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16349);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end





------------------------------
--           PUP            --  
------------------------------

if (trade:hasItemQty( 2676, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11388,1);
   player:messageSpecial(ITEM_OBTAINED,11388,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,11388);
   end
else
player:PrintToPlayer("Please trade me an artifact armor piece...");
end



------------------------------
--           SCH            --  
------------------------------

if (trade:hasItemQty( 2725, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15040,1);
   player:messageSpecial(ITEM_OBTAINED,15040,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15040);
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


player:PrintToPlayer("Moogle : For a cheaper price, trade me a damaged relic piece and 6000 Scyld and I will make a normal quality relic!", 0xD);
 
 
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