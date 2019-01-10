-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Sashosho
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local level = player:getMainLvl();
local job = player:getMainJob();

-- Warrior Trade
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("WARAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18214, 1, 76, 1, 25, 7); -- Attack +8
			player:setVar("WARAFweapon", 0);
			player:setVar("WARMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
    end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("WARMythicWeapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18214, 1, 76, 1, 25, 8); -- Attack +9
			player:setVar("WARMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
    end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("WARMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18214, 1, 76, 1, 25, 9); -- Attack +10
			player:setVar("WARMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
    end
	
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("WARMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(18214, 1, 76, 1, 25, 9); -- Attack +10
			player:setVar("WARMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
    end	

--------------------------------------------------------
--       MONK TRADE Beat Cesti 17478                  --
--------------------------------------------------------


	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("MNKAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17478, 1, 45, 15, 25, 7);
			player:setVar("MNKAFweapon", 0);
			player:setVar("MNKMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end
	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("MNKMythicWeapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17478, 1, 45, 15, 25, 8);
			player:setVar("MNKMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end
	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("MNKMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17478, 1, 45, 15, 25, 9);
			player:setVar("MNKMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end

	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("MNKMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17478, 1, 45, 15, 25, 9);
			player:setVar("MNKMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end



--------------------------------------------------------
--      WHITE MAGE TRADE Blessed Hammer 17422         --
--------------------------------------------------------

if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("WHMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17422, 1, 45, 12, 329, 11, 25, 7); -- Cure Potency +12%
			player:setVar("WHMAFweapon", 0);
			player:setVar("WHMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("WHMMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17422, 1, 45, 12, 329, 11, 25, 8); -- Cure Potency +12%
			player:setVar("WHMMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("WHMMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17422, 1, 45, 12, 329, 11, 25, 9); -- Cure Potency +12%
			player:setVar("WHMMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end

	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("WHMMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17422, 1, 45, 12, 329, 11, 25, 9); -- Cure Potency +12%
			player:setVar("WHMMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end


--------------------------------------------------------
--      BLACK MAGE TRADE DUSKY STAFF 17572             --
--------------------------------------------------------



if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BLMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17572, 1, 76, 12, 133, 11, 25, 7);
			player:setVar("BLMAFweapon", 0);
			player:setVar("BLMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("BLMMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17572, 1, 76, 12, 133, 11, 25, 8);
			player:setVar("BLMMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("BLMMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17572, 1, 76, 12, 133, 11, 25, 9);
			player:setVar("BLMMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end

	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("BLMMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17572, 1, 76, 12, 133, 11, 25, 9);
			player:setVar("BLMMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end

--------------------------------------------------------
--      RED MAGE TRADE FENCING DEGEN 16829            --
--------------------------------------------------------



if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("RDMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16829, 1, 45, 14, 140, 3, 25, 7); -- Fast Cast +4
			player:setVar("RDMAFweapon", 0);
			player:setVar("RDMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end
	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("RDMMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16829, 1, 45, 14, 140, 3, 25, 8); -- Fast Cast +4
			player:setVar("RDMMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end
	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("RDMMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16829, 1, 45, 14, 140, 3, 25, 9); -- Fast Cast +4
			player:setVar("RDMMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end

	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("RDMMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16829, 1, 45, 14, 140, 3, 25, 9); -- Fast Cast +4
			player:setVar("RDMMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end


--------------------------------------------------------
--      THF TRADE MARAUDER'S KNIFE 16764              --
--------------------------------------------------------



if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("THFAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16764, 1, 45, 14, 41, 3, 25, 7);  -- Crit hitrate +4
			player:setVar("THFAFweapon", 0);
			player:setVar("THFMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end
	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("THFMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16764, 1, 45, 14, 41, 3, 25, 8);  -- Crit hitrate +4
			player:setVar("THFMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end
	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("THFMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16764, 1, 45, 14, 41, 3, 25, 9);  -- Crit hitrate +4
			player:setVar("THFMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end

	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("THFMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16764, 1, 45, 14, 41, 3, 25, 9);  -- Crit hitrate +4
			player:setVar("THFMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end


--------------------------------------------------------
--      PLD TRADE HONOR SWORD 17643                   --
--------------------------------------------------------



if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("PLDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17643, 1, 45, 9, 25, 7, 39, 3); -- Attack +7 Enmity +4
			player:setVar("PLDAFweapon", 0);
			player:setVar("PLDMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end
	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("PLDMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17643, 1, 45, 9, 25, 8, 39, 3); -- Attack +7 Enmity +4
			player:setVar("PLDMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end
	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("PLDMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17643, 1, 45, 9, 25, 9, 39, 3); -- Attack +7 Enmity +4
			player:setVar("PLDMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end

	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("PLDMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17643, 1, 45, 9, 25, 9, 39, 3); -- Attack +7 Enmity +4
			player:setVar("PLDMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end





--------------------------------------------------------
--      DRK TRADE RAVEN SCYTHE 16798                  --
--------------------------------------------------------



if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("DRKAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16798, 1, 45, 22, 25, 7);
			player:setVar("DRKAFweapon", 0);
			player:setVar("DRKMythicWeapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end
	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("DRKMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16798, 1, 45, 22, 25, 8);
			player:setVar("DRKMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end
	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("DRKMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16798, 1, 45, 22, 25, 9);
			player:setVar("DRKMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end

	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("DRKMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16798, 1, 45, 22, 25, 9);
			player:setVar("DRKMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end



--------------------------------------------------------
--      BST TRADE BARABORI AXE 16680                  --
--------------------------------------------------------



if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BSTAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16680, 1, 45, 11, 43, 4, 25, 7);
			player:setVar("BSTAFweapon", 0);
			player:setVar("BSTMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end
	if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("BSTMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16680, 1, 45, 11, 43, 4, 25, 8);
			player:setVar("BSTMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end
	if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("BSTMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16680, 1, 45, 11, 43, 4, 25, 9);
			player:setVar("BSTMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end

	if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("BSTMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16680, 1, 45, 11, 43, 4, 25, 9);
			player:setVar("BSTMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end



--------------------------------------------------------
--      BRD TRADE PAPER KNIFE 16766                   --
--------------------------------------------------------



if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BRDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16766, 1, 45, 14, 337, 3, 25, 7);
			player:setVar("BRDAFweapon", 0);
			player:setVar("BRDMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end
	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("BRDMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16766, 1, 45, 14, 337, 3, 25, 8);
			player:setVar("BRDMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end
	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("BRDMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16766, 1, 45, 14, 337, 3, 25, 9);
			player:setVar("BRDMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end

	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 2489, 10 ) and level >= 71 and (player:getVar("BRDMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16766, 1, 45, 14, 337, 3, 25, 9);
			player:setVar("BRDMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end




--------------------------------------------------------
--         RNG TRADE ZAMBURAK 17218                   --
--------------------------------------------------------



if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("RNGAFweaponxbow") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17218, 1, 45, 13, 29, 7);
			player:setVar("RNGAFweaponxbow", 0);
			player:setVar("RNGMythicWeaponxbow", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end
	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("RNGMythicWeaponxbow") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17218, 1, 45, 13, 29, 8);
			player:setVar("RNGWmythicWeaponxbow", 2);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end
	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("RNGMythicWeaponxbow") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17218, 1, 45, 13, 29, 9);
			player:setVar("RNGMythicWeaponxbow", 3);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end

	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("RNGMythicWeaponxbow") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17218, 1, 45, 13, 29, 9);
			player:setVar("RNGMythicWeaponxbow", 4);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end



--------------------------------------------------------
--            SAM TRADE MAGOROKU 17812                --
--------------------------------------------------------



if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("SAMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17812, 1, 45, 19, 142, 2, 25, 7);
			player:setVar("SAMAFweapon", 0);
			player:setVar("SAMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end
	if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("SAMMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17812, 1, 45, 19, 142, 2, 25, 8);
			player:setVar("SAMMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end
	if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("SAMMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17812, 1, 45, 19, 142, 2, 25, 9);
			player:setVar("SAMMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end

	if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("SAMMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17812, 1, 45, 19, 142, 2, 25, 9);
			player:setVar("SAMMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end



--------------------------------------------------------
--      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
--------------------------------------------------------



if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("NINAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 11, 25, 3);
			player:addItem(17772, 1, 45, 10, 25, 4);
			player:setVar("NINAFweapon", 0);
			player:setVar("NINMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end
	if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("NINMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 11, 25, 4);
			player:addItem(17772, 1, 45, 10, 25, 5);
			player:setVar("NINMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end
	if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("NINMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 11, 25, 5);
			player:addItem(17772, 1, 45, 10, 25, 6);
			player:setVar("NINMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end

	if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("NINMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17771, 1, 45, 11, 25, 5);
			player:addItem(17772, 1, 45, 10, 25, 6);
			player:setVar("NINMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end


--------------------------------------------------------
--            DRG TRADE PEREGRINE 16887               --
--------------------------------------------------------



if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("DRGAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16887, 1, 45, 22, 25, 7);
			player:setVar("DRGAFweapon", 0);
			player:setVar("DRGMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end
	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("DRGMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16887, 1, 45, 22, 25, 8);
			player:setVar("DRGMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end
	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("DRGMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16887, 1, 45, 22, 25, 9);
			player:setVar("DRGMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end

	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("DRGMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16887, 1, 45, 22, 25, 9);
			player:setVar("DRGMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end


--------------------------------------------------------
--         SMN TRADE DRAGON STAFF 17597               --
--------------------------------------------------------



if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("SMNAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17597, 1, 76, 1, 321, 1, 25, 7);
			player:setVar("SMNAFweapon", 0);
			player:setVar("SMNMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end
	if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("SMNMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17597, 1, 76, 1, 321, 1, 25, 8);
			player:setVar("SMNMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end
	if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("SMNMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17597, 1, 76, 1, 321, 1, 25, 9);
			player:setVar("SMNMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end

	if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("SMNMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17597, 1, 76, 1, 321, 1, 25, 9);
			player:setVar("SMNMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end


--------------------------------------------------------
--         BLU TRADE IMMORTAL SCIMITAR  17717         --
--------------------------------------------------------


if (job == 16) and (trade:hasItemQty(17717, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BLUAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16829, 1, 45, 13, 550, 5, 25, 7); -- STR/DEX+6
			player:setVar("BLUAFweapon", 0);
			player:setVar("BLUMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("BLUMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16829, 1, 45, 13, 550, 5, 25, 8); -- STR/DEX+6
			player:setVar("BLUMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("BLUMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16829, 1, 45, 13, 550, 5, 25, 9); -- STR/DEX+6
			player:setVar("BLUMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	
	if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("BLUMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16829, 1, 45, 13, 550, 5, 25, 9); -- STR/DEX+6
			player:setVar("BLUMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	
	
--------------------------------------------------------
--      COR TRADE HEXAGUN 18702                    --
--------------------------------------------------------



if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("CORAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18702, 1, 45, 8, 29, 7, 27, 6);
			player:setVar("CORAFweapon", 0);
			player:setVar("CORMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 18702);
			
end
	if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("CORMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18702, 1, 45, 8, 29, 8, 27, 6);
			player:setVar("CORMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18702);
			
end
	if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("CORMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18702, 1, 45, 8, 29, 9, 27, 6);
			player:setVar("CORMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18702);
end	


	if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("CORMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(18702, 1, 45, 8, 29, 9, 27, 6);
			player:setVar("CORMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 18702);
end	


--------------------------------------------------------
--      PUP TRADE ADARGAS 18353                     --
--------------------------------------------------------

if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("PUPAFweapon") == 3) then
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18353, 1, 45, 5, 25, 7); -- Attack +7
			player:setVar("PUPMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18353);
    end		
  
	
if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("PUPMythicWeapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18353, 1, 45, 2, 25, 8); -- Attack +5
			player:setVar("PUPMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18353);
			
end
	if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("PUPMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(18353, 1, 45, 5, 25, 9); -- Attack +7
			player:setVar("PUPMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18353);
			
end	

	if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("PUPMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(18353, 1, 45, 5, 25, 9); -- Attack +7
			player:setVar("PUPMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 18353);
			
end

--------------------------------------------------------
--      DNC TRADE Mythril Knife 16467                    --
--------------------------------------------------------

if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("DNCAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16467, 1, 45, 10, 518, 3, 330, 2, 25, 7);
			player:setVar("DNCAFweapon", 0);
			player:setVar("DNCMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16467);
			
end
	if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("DNCMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16467, 1, 45, 10, 518, 3, 330, 2, 25, 8);
			player:setVar("DNCMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16467);
			
end
	if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("DNCMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(16467, 1, 45, 10, 518, 3, 330, 2, 25, 9);
			player:setVar("DNCMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16467);
end	

	if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 2489, 1 ) and level >= 71 and (player:getVar("DNCMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(16467, 1, 45, 10, 518, 3, 330, 2, 25, 9);
			player:setVar("DNCMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 16467);
end	



--------------------------------------------------------
--      SCH TRADE OAK POLE 17098                     --
--------------------------------------------------------

if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("SCHAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17098, 1, 45, 30, 141, 6, 25, 7);
			player:setVar("SCHAFweapon", 0);
			player:setVar("SCHMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17098);
			
end
	if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 2185, 10 ) and level >= 61 and (player:getVar("SCHMythicWeapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17098, 1, 45, 30, 141, 6, 25, 8);
			player:setVar("SCHMythicWeapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17098);
			
end
	if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 2187, 10 ) and level >= 71 and (player:getVar("SCHMythicWeapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Return to me again if you would like something stronger.", 0xD);
			player:addItem(17098, 1, 45, 30, 141, 6, 25, 9);
			player:setVar("SCHMythicWeapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17098);
end	
	if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty(2489, 1) and level >= 71 and (player:getVar("SCHMythicWeapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for returning this book.  I will need a bit of time to reference your weapon with the book.", 0xD);
			player:addItem(17098, 1, 45, 30, 141, 6, 25, 9);
			player:setVar("SCHMythicWeapon", 4);
			player:messageSpecial(ITEM_OBTAINED, 17098);
end	
	



end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
  -- player:startEvent(0x00FA);
 local job = player:getMainJob();
 local level = player:getMainLvl();

	if ((job == 1) and (player:getVar("WARAFweapon") == 3)) or 
		((job == 2) and (player:getVar("MNKAFweapon") == 3)) or
		((job == 3) and (player:getVar("WHMAFweapon") == 3)) or
		((job == 4) and (player:getVar("BLMAFweapon") == 3)) or
		((job == 5) and (player:getVar("RDMAFweapon") == 3)) or
		((job == 6) and (player:getVar("THFAFweapon") == 3)) or
		((job == 7) and (player:getVar("PLDAFweapon") == 3)) or
		((job == 8) and (player:getVar("DRKAFweapon") == 3)) or
		((job == 9) and (player:getVar("BSTAFweapon") == 3)) or
		((job == 10) and (player:getVar("BRDAFweapon") == 3)) or
		((job == 11) and (player:getVar("RNGAFweaponbow") == 3)) or
		((job == 12) and (player:getVar("SAMAFweapon") == 3)) or	
		((job == 13) and (player:getVar("NINAFweapon") == 3)) or
		((job == 14) and (player:getVar("DRGAFweapon") == 3)) or
		((job == 15) and (player:getVar("SMNAFweapon") == 3)) or
		((job == 16) and (player:getVar("BLUAFweapon") == 3)) or
		((job == 17) and (player:getVar("CORAFweapon") == 3)) or
		((job == 18) and (player:getVar("PUPAFweapon") == 3)) or
		((job == 19) and (player:getVar("DNCAFweapon") == 3)) or
		((job == 20) and (player:getVar("SCHAFweapon") == 3)) then
		player:PrintToPlayer("Sashosho : Oboro told me you were coming.  There is a technique used here by the locals", 0xD);
		player:PrintToPlayer("Sashosho : to bring out the true power in weapons crafted during the Crystal War.  If you trade me", 0xD);	
		player:PrintToPlayer("Sashosho : 10 Imperial Bronze Pieces, I can begin working on it immediately!", 0xD); 
	elseif ((job == 1) and (player:getVar("WARMythicWeapon") == 1)) or
		((job == 2) and (player:getVar("MNKMythicWeapon") == 1)) or
		((job == 3) and (player:getVar("WHMMythicWeapon") == 1)) or
		((job == 4) and (player:getVar("BLMMythicWeapon") == 1)) or
		((job == 5) and (player:getVar("RDMMythicWeapon") == 1)) or
		((job == 6) and (player:getVar("THFMythicWeapon") == 1)) or
		((job == 7) and (player:getVar("PLDMythicWeapon") == 1)) or
		((job == 8) and (player:getVar("DRKMythicWeapon") == 1)) or
		((job == 9) and (player:getVar("BSTMythicWeapon") == 1)) or
		((job == 10) and (player:getVar("BRDMythicWeapon") == 1)) or
		((job == 11) and (player:getVar("RNGMythicWeaponbow") == 1)) or
		((job == 12) and (player:getVar("SAMMythicWeapon") == 1)) or
		((job == 13) and (player:getVar("NINMythicWeapon") == 1)) or
		((job == 14) and (player:getVar("DRGMythicWeapon") == 1)) or
		((job == 15) and (player:getVar("SMNMythicWeapon") == 1)) or	
		((job == 16) and (player:getVar("BLUMythicWeapon") == 1)) or
		((job == 17) and (player:getVar("CORMythicWeapon") == 1)) or
		((job == 18) and (player:getVar("PUPMythicWeapon") == 1)) or
		((job == 19) and (player:getVar("DNCMythicWeapon") == 1)) or
		((job == 20) and (player:getVar("SCHMythicWeapon") == 1)) then	
		player:PrintToPlayer("Sashosho : Bring me 10 Imperial Silver Pieces, and I'll continue to work on your new weapon!", 0xD);     
    elseif ((job == 1) and (player:getVar("WARMythicWeapon") == 2)) or
		((job == 2) and (player:getVar("MNKMythicWeapon") == 2)) or
		((job == 3) and (player:getVar("WHMMythicWeapon") == 2)) or
		((job == 4) and (player:getVar("BLMMythicWeapon") == 2)) or
		((job == 5) and (player:getVar("RDMMythicWeapon") == 2)) or
		((job == 6) and (player:getVar("THFMythicWeapon") == 2)) or
		((job == 7) and (player:getVar("PLDMythicWeapon") == 2)) or
		((job == 8) and (player:getVar("DRKMythicWeapon") == 2)) or
		((job == 9) and (player:getVar("BSTMythicWeapon") == 2)) or
		((job == 10) and (player:getVar("BRDMythicWeapon") == 2)) or
		((job == 11) and (player:getVar("RNGMythicWeaponbow") == 2)) or
		((job == 15) and (player:getVar("SMNMythicWeapon") == 2)) or
		((job == 13) and (player:getVar("NINMythicWeapon") == 2)) or
		((job == 14) and (player:getVar("DRGMythicWeapon") == 2)) or
		((job == 12) and (player:getVar("SAMMythicWeapon") == 2)) or
		((job == 16) and (player:getVar("BLUMythicWeapon") == 2)) or
		((job == 17) and (player:getVar("CORMythicWeapon") == 2)) or
		((job == 18) and (player:getVar("PUPMythicWeapon") == 2)) or
		((job == 19) and (player:getVar("DNCMythicWeapon") == 2)) or
		((job == 20) and (player:getVar("SCHMythicWeapon") == 2)) then 
		player:PrintToPlayer("Sashosho : For 10 Imperial Gold Pieces, I'll continue to work on your new weapon!", 0xD);
    elseif ((job == 1) and (player:getVar("WARMythicWeapon") == 3)) or
		((job == 2) and (player:getVar("MNKMythicWeapon") == 3)) or
		((job == 3) and (player:getVar("WHMMythicWeapon") == 3)) or
		((job == 4) and (player:getVar("BLMMythicWeapon") == 3)) or
		((job == 5) and (player:getVar("RDMMythicWeapon") == 3)) or
		((job == 6) and (player:getVar("THFMythicWeapon") == 3)) or
		((job == 7) and (player:getVar("PLDMythicWeapon") == 3)) or
		((job == 8) and (player:getVar("DRKMythicWeapon") == 3)) or
		((job == 9) and (player:getVar("BSTMythicWeapon") == 3)) or
		((job == 10) and (player:getVar("BRDMythicWeapon") == 3)) or
		((job == 11) and (player:getVar("RNGMythicWeaponbow") == 3)) or
		((job == 15) and (player:getVar("SMNMythicWeapon") == 3)) or
		((job == 13) and (player:getVar("NINMythicWeapon") == 3)) or
		((job == 14) and (player:getVar("DRGMythicWeapon") == 3)) or
		((job == 12) and (player:getVar("SAMMythicWeapon") == 3)) or
		((job == 16) and (player:getVar("BLUMythicWeapon") == 3)) or
		((job == 17) and (player:getVar("CORMythicWeapon") == 3)) or
		((job == 18) and (player:getVar("PUPMythicWeapon") == 3)) or
		((job == 19) and (player:getVar("DNCMythicWeapon") == 3)) or
		((job == 20) and (player:getVar("SCHMythicWeapon") == 3)) then 
		player:PrintToPlayer("Sashosho : Before we go further, I need something special.  The Mercenary Dealer who sells", 0xD); 
		player:PrintToPlayer("Sashosho : questionable items has stolen my copy of The Wyrmseeker of Areuhat which I need to ", 0xD); 
		player:PrintToPlayer("Sashosho : upgrade your weapon to a new and magcnificent form.  Please trade it and your weapon to me", 0xD); 		
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
end;



