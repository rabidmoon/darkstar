-----------------------------------
--
-- Augments
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------

-- Augment List

AUG_HP             = 1; -- HP + 1
AUG_HP_II          = 2; -- HP + 33
AUG_HP_III         = 3; -- HP + 65
AUG_HP_IV          = 4; -- HP + 97
--
AUG_MP1             = 9;
AUG_MP33            = 10;
AUG_MP65            = 11;
AUG_MP97            = 12;

AUG_ACC             = 23;
AUG_ATT             = 25;
AUG_RACC            = 27;
AUG_RATT            = 29;
AUG_EVA             = 31;

AUG_ENM				= 39;
AUG_CRIT			= 41;
AUG_MACC            = 35;
AUG_DMG             = 45; -- DMG + 1

AUG_ACC_II          = 62; -- Accuracy + 33
AUG_RACC_II         = 63; -- Ranged Acc + 33
AUG_MACC_II         = 64; -- Magic Acc + 33
AUG_ATT_II          = 64;
AUG_ACC_ATT			= 68; -- Accuracy + 1 / Attack + 1
AUG_MACC_MATT       = 131; -- Magic Acc + 1 / Magic Attack + 1
AUG_MATT            = 133; -- Magic Attack + 1
AUG_BLANK           = 2010; -- Blank
AUG_TRIAL           = 2047;




-- Armor
-- Ebur Bliat (WHM/SMN)
MAGE1_HEAD     = 12140; -- Ebur Caubeen
MAGE1_BODY     = 12176; -- Ebur Bliat
MAGE1_HANDS    = 12212; -- Ebur Gages
MAGE1_LEGS     = 12248; -- Ebur Spats
MAGE1_FEET     = 12284; -- Ebur Golashes

-- Ebon Coat (BLM/SCH/GEO)
MAGE2_HEAD     = 12135;
MAGE2_COAT     = 12171;
MAGE2_HANDS    = 12207; -- Ebon Cuffs
MAGE2_LEGS     = 12243; -- Ebon Pants
MAGE2_FEET     = 12279; -- Ebon Sabots



duskorb = {8963,8964,8965,4096}; -- place all trading stones in the array


-- Upgrade Info
-- [Rank] = 
allarmor = {12140, 12176};
headcheck = {MAGE1_HEAD,MAGE2_HEAD};
body = {MAGE1_BODY,MAGE2_BODY}


totalrp = {30,80,160,280,450,670,950,1290,1700,2180,2740,3390,4140,5000,5980}


woeArmorA =
{
    [1] = {head, {AUG_ACC,2,AUG_BLANK,1,AUG_BLANK,1,AUG_BLANK,1,1}}  -- Acc + 3
          --body, {3,1}};	





}

function calcRank(player, trade, rankvar, rpvar, armor)

if (armor == MAGE1_HEAD) then
    printf("This is good");
	rpvar = "MAGE1_HEAD_RP";
	rankvar = "MAGE1_HEAD_RANK";
end







end











