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
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18214, 1, 45, 16);
			player:setVar("WARAFweapon", 0);
			player:setVar("WARMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("WARAFweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18214, 1, 45, 25, 25, 4); -- Attack +5
			player:setVar("WARAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("WARAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18214, 1, 76, 1, 25, 6); -- Attack +7
			player:setVar("WARAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
end

--------------------------------------------------------
--       MONK TRADE Beat Cesti 17478                  --
--------------------------------------------------------


	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("MNKAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17478, 1, 45, 5);
			player:setVar("MNKAFweapon", 0);
			player:setVar("MNKMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end
	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("MNKAFweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17478, 1, 45, 9, 25, 4); -- Attack +5
			player:setVar("MNKAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end
	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("MNKAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17478, 1, 45, 15, 25, 6); -- Attack +7
			player:setVar("MNKAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end



--------------------------------------------------------
--      WHITE MAGE TRADE Blessed Hammer 17422         --
--------------------------------------------------------

if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("WHMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17422, 1, 45, 3, 329, 9); -- Cure Potency +10%
			player:setVar("WHMAFweapon", 0);
			player:setVar("WHMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("WHMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17422, 1, 45, 7, 329, 10); -- Cure Potency +11%
			player:setVar("WHMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("WHMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17422, 1, 45, 12, 329, 11); -- Cure Potency +12%
			player:setVar("WHMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end



--------------------------------------------------------
--      BLACK MAGE TRADE DUSKY STAFF 17572             --
--------------------------------------------------------



if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BLMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17572, 1, 45, 9, 133, 9);
			player:setVar("BLMAFweapon", 0);
			player:setVar("BLMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BLMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17572, 1, 45, 76, 0, 133, 10);
			player:setVar("BLMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BLMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17572, 1, 76, 12, 133, 11);
			player:setVar("BLMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end

--------------------------------------------------------
--      RED MAGE TRADE FENCING DEGEN 16829            --
--------------------------------------------------------



if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("RDMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 4, 140, 1); -- Fast Cast +2
			player:setVar("RDMAFweapon", 0);
			player:setVar("RDMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end
	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RDMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 9, 140, 2); -- Fast Cast +3
			player:setVar("RDMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end
	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RDMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 14, 140, 3); -- Fast Cast +4
			player:setVar("RDMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end


--------------------------------------------------------
--      THF TRADE MARAUDER'S KNIFE 16764              --
--------------------------------------------------------



if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("THFAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16764, 1, 45, 4, 41, 1);  -- Crit hitrate +2
			player:setVar("THFAFweapon", 0);
			player:setVar("THFMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end
	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("THFAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16764, 1, 45, 9, 41, 2);  -- Crit hitrate +3
			player:setVar("THFAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end
	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("THFAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16764, 1, 45, 14, 41, 3);  -- Crit hitrate +4
			player:setVar("THFAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end


--------------------------------------------------------
--      PLD TRADE HONOR SWORD 17643                   --
--------------------------------------------------------



if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("PLDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17643, 1, 45, 2, 39, 1); -- DMG+3 Enmity +2
			player:setVar("PLDAFweapon", 0);
			player:setVar("PLDMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end
	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PLDAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17643, 1, 45, 6, 25, 4, 39, 2);  -- Attack +5 Enmity +3
			player:setVar("PLDAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end
	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PLDAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17643, 1, 45, 9, 25, 6, 39, 3); -- Attack +7 Enmity +4
			player:setVar("PLDAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end





--------------------------------------------------------
--      DRK TRADE RAVEN SCYTHE 16798                  --
--------------------------------------------------------



if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("DRKAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16798, 1, 45, 6);
			player:setVar("DRKAFweapon", 0);
			player:setVar("DRKMythicWeapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end
	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRKAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16798, 1, 45, 14, 25, 4);
			player:setVar("DRKAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end
	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRKAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16798, 1, 45, 22, 25, 6);
			player:setVar("DRKAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end



--------------------------------------------------------
--      BST TRADE BARABORI AXE 16680                  --
--------------------------------------------------------



if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BSTAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16680, 1, 45, 3);
			player:setVar("BSTAFweapon", 0);
			player:setVar("BSTMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end
	if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BSTAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16680, 1, 45, 7, 43, 2);
			player:setVar("BSTAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end
	if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BSTAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16680, 1, 45, 11, 43, 4);
			player:setVar("BSTAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end



--------------------------------------------------------
--      BRD TRADE PAPER KNIFE 16766                   --
--------------------------------------------------------



if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BRDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16766, 1, 45, 4, 337, 1);  -- Song Recast
			player:setVar("BRDAFweapon", 0);
			player:setVar("BRDMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end
	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16766, 1, 45, 9, 337, 2);
			player:setVar("BRDAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end
	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16766, 1, 45, 14, 337, 3);
			player:setVar("BRDAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end




--------------------------------------------------------
--         RNG TRADE ZAMBURAK 17218                   --
--------------------------------------------------------



if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("RNGAFweaponxbow") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17218, 1, 45, 6);
			player:setVar("RNGAFweaponxbow", 0);
			player:setVar("RNGAFweaponxbow", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end
	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweaponxbow") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17218, 1, 45, 10, 29, 4);
			player:setVar("RNGAFweaponxbow", 2);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end
	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweaponxbow") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17218, 1, 45, 13, 29, 6);
			player:setVar("RNGAFweaponxbow", 3);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end


--------------------------------------------------------
--            SAM TRADE MAGOROKU 17812                --
--------------------------------------------------------



if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("SAMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17812, 1, 45, 5);
			player:setVar("SAMAFweapon", 0);
			player:setVar("SAMMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end
	if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SAMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17812, 1, 45, 12, 142, 1);
			player:setVar("SAMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end
	if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SAMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17812, 1, 45, 19, 142, 2);
			player:setVar("SAMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end



--------------------------------------------------------
--      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
--------------------------------------------------------



if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("NINAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 3);
			player:addItem(17772, 1, 45, 2);
			player:setVar("NINAFweapon", 0);
			player:setVar("NINMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end
	if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("NINAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 7, 25, 1);
			player:addItem(17772, 1, 45, 6, 25, 2);
			player:setVar("NINAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end
	if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("NINAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 11, 25, 2);
			player:addItem(17772, 1, 45, 10, 25, 3);
			player:setVar("NINAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17771);
			player:messageSpecial(ITEM_OBTAINED, 17772);
			
end


--------------------------------------------------------
--            DRG TRADE PEREGRINE 16887               --
--------------------------------------------------------



if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("DRGAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16887, 1, 45, 6);
			player:setVar("DRGAFweapon", 0);
			player:setVar("DRGMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end
	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRGAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16887, 1, 45, 14, 25, 4);
			player:setVar("DRGAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end
	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRGAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16887, 1, 45, 22, 25, 6);
			player:setVar("DRGAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end




--------------------------------------------------------
--         SMN TRADE DRAGON STAFF 17597               --
--------------------------------------------------------



if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("SMNAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17597, 1, 45, 11, 321, 1);
			player:setVar("SMNAFweapon", 0);
			player:setVar("SMNMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end
	if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SMNAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17597, 1, 45, 23, 321, 1);
			player:setVar("SMNAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end
	if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SMNAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17597, 1, 76, 1, 321, 1);
			player:setVar("SMNAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end


--------------------------------------------------------
--         BLU TRADE IMMORTAL SCIMITAR  17717         --
--------------------------------------------------------


if (job == 16) and (trade:hasItemQty(17717, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("BLUAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17717, 1, 45, 3, 550, 1); -- STR/DEX+2
			player:setVar("BLUAFweapon", 0);
			player:setVar("BLUMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BLUAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 8, 550, 3); -- STR/DEX+4
			player:setVar("BLUAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BLUAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 13, 550, 5); -- STR/DEX+6
			player:setVar("BLUAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17717);
			
end
	

	
	
--------------------------------------------------------
--      COR TRADE HEXAGUN 18702                    --
--------------------------------------------------------



if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("CORAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18702, 1, 45, 2, 29, 2, 27, 2);
			player:setVar("CORAFweapon", 0);
			player:setVar("CORMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 18702);
			
end
	if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("CORAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18702, 1, 45, 5, 29, 4, 27, 4);
			player:setVar("CORAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18702);
			
end
	if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("CORAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18702, 1, 45, 8, 29, 6, 27, 6);
			player:setVar("CORAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18702);
end	


--------------------------------------------------------
--      PUP TRADE ADARGAS 18353                     --
--------------------------------------------------------

if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("PUPAFweapon") == 3) then
            player:addItem(18353, 1);
			player:messageSpecial(ITEM_OBTAINED, 18353);
			player:setVar("PUPAFweapon",0);
			player:setVar("PUPAFweapon",1);			
			player:PrintToPlayer("Sashosho : Don't go off losing that weapon again or I will be very angry.", 0xD);
    end		
  
	
if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PUPAFweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18353, 1, 45, 2, 25, 4); -- Attack +5
			player:setVar("PUPAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18353);
			
end
	if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PUPAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18353, 1, 45, 5, 25, 6); -- Attack +7
			player:setVar("PUPAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18353);
			
end	



--------------------------------------------------------
--      DNC TRADE Mythril Knife 16467                    --
--------------------------------------------------------

if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("DNCAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16467, 1, 45, 4, 518, 1);
			player:setVar("DNCAFweapon", 0);
			player:setVar("DNCMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 16467);
			
end
	if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DNCAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16467, 1, 45, 7, 518, 2, 330, 1);
			player:setVar("DNCAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16467);
			
end
	if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DNCAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16467, 1, 45, 10, 518, 3, 330, 2);
			player:setVar("DNCAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16467);
end	





--------------------------------------------------------
--      SCH TRADE OAK POLE 17098                     --
--------------------------------------------------------

if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 2184, 10 ) and level >= 75 and (player:getVar("SCHAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17098, 1, 45, 11, 141, 2);
			player:setVar("SCHAFweapon", 0);
			player:setVar("SCHMythicWeapon", 1);			
			player:messageSpecial(ITEM_OBTAINED, 17098);
			
end
	if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SCHAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17098, 1, 45, 23, 141, 4);
			player:setVar("SCHAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17098);
			
end
	if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SCHAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Sashosho : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17098, 1, 45, 30, 141, 6);
			player:setVar("SCHAFweapon", 3);
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
	((job == 7) and (player:getVar("PLDAFshield") == 3)) or
	((job == 8) and (player:getVar("DRKAFweapon") == 3)) or
	((job == 8) and (player:getVar("DRKAFweapongs") == 3)) or
	((job == 9) and (player:getVar("BSTAFweapon") == 3)) or
	((job == 10) and (player:getVar("BRDAFweapon") == 3)) or
	((job == 10) and (player:getVar("BRDAFhorn") == 3)) or
	((job == 10) and (player:getVar("BRDAFharp") == 3)) or
	((job == 11) and (player:getVar("RNGAFweaponbow") == 3)) or
	((job == 11) and (player:getVar("RNGAFweapongun") == 3)) or
	((job == 12) and (player:getVar("SMNAFweapon") == 3)) or
	((job == 13) and (player:getVar("NINAFweapon") == 3)) or
	((job == 14) and (player:getVar("DRGAFweapon") == 3)) or
	((job == 15) and (player:getVar("SAMAFweapon") == 3)) or
	((job == 16) and (player:getVar("BLUAFweapon") == 3)) or
    ((job == 17) and (player:getVar("CORAFweapon") == 3)) or
    ((job == 18) and (player:getVar("PUPAFweapon") == 3)) or
    ((job == 19) and (player:getVar("SCHAFweapon") == 3)) or
    ((job == 20) and (player:getVar("PUPAFweapon") == 3)) then
	player:PrintToPlayer("Sashosho : Sashosho told me you were coming.  There is a technique used here by the locals", 0xD);
	player:PrintToPlayer("Sashosho : to bring out the true power in weapons crafted during the Crystal War.  If you trade me", 0xD);	
	player:PrintToPlayer("Sashosho : 10 Imperial Bronze Pieces, I can begin working on it immediately!", 0xD); 
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



