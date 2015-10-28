-----------------------------------
-- Area: Lower Jeuno
--  NPC: Oboro
-- Type: Artifact Weapon Upgrader and Relic Upgrader
-----------------------------------

require("scripts/globals/chocobo");
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
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18214, 1, 45, 16);
			player:setVar("WARAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("WARAFweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18214, 1, 45, 25, 25, 4); -- Attack +5
			player:setVar("WARAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("WARAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(18214, 1, 45, 34, 25, 6); -- Attack +7
			player:setVar("WARAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 18214);
			
end

--------------------------------------------------------
--       MONK TRADE Beat Cesti 17478                  --
--------------------------------------------------------


	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17478, 1, 45, 5);
			player:setVar("MNKAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end
	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("MNKAFweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17478, 1, 45, 9, 25, 4); -- Attack +5
			player:setVar("MNKAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end
	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("MNKAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17478, 1, 45, 15, 25, 6); -- Attack +7
			player:setVar("MNKAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17478);
			
end



--------------------------------------------------------
--      WHITE MAGE TRADE Blessed Hammer 17422         --
--------------------------------------------------------

if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17422, 1, 45, 3, 329, 9); -- Cure Potency +10%
			player:setVar("WHMAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("WHMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17422, 1, 45, 7, 329, 10); -- Cure Potency +11%
			player:setVar("WHMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("WHMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17422, 1, 45, 12, 329, 11); -- Cure Potency +12%
			player:setVar("WHMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17422);
			
end



--------------------------------------------------------
--      BLAC MAGE TRADE DUSKY STAFF 17572             --
--------------------------------------------------------



if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17572, 1, 45, 10);
			player:setVar("BLMAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BLMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17572, 1, 45, 11);
			player:setVar("BLMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BLMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17572, 1, 45, 33);
			player:setVar("BLMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17572);
			
end

--------------------------------------------------------
--      RED MAGE TRADE FENCING DEGEN 16829            --
--------------------------------------------------------



if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 4, 140, 1); -- Fast Cast +2
			player:setVar("RDMAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end
	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RDMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 9, 140, 2); -- Fast Cast +3
			player:setVar("RDMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end
	if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RDMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16829, 1, 45, 14, 140, 3); -- Fast Cast +4
			player:setVar("RDMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16829);
			
end


--------------------------------------------------------
--      THF TRADE MARAUDER'S KNIFE 16764              --
--------------------------------------------------------



if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16764, 1, 45, 4, 41, 1);  -- Crit hitrate +2
			player:setVar("THFAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end
	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("THFAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16764, 1, 45, 9, 41, 2);  -- Crit hitrate +3
			player:setVar("THFAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end
	if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("THFAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16764, 1, 45, 14, 41, 3);  -- Crit hitrate +4
			player:setVar("THFAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16764);
			
end


--------------------------------------------------------
--      PLD TRADE HONOR SWORD 17643                   --
--------------------------------------------------------



if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17643, 1, 45, 2);
			player:setVar("PLDAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end
	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PLDAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17643, 1, 45, 6, 25, 4);  -- Attack +5
			player:setVar("PLDAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end
	if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PLDAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17643, 1, 45, 9, 25, 6); -- Attack +7
			player:setVar("PLDAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17643);
			
end



--------------------------------------------------------
--      PLD TRADE HEATER SHIELD 12307                 --
--------------------------------------------------------



if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(12307, 1, 33, 4);
			player:setVar("PLDAFshield", 1);
			player:messageSpecial(ITEM_OBTAINED, 12307);
			
end
	if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PLDAFshield") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(12307, 1, 33, 9);
			player:setVar("PLDAFshield", 2);
			player:messageSpecial(ITEM_OBTAINED, 12307);
			
end
	if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PLDAFshield") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(12307, 1, 33, 14, 286, 4);  -- +15 DEF and +5 Shield Skill
			player:setVar("PLDAFshield", 3);
			player:messageSpecial(ITEM_OBTAINED, 12307);
			
end




--------------------------------------------------------
--      DRK TRADE RAVEN SCYTHE 16798                  --
--------------------------------------------------------



if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16798, 1, 45, 6);
			player:setVar("DRKAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end
	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRKAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16798, 1, 45, 14, 25, 4);
			player:setVar("DRKAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end
	if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRKAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16798, 1, 45, 22, 25, 6);
			player:setVar("DRKAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16798);
			
end




--------------------------------------------------------
--      DRK TRADE GREATSWORD 16590                    --
--------------------------------------------------------



if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16590, 1, 45, 7);
			player:setVar("DRKAFweapongs", 1);
			player:messageSpecial(ITEM_OBTAINED, 16590);
			
end
	if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRKAFweapongs") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16590, 1, 45, 15, 25, 4);
			player:setVar("DRKAFweapongs", 2);
			player:messageSpecial(ITEM_OBTAINED, 16590);
			
end
	if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRKAFweapongs") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16590, 1, 45, 23, 25, 6);
			player:setVar("DRKAFweapongs", 3);
			player:messageSpecial(ITEM_OBTAINED, 16590);
			
end


--------------------------------------------------------
--      BST TRADE BARABORI AXE 16680                  --
--------------------------------------------------------



if (job == 9) and (trade:hasItemQty(16880, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16880, 1, 45, 3);
			player:setVar("BSTAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end
	if (job == 9) and (trade:hasItemQty(16880, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BSTAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16880, 1, 45, 7, 43, 2);
			player:setVar("BSTAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end
	if (job == 9) and (trade:hasItemQty(16880, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BSTAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16880, 1, 45, 11, 43, 4);
			player:setVar("BSTAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16880);
			
end



--------------------------------------------------------
--      BRD TRADE PAPER KNIFE 16766                   --
--------------------------------------------------------



if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16766, 1, 45, 4, 337, 1);  -- Song Recast
			player:setVar("BRDAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end
	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16766, 1, 45, 9, 337, 2);
			player:setVar("BRDAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end
	if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16766, 1, 45, 14, 337, 3);
			player:setVar("BRDAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16766);
			
end


--------------------------------------------------------
--             BRD TRADE HORN 17352                   --
--------------------------------------------------------

-- singing and wind skill +2/3/4


if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17352, 1, 296, 2, 298, 2);
			player:setVar("BRDAFhorn", 1);
			player:messageSpecial(ITEM_OBTAINED, 17352);
			
end
	if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFhorn") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17352, 1, 296, 3, 298, 3);
			player:setVar("BRDAFhorn", 2);
			player:messageSpecial(ITEM_OBTAINED, 17352);
			
end
	if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFhorn") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17352, 1, 296, 4, 298, 4);
			player:setVar("BRDAFhorn", 3);
			player:messageSpecial(ITEM_OBTAINED, 17352);
			
end


--------------------------------------------------------
--          BRD TRADE LAMIA HARP 17356                --
--------------------------------------------------------

-- SONG Spellcasting Time


if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17356, 1, 322, 2);
			player:setVar("BRDAFharp", 1);
			player:messageSpecial(ITEM_OBTAINED, 17356);
			
end
	if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFharp") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17356, 1, 322, 3);
			player:setVar("BRDAFharp", 2);
			player:messageSpecial(ITEM_OBTAINED, 17356);
			
end
	if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFharp") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17356, 1, 322, 4);
			player:setVar("BRDAFharp", 3);
			player:messageSpecial(ITEM_OBTAINED, 17356);
			
end



--------------------------------------------------------
--      RNG TRADE SNIPING BOW 17188                   --
--------------------------------------------------------



if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17188, 1, 45, 11);
			player:setVar("RNGAFweaponbow", 1);
			player:messageSpecial(ITEM_OBTAINED, 17188);
			
end
	if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweaponbow") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17188, 1, 45, 24, 29, 4);
			player:setVar("RNGAFweaponbow", 2);
			player:messageSpecial(ITEM_OBTAINED, 17188);
			
end
	if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweaponbow") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17188, 1, 45, 36, 29, 6);
			player:setVar("RNGAFweaponbow", 3);
			player:messageSpecial(ITEM_OBTAINED, 17188);
			
end



--------------------------------------------------------
--      RNG TRADE SERPENTINE GUN 17256                --
--------------------------------------------------------



if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17256, 1, 45, 4);
			player:setVar("RNGAFweapongun", 1);
			player:messageSpecial(ITEM_OBTAINED, 17256);
			
end
	if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweapongun") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17256, 1, 45, 8, 29, 4);
			player:setVar("RNGAFweapongun", 2);
			player:messageSpecial(ITEM_OBTAINED, 17256);
			
end
	if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweapongun") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17256, 1, 45, 11, 29, 6);
			player:setVar("RNGAFweapongun", 3);
			player:messageSpecial(ITEM_OBTAINED, 17256);
			
end



--------------------------------------------------------
--         RNG TRADE ZAMBURAK 17218                   --
--------------------------------------------------------



if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17218, 1, 45, 6);
			player:setVar("RNGAFweaponxbow", 1);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end
	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweaponxbow") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17218, 1, 45, 10, 29, 4);
			player:setVar("RNGAFweaponxbow", 2);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end
	if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweaponxbow") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17218, 1, 45, 13, 29, 6);
			player:setVar("RNGAFweaponxbow", 3);
			player:messageSpecial(ITEM_OBTAINED, 17218);
			
end



--------------------------------------------------------
--         SMN TRADE DRAGON STAFF 17597               --
--------------------------------------------------------



if (job == 12) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17597, 1, 45, 11, 321, 1);
			player:setVar("SMNAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end
	if (job == 12) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SMNAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17597, 1, 45, 23, 321, 1);
			player:setVar("SMNAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end
	if (job == 12) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SMNAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17597, 1, 45, 35, 321, 1);
			player:setVar("SMNAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17597);
			
end

--------------------------------------------------------
--      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
--------------------------------------------------------



if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Well Done.  Here are your items");
			player:addItem(17771, 1, 45, 3);
			player:addItem(17772, 1, 45, 2);
			player:setVar("NINAFweapon", 1);
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



if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16887, 1, 45, 6);
			player:setVar("DRGAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end
	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRGAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16887, 1, 45, 14, 25, 4);
			player:setVar("DRGAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end
	if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRGAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(16887, 1, 45, 22, 25, 6);
			player:setVar("DRGAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 16887);
			
end



--------------------------------------------------------
--            SAM TRADE MAGOROKU 17812                --
--------------------------------------------------------



if (job == 15) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17812, 1, 45, 5);
			player:setVar("SAMAFweapon", 1);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end
	if (job == 15) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SAMAFweapon") == 1)  then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17812, 1, 45, 12, 142, 1);
			player:setVar("SAMAFweapon", 2);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end
	if (job == 15) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SAMAFweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
			player:addItem(17812, 1, 45, 19, 142, 2);
			player:setVar("SAMAFweapon", 3);
			player:messageSpecial(ITEM_OBTAINED, 17812);
			
end





	


end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


	
    
    if (player:hasItem(18214) or player:hasItem(17478) or player:hasItem(17422) or player:hasItem(17572) or player:hasItem(16829) or 
	player:hasItem(16764) or player:hasItem(17643) or player:hasItem(12307) or player:hasItem(16978) or player:hasItem(16590) or
	player:hasItem(16680) or player:hasItem(16766) or player:hasItem(17352) or player:hasItem(17356) or player:hasItem(17188) or
	player:hasItem(17256) or player:hasItem(17218) or player:hasItem(17597) or player:hasItem(17771) or player:hasItem(17772) or
	player:hasItem(16877) or player:hasItem(17812)) then
	
   player:PrintToPlayer("Oboro : Hey, I can upgrade that weapon for you. Bring me 15 Beastmen seals for the first", 0xD);
   player:PrintToPlayer("Oboro : upgrade, 30 beastmen seals for the second, and 15 Kindred seals for the last", 0xD);
   else
   player:PrintToPlayer("Oboro : I'm busy!", 0xD);
   end
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