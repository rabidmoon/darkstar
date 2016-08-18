--------------------------------------------------------------
-- func: @mogshop <page number>
-- auth: forgottenandlost
-- desc: opens the custom moogle shop menu anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,page)
local level = player:getMainLvl();


    if (page == 0 or page == nil) then
        player:PrintToPlayer( "Merchant Moogle : 1: Crystals, 2: Meds, 3: Food, 4: Tools/Ammo, 5: Weapons, 6: Armor, 7: Beyond Infinity, 8: Misc, 9: Attachments", 0x1F);
        
    elseif (page == 1) then -- HQ Crystals
        local stock_1 =
        {
            4238,   5000,   -- HQ Fire Crystal
            4239,   5000,   -- HQ Ice Crystal
            4240,   5000,   -- HQ Wind Crystal
            4241,   5000,   -- HQ Earth Crystal
            4242,   5000,   -- HQ Lightning Crystal
            4243,   5000,   -- HQ Water Crystal
            4244,   5000,   -- HQ Light Crystal
            4245,   5000    -- HQ Dark Crystal
        };
        showShop(player, STATIC, stock_1);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Crystal Depot Kupo!", 0x1F);
    elseif (page == 2) then -- Pharmacy
        local stock_2 =
        {
            4148,   1000,     -- Antidote
            4154,   1500,    -- Holy Water
            4150,   1000,    -- Eye Drops
            4151,   1000,    -- Echo Drops
            4153,   2500,    -- Bottle of Antacid
            5418,   1500,    -- Tincture
            5328,   2500,    -- Hi-Potion Drop
            5358,   2500,    -- Hi-Ether Drop
            5356,   2500,    -- Remedy Ointment
            4202,   25000   -- Daedalus Wing

        };
        showShop(player, STATIC, stock_2);
        player:PrintToPlayer( "Merchant Moogle : Medicines for you, Kupo!", 0x1F);
    elseif (page == 3) then -- MogDonalds
        local stock_3 =
        {
			-- attack foods
			4381,	250,   -- Meat mithkabob 
			5142,	3000,  -- bison Steak 
			5146,	3000,  -- Hedgehog Pie 
			5759,	250,   -- red curry bun 
			5166,   2100,  -- Coeurl Sub Sandwich
			-- acc food
			5721,	250,   -- Crab Sushi  
			5176,	250,   -- Bream Sushi 
			5148,	250,   -- Squid Sushi 
			5149,	250,   -- Sole Sushi 
			-- hybrid foods
			5743,   6000,  -- Pizza
			5685,   8000,  -- Rabbit Pie
			-- tank foods
			4488,	3000,  -- Jack-o'-Lantern
			5178,	250,   -- Dorado Sushi
			5191,	250,   -- Pescatora
			5174,	250,   -- Tavnazian Taco 
			-- mage food
			4421,	250,   -- Melon Pie  
			4414,	250,   -- Rolanberry Pie 
			5718,	250,   -- Cream Puff
			4502,	3000,  -- Marron Glace
			-- Juice
			5932,   1600,   -- Kitron Juice
			4424,   1100,   -- Melon Juice
			4422,   700,    -- Orange Juice
			4558,	1200    -- Yagudo Drink
        };
        showShop(player, STATIC, stock_3);
        player:PrintToPlayer( "Merchant Moogle : Fresh food for your adventures, Kupo!", 0x1F);
    elseif (page == 4) then
        local stock_4 =
        {
            605,    1000,     -- Pickaxe
            1021,   1000,     -- Hatchet
            1020,   1000,     -- Sickle
            4165,   2300,    -- Silent Oil
            4164,   1300,    -- Prism Powder
            5362,   1300,    -- Rainbow Powder
            5319,   9200,    -- Toolbag (Shinobi-Tabi)
            5314,   11000,    -- Toolbag (Shihei)
            1022,   5200,     -- Thief's Tools
			4219,   1100,     -- Stone Quiver 
			4225,   2100,     -- Iron Quiver
			4226,   3100,     -- Silver Quiver
			5335,   1000,     -- Acid Bolt QUiver
			5337,   11000,     -- Sleep Bolt Quiver
			5339,   6100,     -- Bloody Bolt Quiver
		   19229,   10,       -- Tin Bullet	
		    5363,   3200,     -- Bullet Pouch
        };
        showShop(player, STATIC, stock_4);
        player:PrintToPlayer( "Merchant Moogle : Tools and ammo just for you, Kupo!", 0x1F);
		elseif (page == 5) then
        player:PrintToPlayer( "Merchant Moogle : Choose your type 51: One-Handed Weapons, 52: Two-Handed Weapons, 53: Ranged Weapons", 0x1F);		
		elseif (page == 51) and (level < 50) then
        local stock_5a =
        {
            16391,		3000,	 -- Brass Knuckles
			16386,		5100,	  -- Lizard Cesti
		    16409,		5100,	  -- Lynx Baghnakhs
		    17514,	    10000,	  -- Hydro Claws
		    16393,		10000,	  -- Mythril Knuckles
		    16466,		900,	  -- Knife
		    16473,		5600,	  -- Kukri
			16479,		7200,	  -- Acid Kukri
			16572,		1500,	  -- Bee Spatha
			16517,		4700,	  -- Degen
			16532,		7800,	  -- Gladius
			16648,		2200,	  -- Legionnaires Axe
			16649,		4200,	  -- Bone Pick
			17940,		6000,	  -- Military Pick
			16644,		7500,	  -- Mythril Axe
			17780,		3000,	  -- Kyofu
			16917,		2300,	  -- Suzume
			17775,		5500,	  -- Fukuro
			19276,		7000,	  -- Midare
			17025,		1500,	  -- Chestnut Club
			17441,		6800	  -- Eremite's Wand
        };
        showShop(player, STATIC, stock_5a);
        player:PrintToPlayer( "Merchant Moogle : One-Handed Weapons!", 0x1F);
        elseif (page == 51) and (level >= 50) then
        local stock_5m =
        {
			16394,		8700,    -- Darksteel Knuckles
			18743,		9500,    -- Darksteel Santi
			18748,		11250,    -- Hades Sainti
			16468,		8500,    -- Darksteel knife
			16477,		9500,    -- Cement Kukuri
			17628,		11000,    -- Behemoth Knife
			18023,		11200,    -- Jambiya
			16538,      8800,     -- Darksteel Sword
			16560,	    9300,     -- Cutlass
			17720,     10100,     -- Company Flurret
			16547,     11600,     -- Anelace			
			16645,      8500,     -- Darksteel Axe
			16652,      9200,     -- Darksteel Pick
			16659,     11000,     -- Tabarzin
			16913,      8520,     -- Shinogi
			16903,      9500,     -- Kabutowari
			16904,     12000,     -- Fudo
			17037,      8500,     -- Darksteel Mace
			17046,      9600,     -- Darksteel Maul
			18848,     11200     -- Brass Jadagna
        };
        showShop(player, STATIC, stock_5m);
        player:PrintToPlayer( "Merchant Moogle : One-Handed Weapons!", 0x1F);		
		elseif (page == 52) and (level < 50) then
        local stock_5b =
        {
            16705,		1200,	  -- Greataxe
			18209,		3500,	  -- Platoon Cutter
			16712,		7100,	  -- Centurion's Axe
			16708,		8000,	  -- Horror Voulge
			18956,		1300,	  -- Serpett
			16770,		3500,	  -- Zaghnal
			16776,		7800,	  -- Mrc Cpt Scythe
			16834,		1200,	  -- Brass Speak
			16852,		4000,	  -- Royal spr spear
			16844,		8000,	  -- Ryal Halberd
			16960,		1200,	  -- Ughigatana
			17820,		3500,	  -- Gunromaru
			16988,		6200,	  -- Kotetsu
			16970,		8300,	  -- Hosodachi
			17089,		1300,	  -- Holy Staff
			17096,		2600,	  -- Holly Pole
			17090,		5900,	  -- Elm Staff
			17580,		8100,	  -- Military Pole
			16606,      1200,     -- Rusty GS
			16583,      2900,     -- Claymore
			16930,      4000,     -- Merc Captain GS
			16584,      7800     -- Mythril GS
			
        };
        showShop(player, STATIC, stock_5b);
        player:PrintToPlayer( "Merchant Moogle : Two-Handed Weapons!", 0x1F);
		elseif (page == 52) and (level >= 50) then
        local stock_5n =
        {
			17545,		12000,   -- Fire Staff
			17547,		12000,   -- Ice Staff
			17549,		12000,   -- Wind Staff
			17551,		12000,   -- Earth Staff
			17553,		12000,   -- Thunder Staff
			17555,		12000,   -- Water Staff
			17557,		12000,   -- Light Staff
			17559,		12000,   -- Dark Staff
			16585, 		8500,	-- Darksteel Claymore
			16596,		9500,	-- Flamberge
			16592,		12000,	-- Giant Sword
			18226,		9000,	-- Darksteel Voulge
			16730,		10500,	-- Colossal Axe
			16707,		13000,	-- Bhuj
			16848,		10000,	-- Darksteel Lance
			16849,		15000,	-- Cement Lance
			16885,		22000,	-- Colossal Lance
			16984,		10000,	-- Jindachi
			16972,		15500,	-- Kazaridachi
			18439,		21000	-- Shirogotana
		
		
		
			
        };
        showShop(player, STATIC, stock_5n);
        player:PrintToPlayer( "Merchant Moogle : Two-Handed Weapons!", 0x1F);			
		elseif (page == 53) and (level < 50) then
        local stock_5c =
        {
            17153,		1200,	  -- Self Bow
			17161,		3500,	  -- Power Bow
			17155,		7100,	  -- Composite Bow
			17257,		2900,	  -- Bandits Gun
			17248,		6000,	  -- Arquebus
			17272,		7300,	  -- Military Gun
			17217,      1300,     -- Cross Bow
			17230,      3600,     -- Power Crossbow
			17247,      14000     -- Rikonodo
        };
        showShop(player, STATIC, stock_5c);
        player:PrintToPlayer( "Merchant Moogle : Ranged Weapons!", 0x1F);
		elseif (page == 53) and (level >= 50) then
        local stock_5o =
        {
			19226,		11000,	   -- Blunderbuss
			17157,      12000,     -- Rapid Bow
			17251,		18000,	   -- Hellfire
			17200,      18500      -- Rosenbogen	
        };
        showShop(player, STATIC, stock_5o);
        player:PrintToPlayer("Merchant Moogle : Ranged Weapons!", 0x1F);		
	elseif (page == 6) then
	player:PrintToPlayer( "Merchant Moogle : Welcome, Kupo! 61: Head, 62: Body, 63: Hands, 64, Legs, 65: Feet, 66: Accessories", 0x1F);
	elseif (page == 61) and (level < 50) then
        local stock_6a =	
		{	
			12497,	250,	  -- Brass Hairpin		 
			12530,	900,  -- Sage's Circlet		30F2	
			12498,	400,	 -- Cotton Headband		30D2	
			13833,	400,	  -- Noble's Ribbon		3609	
			15208,	1200, -- Baron's Chap		3B68	
			13827,	1900,  -- Beetle Mask +1		3603	
			15166,	4200, -- Seer's Crown +1		3B3E	
			13824,	1200,  -- Strong Bandana		3600			
			12533,	2200,  -- Silver Mask +1		30F5	
			15170,	8000,  -- Blink Band		    3B42	
			13831,	3200, -- Sallet +1		    3607
			15166,  4200,     -- Seer's Crown +1
			12480,  2000,     -- Lizard Mask +1
			12432,   450,     -- Facegard	
			13840,  5100,     -- Electrum Hairpin
			13829,  5000,    -- Caprice Mask +1
        };			
		showShop(player, STATIC, stock_6a);
        player:PrintToPlayer( "Armory Head: Welcome, Kupo!");
	elseif (page == 61) and (level >=50) then    -- Shop for Level 50 and Above Head Pieces
        local stock_6r =	
		{	
			13939,	11000,  -- Austers Hat
			13698,	10000,  -- Beak Helm
			16063,  11500,  -- Jeridah Hat
			16061,	12000,  -- Sipahi Turban
			13881,  11000,  -- Arhat Jinpachi
			12477,  13000,  -- Nobles Crown
			12428,  10000   -- Caleta
        };			
		showShop(player, STATIC, stock_6r);
        player:PrintToPlayer("Merchant Moogle : Head Armor Kupo!", 0x1F);		
		elseif (page == 62) and (level < 50) then
	    local stock_6b =
        {
            12608,  1000,     -- Tunic
			13729,  2200,     -- Priest's Robe 
		    12602,  5500,     -- Wool Robe
			14424,  2600,     -- Seer's Tunic
			12568,   300,     -- Leather Vest   
			12616,   2500,    -- Tunic +1 
			14490,   2500,    -- Mana Tunic
			12661,   1000,    -- Solid Mail
			12591,   1000,    -- Doublet +1
			14495,   3500,    -- Healing Harness
			13697,   1800,    -- Fine Jerkin
			14447,   2500,    -- Baron 
			13717,   3200,    -- Beetle Harness
			12567,   5000,    -- Steam Scale Mail
			13731,   4300,    -- Faerie Tunic
			13707,   5500,    -- Strong Vest 
			11339,   6300,    -- Channeling Robe   
			12663,   7000,    -- Strong Harness 
			13709,   8000,    -- Cuir Bouilli +1
			13724,   9000,    -- Breastplate +1 
			11348,   10000,   -- Salutary Robe +1
			13714,   11000,   -- Carapace Harness +1
			13727,   12500,   -- Dino Jerkin
			13737,   15000,   -- Mithril Breaste+1
			12651,   35000,   -- White Cloak +1
	        12554,   28000    -- Banded Mail 		
		
        };
        showShop(player, STATIC, stock_6b);
        player:PrintToPlayer("Merchant Moogle : Body Armor Kupo!", 0x1F);	
		elseif (page == 62) and (level >= 50) then
	    local stock_6s =
        {
			13814,  19500,  -- Austers
			12579,  32000,  -- Scorpion Harness	
			13748,	30000,  -- Vermillion Cloak
			14526,	20000,  -- Jeridah Peti
			14524,  25000,  -- Sipahi
			13744,	25000,  -- Justaucorps
			13740,  40000,  -- Byrnie
			13754,	25000,  -- Black Cotehardie 
			13795,	23000,  -- Arhat
			12605,	32000,  -- Nobles Tunic
			13779,	35000,  -- Black Cloak
			14436,	20000   -- Blessed Briault		
        };
        showShop(player, STATIC, stock_6s);
        player:PrintToPlayer("Merchant Moogle : Body Armor Kupo!", 0x1F);	
		elseif (page == 63) and (level < 50) then
	    local stock_6c =
        {
			12696,	100,   -- Leather Gloves		
			12736,	200,   -- Mitts			    
			12778,	650,   -- Linen Cuffs +1		
			12785,	350,   -- Fine Gloves		    
			12789,	1550,  -- Beetle Mittens +1	
			14863,	2000,  -- Kampfhentzes		
			12726,	1800,  -- Merc Capt gloves		
			12793,	3000,  -- Mage's Cuffs	
			12791,	4050,  -- Gauntlets + 1		    
			14052,	7750,  -- Luisant Moufles		
			12795,	3600,  -- Dino Gloves		    
			13958,	6000,  -- Mythril Gauntts +1	
			12794,	4000,  -- Mage's Mitts	
            12790,  4000   -- Caprice Mitts			
        };
        showShop(player, STATIC, stock_6c);
        showShop(player, STATIC, stock_6s);
        player:PrintToPlayer("Merchant Moogle : Hand Armor Kupo!", 0x1F);
		elseif (page == 63) and (level >=50) then
	    local stock_6t =
        {
			14826,	8000,   -- Austers Cuffs
			14934,  10100,  -- Jeridah
			14932,  11200,  -- Sipahi
			14023,  10000,  -- Arhats Tekko
			12724,  11000,  -- Battle Bracers	
			12733,  11000,  -- Nobles Mitts
			14875,  13000,  -- Blessed Mitts
        };
        showShop(player, STATIC, stock_6t);
        showShop(player, STATIC, stock_6s);
        player:PrintToPlayer("Merchant Moogle : Hand Armor Kupo!", 0x1F);	
		elseif (page == 64) and (level < 50) then
	    local stock_6d =
        {
			12824,		225,  -- Leather Trousers	
			12898,		900,  -- Slacks +1		    
			12912,		1250,  -- Bone Subligar +1	
			15405,		900,  -- Baron's Slops		
			12808,		3200, -- Chain Hose +1		
			14328,		2250, -- Seer's Slacks +1	
			14332,		2250, -- Kampfdiechlings		
			12910,		3500, -- Strong Trousers		
			12891,		4200, -- Iron Subligar +1	
			12918,		3800, -- Mage's Slops		
			12919,		4800, -- Dino Trousers		
			14211,		6400, -- Mythril Cuisses +1	
			12926,		7000,  -- White Slacks +1
			12870,      5000,  -- Combat Cast Slacks
        };
        showShop(player, STATIC, stock_6d);
        player:PrintToPlayer("Merchant Moogle : Leg Armor Kupo!", 0x1F);
		elseif (page == 64) and (level >= 50) then
	    local stock_6u =
        {
			14310,		13000,  -- Austers Slops
			15605,      13200,  -- Jeridah
			15603,      14000,  -- Sipahi
			12829,		13500,  -- Beak Trousers
			12852,      14000,  -- Battle Hose
			14253,      14500,  -- Arhat
			12861,      16000,  -- Nobles Slacks
			15391,      16000  -- Blessed			
        };
        showShop(player, STATIC, stock_6u);
        player:PrintToPlayer("Merchant Moogle : Leg Armor Kupo!", 0x1F);		
		elseif (page == 65) and (level < 50) then
	    local stock_6e =
        {
			12952,	100,  -- Leather Highboots	
			13027,	1250,  -- Brass Leggins +1	
			12991,	650, -- Holly Clogs +1		
			13052,	900,  -- Light Soleas			
			13042,	800,  -- Bone Leggings +1	
			13048,	1000,  -- Mage's Sandles		
			14133,	3200,  -- Winged Boots +1		
			15321,	3600,  -- Kampfschuhs		    
			13041,	2500,  -- Cuir Highboots +1	
			13023,	2400,  -- Ebony Sabots +1		
			13715,	3200,  -- Carapace Legs +1	
			14086,	4800,  -- Mythril Legs +1		
			12995,	4000  -- Mocassins +1	
        };
        showShop(player, STATIC, stock_6e);
        player:PrintToPlayer("Merchant Moogle : Feet Armor Kupo!", 0x1F);
		elseif (page == 65) and (level >= 50) then
	    local stock_6v =
        {
			14189,	8000,  -- Austers
			13702,  8500,  -- Beak
			15689,  8950,  -- Jeridah
			15687,  9000,  -- Sipahi
			12980,  9100,  -- Battle Boots
			14129,  10100, -- Arhat
			12989,  11500, -- Nobles Pumps
			15329,  12530  -- Blessed	
        };
        showShop(player, STATIC, stock_6v);
        player:PrintToPlayer("Merchant Moogle : Feet Armor Kupo!", 0x1F);			
		elseif (page == 66) and (level < 50) then
        local stock_6f =
		{
			13457,  4500,   -- Beetle Ring
			13476,  4500,    -- Peridot
			13477,  4500,    -- Garnet
			13478,  4500,    -- Goshenite
			13479,  4500,    -- Ametrine Ring
			13480,  4500,    -- Turqoise
			13481,  4500,    -- Sphene Ring
			13482,  4500,    -- Black Ring
			13483,  4500,    -- Pearl Ring
			13076,  2300,    -- Fang Necklace
			13073,  2100,    -- Holy Phial
			13584,  2450,    -- Cotton Cape
			13588,  2300,    -- DHamel Mantle
			13614,  2300,    -- Bronze Cape
			13577,  2100,    -- Black Cape		
			13323,  4700,    -- Beetle Earring
			13366,  4700,    -- Dodge Earring
			13320,  4700,    -- Black Earring
			13211,  4100,    -- Friars Rope
			13225,  4600     -- Brave Belt		
		};
		showShop(player, STATIC, stock_6f);
        player:PrintToPlayer("Merchant Moogle : Accessories and more Kupo!", 0x1F);
		elseif (page == 66) and (level >= 50) then
        local stock_6w =
		{
			13134,	12000,   -- Ashura Necklace
			16263,  12000,   -- Beak Necklace
			13325,  10000,   -- Fang Earring
			13416,  11000,   -- Bat Earring
			14761,  35000,   -- Elusive Earring
			13312,  30000,   -- Coral Earring
			14630,  35000,   -- Flame Ring
			14640,  35000,   -- Snow Ring
			14636,  35000,   -- Breeze Ring
			14634,  35000,   -- Soil Ring
			14638,  35000,   -- Thunder Ring
			14632,  35000,   -- Aqua Ring
			14642,  35000,   -- Light Ring
			14644,  35000,   -- Dark Ring
			15431,  15000,   -- Astral Rope
			15292,  17000,   -- Penetints Rope
			15884,  21000,   -- Potenet Belt
			13597,  13000,   -- Beak Mantle
			13591,  16400,   -- Behemoth Mantle
			13687,  15000,   -- Sapient Cape
			13645,  17000,   -- Amemet Mantle
			16231,  14500   -- Smilidon Mantle		
		};
		showShop(player, STATIC, stock_6w);
        player:PrintToPlayer("Merchant Moogle : Accessories and more Kupo!", 0x1F);		
	    elseif (page == 7) then -- Beyond infinity
        local plevel = player:getMainLvl();
           if (plevel > 98) then
            local stock_7=
            {
                10902,  5000,     -- Euxine Hat
				10475,  5000,     -- Euxine Coat
				10524,  5000,     -- Euxine Gloves
				10555,  5000,     -- Euxine Kecks
				10621,  5000,     -- Euxine Nails
            };
            showShop(player, STATIC, stock_7);
            player:PrintToPlayer( "Beyond Infinity: Welcome, Kupo!");
        else
        player:PrintToPlayer("Merchant Moogle : That store is not accessible yet Kupo", 0x1F);	
        end
	
	
		elseif (page == 8) then
	    local stock_8 =
        {
			1042,    25000,   -- Davoi Coffer Key
			1043,    25000,     -- Bdx
			1044,    25000,     -- Ozt
			1045,    25000,     -- Nest
			1046,    25000,      -- Eld
			1047,    25000,       -- Grl
			1048,    25000,       -- Zvahl
			1049,    25000,       -- Ugl
			1050,    25000,       -- Den
			1051,    25000,       -- Kuftal
			1052,    25000,       -- Byd
			1053,    25000,       -- Cld
			1054,    25000,       -- QSC
			1057,    25000,       -- Tor
			1059,    25000,       -- Groto
			17583,   7000, 
			17584,   7000,   
			17585,   7000,
			
			
        };
        showShop(player, STATIC, stock_8);
        player:PrintToPlayer("Merchant Moogle : Miscellaneous items Kupo", 0x1F);	
		elseif (page == 9) then
	    local stock_9 =
        {
            8513,     5000,    -- Accelerator
            8516,    15000,    -- Accelerator II
			8546,     5000,    -- Armor Plate
			8548,    17000,    -- Armor Plate II
			8641,     7000,    -- Auto-Repair Kit 
			8644,    15000,    -- Auto-Repair Kit II
			8520,    15000,    -- Barrage Turbine
			8583,    15000,    -- Coiler
			8643,     8000,    -- Damage Gauge
			8517,    10000,    -- Drum Magazine
			8582,    10000,    -- Dynamo
			1050,    12000,    -- Flashbulb
			8642,    15000,    -- Hammermill
			8451,    10000,    -- Inhibitor
			8482,     5000,    -- Loudspeaker I
			8484,    10000,    -- Loudspeaker II
			8674,     5000,    -- Mana Converter
			8609,    15000,    -- Mana Jammer
			8612,     7000,    -- Mana Jammer II
			8673,     8000,    -- Mana Tank
			8676,    16000,    -- Mana Tank II
			8483,     5000,    -- Scanner
			8545,    10000,    -- Shock Absorber
			8577,     5000,    -- Stabilizer I
			8580,    10000,    -- Stabilizer II
			8449,     7000,    -- Strobe
			8450,     7000,    -- Tension Spring
			8452,    15000,    -- Tension Spring II
            8518,    20000     -- Tubro Charger
			
			
        };
        showShop(player, STATIC, stock_9);
        player:PrintToPlayer("Merchant Moogle : Attachments Kupo", 0x1F);	
		
		
		
       else
        -- local Mog = 16982044;
        -- message = "Test!";
        -- SpoofSay(Mog,player:getID(),message);
        player:PrintToPlayer( string.format( "The MogShop catalog doesn't have a page %i, Kupo!", page ) );
    end
end;