-----------------------------------
-- Area: Bibiki Bay
-- NPC:  ??? Spawns Mob for High Artifact
-- @pos -602 -3 -686
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/status")

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local payment = 60000; 
local pinfamy = player:getCurrency("infamy");

local h2h = 18264;
local dagger = 18270;
local sword = 18276;
local gs = 18282;
local axe = 18288;
local gaxe = 18294;
local scythe = 18306;
local pole = 18300;
local katana = 18312;
local gkatana = 18318;
local club = 18324;
local staff = 18330;
local bow = 18348;
local gun = 18336;

if (player:getVar("WARHAWeapon") == 2 and trade:hasItemQty(18505,1)) then
    player:tradeComplete();
	player:setVar("WARHAWeapon",0);
	player:setVar("WARHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("MNKHAWeapon") == 2 and trade:hasItemQty(18764,1)) then
    player:tradeComplete();
	player:setVar("MNKHAWeapon",0);
	player:setVar("MNKHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("WHMHAWeapon") == 2 and trade:hasItemQty(18870,1)) then
    player:tradeComplete();
	player:setVar("WHMHAWeapon",0);
	player:setVar("WHMHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("BLMHAWeapon") == 2 and trade:hasItemQty(18589,1)) then
    player:tradeComplete();
	player:setVar("BLMHAWeapon",0);
	player:setVar("BLMHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("RDMHAWeapon") == 2 and trade:hasItemQty(17761,1)) then
    player:tradeComplete();
	player:setVar("RDMHAWeapon",0);
	player:setVar("RDMHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("THFHAWeapon") == 2 and trade:hasItemQty(19115,1)) then
    player:tradeComplete();
	player:setVar("THFHAWeapon",0);
	player:setVar("THFHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("PLDHAWeapon") == 2 and trade:hasItemQty(17762,1)) then
    player:tradeComplete();
	player:setVar("PLDHAWeapon",0);
	player:setVar("PLDHAFight",1);
	player:PrintToPlayer("Your shield begins to react violently!", 0xD); 
elseif (player:getVar("PLDHAshield") == 2 and trade:hasItemQty(12307,1)) then
    player:tradeComplete();
	player:setVar("PLDHAshield",0);
	player:setVar("PLDHAFightShield",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("DRKHAWeapon") == 2 and trade:hasItemQty(18995,1)) then
    player:tradeComplete();
	player:setVar("DRKHAWeapon",0);
	player:setVar("DRKHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("BSTHAWeapon") == 2 and trade:hasItemQty(17966,1)) then
    player:tradeComplete();
	player:setVar("BSTHAWeapon",0);
	player:setVar("BSTHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("BRDHAWeapon") == 2 and trade:hasItemQty(19116,1)) then
    player:tradeComplete();
	player:setVar("BRDHAWeapon",0);
	player:setVar("BRDHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("RNGHAWeapon") == 2 and trade:hasItemQty(18763,1)) then
    player:tradeComplete();
	player:setVar("RNGHAWeapon",0);
	player:setVar("RNGHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("SAMHAWeapon") == 2 and trade:hasItemQty(18452,1)) then
    player:tradeComplete();
	player:setVar("SAMHAWeapon",0);
	player:setVar("SAMHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("NINHAWeapon") == 2 and trade:hasItemQty(19275,1)) then
    player:tradeComplete();
	player:setVar("NINHAWeapon",0);
	player:setVar("NINHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 	
elseif (player:getVar("DRGHAWeapon") == 2 and trade:hasItemQty(19303,1)) then
    player:tradeComplete();
	player:setVar("DRGHAWeapon",0);
	player:setVar("DRGHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 	
elseif (player:getVar("SMNHAWeapon") == 2 and trade:hasItemQty(18601,1)) then
    player:tradeComplete();
	player:setVar("SMNHAWeapon",0);
	player:setVar("SMNHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
elseif (player:getVar("BLUHAWeapon") == 2 and trade:hasItemQty(17763,1)) then
    player:tradeComplete();
	player:setVar("BLUHAWeapon",0);
	player:setVar("BLUHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("CORHAWeapon") == 2 and trade:hasItemQty(18737,1)) then
    player:tradeComplete();
	player:setVar("CORHAWeapon",0);
	player:setVar("CORHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("PUPHAWeapon") == 2 and trade:hasItemQty(18765,1)) then
    player:tradeComplete();
	player:setVar("PUPHAWeapon",0);
	player:setVar("PUPHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
elseif (player:getVar("DNCHAWeapon") == 2 and trade:hasItemQty(19117,1)) then
    player:tradeComplete();
	player:setVar("DNCHAWeapon",0);
	player:setVar("DNCHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
elseif (player:getVar("SCHHAWeapon") == 2 and trade:hasItemQty(18602,1)) then
    player:tradeComplete();
	player:setVar("SCHHAWeapon",0);
	player:setVar("SCHHAFight",1);
	player:PrintToPlayer("Your weapon begins to react violently!", 0xD); 
end  	









if (trade:hasItemQty(1404, 1 )) and (trade:hasItemQty(1405, 1)) and (trade:hasItemQty(1406, 1)) and (trade:hasItemQty(1407, 1)) then
    	printf("Feeslot triggered");
    -- if (player:getFreeSlotsCount() == 0) then
	   -- player:PrintToPlayer("Please make room in your inventory", 0xD); 
	-- elseif (player:getFreeSlotsCount() > 0) then
	-- Obtain High Artifact

	if (pinfamy >= payment) then   
        if (player:getVar("WARHAFight") == 2) then  -- WAR
	    	player:tradeComplete();		
    	    player:addItem(18505,1,143,1,59,0) 
			player:messageSpecial(ITEM_OBTAINED,18505);
			player:setVar("WARHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("MNKHAFight") == 2) then  -- MNK
	    	player:tradeComplete();		
	    	player:addItem(18764,1,194,1,59,0) 
			player:messageSpecial(ITEM_OBTAINED,18764);	
			player:setVar("MNKHAFight",4);	
			player:delCurrency("infamy", payment);
		elseif (player:getVar("WHMHAFight") == 2) then  -- WHM
	    	player:tradeComplete();	
		    player:addItem(18870,1,329,9,59,0) 
			player:messageSpecial(ITEM_OBTAINED,18870);		
			player:setVar("WHMHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("BLMHAFight") == 2) then  -- BLM
		    printf("Black Mage Triggered");
    		player:tradeComplete();	
			player:addItem(18589,1,362,4,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18589);		
			player:setVar("BLMHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("RDMHAFight") == 2) then  -- RDM
    		player:tradeComplete();		
    		player:addItem(17761,1,896,1,59,0)  
			player:messageSpecial(ITEM_OBTAINED,17761);		
			player:setVar("RDMHAFight",4);	
			player:delCurrency("infamy", payment);
		elseif (player:getVar("THFHAFight") == 2) then  -- THF
    		player:tradeComplete();			
    		player:addItem(19115,1,147,0,59,0) 
			player:messageSpecial(ITEM_OBTAINED,19115);		
			player:setVar("THFHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("PLDHAFight") == 2) then  -- PLD
    		player:tradeComplete();			
    		player:addItem(17762,1,137,0,59,0)  
			player:messageSpecial(ITEM_OBTAINED,17762);		
			player:setVar("PLDHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("PLDHAFightShield") == 2) then  -- PLD Shield
    		player:tradeComplete();			
    		player:addItem(12407,1)  
			player:messageSpecial(ITEM_OBTAINED,12407);		
			player:setVar("PLDHAFightShield",4);
			player:delCurrency("infamy", payment);	
		elseif (player:getVar("DRKHAFight") == 2) then  -- DRK
		    player:tradeComplete();			
    		player:addItem(18955,1,343,9,59,0) 
			player:messageSpecial(ITEM_OBTAINED,18995);		
			player:setVar("DRKHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("BSTHAFight") == 2) then  -- BST
    		player:tradeComplete();		
    		player:addItem(17966,1,124,6,59,0) 
			player:messageSpecial(ITEM_OBTAINED,17966);		
			player:setVar("BSTHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("BRDHAFight") == 2) then  -- BRD
    		player:tradeComplete();			
    		player:addItem(19116,1,322,4,59,0) 
			player:messageSpecial(ITEM_OBTAINED,19116);		
			player:setVar("BRDHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("RNGHAFight") == 2) then  -- RNG
    		player:tradeComplete();			
    		player:addItem(18736,1,139,4,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18763);		
			player:setVar("RNGHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("SAMHAFight") == 2) then  -- SAM
    		player:tradeComplete();			
    		player:addItem(18452,1,353,2,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18452);		
			player:setVar("SAMHAFight",4);	
			player:delCurrency("infamy", payment);
		elseif (player:getVar("NINHAFight") == 2) then  -- NIN
    		player:tradeComplete();			
    		player:addItem(19275,1,140,4,59,0) 
			player:messageSpecial(ITEM_OBTAINED,19275);		
			player:setVar("NINHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("DRGHAFight") == 2) then  -- DRG
    		player:tradeComplete();		
    		player:addItem(19303,1,124,6,59,0)  
			player:messageSpecial(ITEM_OBTAINED,19303);		
			player:setVar("DRGHAFight",4);	
			player:delCurrency("infamy", payment);
		elseif (player:getVar("SMNHAFight") == 2) then  -- SMN
    		player:tradeComplete();		
    		player:addItem(18601,1,321,2,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18601);		
			player:setVar("SMNHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("BLUHAFight") == 2) then  -- BLU
    		player:tradeComplete();		
    		player:addItem(17763,1,299,9,59,0)  
			player:messageSpecial(ITEM_OBTAINED,17763);		
			player:setVar("BLUHAFight",4);		
			player:delCurrency("infamy", payment);
		elseif (player:getVar("CORHAFight") == 2) then  -- COR
    		player:tradeComplete();		
    		player:addItem(18737,1,133,14,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18737);		
			player:setVar("CORHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("PUPHAFight") == 2) then  -- PUP
    		player:tradeComplete();			
    		player:addItem(18765,1,124,6,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18765);	
			player:setVar("PUPHAFight",4);
			player:delCurrency("infamy", payment);
		elseif (player:getVar("DNCHAFight") == 2) then  -- DNC
    		player:tradeComplete();		
    		player:addItem(19117,1,330,9,59,0) 
			player:messageSpecial(ITEM_OBTAINED,19117);		
			player:setVar("DNCHAFight",4);	
			player:delCurrency("infamy", payment);
		elseif (player:getVar("SCHHAFight") == 2) then  -- SCH
    		player:tradeComplete();			
    		player:addItem(18602,1,1249,14,59,0)  
			player:messageSpecial(ITEM_OBTAINED,18602);		
			player:setVar("SCHHAFight",4);	
			player:delCurrency("infamy", payment);
	    end
	else
	    balance = payment - pinfamy; 
        player:PrintToPlayer( "??? : You can't fool me, you need "..balance.." more infamy.", 0xD);
	end	

	
	-- Standard Message
end

	

    if ((trade:hasItemQty(4059, 99)) and (player:getVar("WARHAFight") == 4) and trade:hasItemQty(18505,1)) then  -- WAR
	    player:tradeComplete();		
    	player:addItem(18505,1,143,1,59,0,931,3); -- Earth Affinity
		player:messageSpecial(ITEM_OBTAINED,18505);
		player:setVar("WARHAFight",5);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);		
	elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("MNKHAFight") == 4) and trade:hasItemQty(18764,1)) then  -- MNK
	    	player:tradeComplete();		
	    	player:addItem(18764,1,194,1,59,0,929,3); -- Ice Affinity
			player:messageSpecial(ITEM_OBTAINED,18764);	
			player:setVar("MNKHAFight",5);	
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("WHMHAFight") == 4) and trade:hasItemQty(18870,1)) then  -- WHM
	    	player:tradeComplete();	
		    player:addItem(18870,1,329,9,59,0,933,3); -- Water Affinity 
			player:messageSpecial(ITEM_OBTAINED,18870);		
			player:setVar("WHMHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("BLMHAFight") == 4) and trade:hasItemQty(18589,1)) then  -- BLM
		    printf("Black Mage Triggered");
    		player:tradeComplete();	
			player:addItem(18589,1,362,4,59,0,935,3); -- Dark AFfinity 
			player:messageSpecial(ITEM_OBTAINED,18589);		
			player:setVar("BLMHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("RDMHAFight") == 4) and trade:hasItemQty(17761,1)) then  -- RDM
    		player:tradeComplete();		
    		player:addItem(17761,1,896,2,59,0,935,3); -- Dark Affinity 
			player:messageSpecial(ITEM_OBTAINED,17761);		
			player:setVar("RDMHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("THFHAFight") == 4) and trade:hasItemQty(19115,1)) then  -- THF
    		player:tradeComplete();			
    		player:addItem(19115,1,147,0,59,0,930,3); -- Wind Affinity 
			player:messageSpecial(ITEM_OBTAINED,19115);		
			player:setVar("THFHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("PLDHAFight") == 4) and trade:hasItemQty(17762,1)) then  -- THF
    		player:tradeComplete();			
    		player:addItem(17762,1,71,1,59,0,935,3); -- Dark AFfinity
			player:messageSpecial(ITEM_OBTAINED,17762);		
			player:setVar("PLDHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("DRKHAFight") == 4) and trade:hasItemQty(18955,1)) then  -- DRK
		    player:tradeComplete();			
    		player:addItem(18955,1,343,9,59,0,929,3); -- Ice Affinity 
			player:messageSpecial(ITEM_OBTAINED,18995);		
			player:setVar("DRKHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("BSTHAFight") == 4) and trade:hasItemQty(17966,1)) then  -- BST
    		player:tradeComplete();		
    		player:addItem(17966,1,124,6,59,0,931,3); -- Earth Affinity 
			player:messageSpecial(ITEM_OBTAINED,17966);		
			player:setVar("BSTHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("BRDHAFight") == 4) and trade:hasItemQty(19116,1)) then  -- BRD
    		player:tradeComplete();			
    		player:addItem(19116,1,322,4,59,0,930,3); -- Wind Affinity
			player:messageSpecial(ITEM_OBTAINED,19116);		
			player:setVar("BRDHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("RNGHAFight") == 4) and trade:hasItemQty(18736,1)) then  -- RNG
    		player:tradeComplete();			
    		player:addItem(18736,1,139,4,59,0,933,3); -- Water Affinity
			player:messageSpecial(ITEM_OBTAINED,18763);		
			player:setVar("RNGHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("SAMHAFight") == 4) and trade:hasItemQty(18452,1)) then  -- SAM
    		player:tradeComplete();			
    		player:addItem(18452,1,353,2,59,0,935,3); -- Dark Affinity  
			player:messageSpecial(ITEM_OBTAINED,18452);		
			player:setVar("SAMHAFight",5);	
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("NINHAFight") == 4) and trade:hasItemQty(19275,1)) then  -- NIN
    		player:tradeComplete();			
    		player:addItem(19275,1,146,9,39,3,59,0,931,3);  -- Earth Affinity 
			player:messageSpecial(ITEM_OBTAINED,19275);		
			player:setVar("NINHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("DRGHAFight") == 4) and trade:hasItemQty(19303,1)) then  -- DRG
    		player:tradeComplete();		
    		player:addItem(19303,1,124,6,59,0,931,3); -- Earth Affinity  
			player:messageSpecial(ITEM_OBTAINED,19303);		
			player:setVar("DRGHAFight",5);	
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("SMNHAFight") == 4) and trade:hasItemQty(19115,1)) then  -- SMN
    		player:tradeComplete();		
    		player:addItem(18601,1,321,2,59,0,935,3); -- Dark Affinity  
			player:messageSpecial(ITEM_OBTAINED,18601);		
			player:setVar("SMNHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("BLUHAFight") == 4) and trade:hasItemQty(17763,1)) then  -- BLU
    		player:tradeComplete();		
    		player:addItem(17763,1,299,9,59,0,935,3); -- Dark Affinity 
			player:messageSpecial(ITEM_OBTAINED,17763);		
			player:setVar("BLUHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("CORHAFight") == 4) and trade:hasItemQty(18737,1)) then  -- COR
    		player:tradeComplete();		
    		player:addItem(18737,1,133,14,59,0,929,3); -- Ice Affinity  
			player:messageSpecial(ITEM_OBTAINED,18737);		
			player:setVar("CORHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("PUPHAFight") == 4) and trade:hasItemQty(18765,1)) then  -- PUP
    		player:tradeComplete();			
    		player:addItem(18765,1,124,6,59,0,930,3); -- Wind Affinity  
			player:messageSpecial(ITEM_OBTAINED,18765);	
			player:setVar("PUPHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("DNCHAFight") == 4) and trade:hasItemQty(19117,1)) then  -- DNC
    		player:tradeComplete();		
    		player:addItem(19117,1,330,9,59,0,930,3); -- Wind Affinity 
			player:messageSpecial(ITEM_OBTAINED,19117);		
			player:setVar("DNCHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059, 99)) and (player:getVar("SCHHAFight") == 4) and trade:hasItemQty(18602,1)) then  -- SCH
    		player:tradeComplete();			
    		player:addItem(18602,1,1249,14,59,0,935,3); -- Dark Affinity  
			player:messageSpecial(ITEM_OBTAINED,18602);		
			player:setVar("SCHHAFight",5);
            player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);				
	else
        player:PrintToPlayer( "??? : ... give me the correct items...", 0xD);
	end	

	
	-- Standard Message


    if ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(h2h,1))) then
	    player:tradeComplete();
		player:addItem(h2h,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,h2h);
		player:setVar("AftermathPlus_H2H",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(dagger,1))) then
	    player:tradeComplete();
		player:addItem(dagger,1,935,5);
		player:messageSpeical(ITEM_OBTAINED,dagger);	
        player:setVar("AftermathPlus_Dagger",1);	
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(sword,1))) then
	    player:tradeComplete();
		player:addItem(sword,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,sword);
		player:setVar("AftermathPlus_Sword",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
    elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(gs,1))) then
	    player:tradeComplete();
		player:addItem(gs,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,gs);
		player:setVar("AftermathPlus_GS",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(axe,1))) then
	    player:tradeComplete();
		player:addItem(axe,1,935,5);
		player:messageSpeical(ITEM_OBTAINED,axe);
		player:setVar("AftermathPlus_Axe",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(gaxe,1))) then
	    player:tradeComplete();
		player:addItem(gaxe,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,gaxe);
		player:setVar("AftermathPlus_Gaxe",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(scythe,1))) then
	    player:tradeComplete();
		player:addItem(scythe,1,935,5);
		player:messageSpeical(ITEM_OBTAINED,scythe);
		player:setVar("AftermathPlus_Scythe",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(pole,1))) then
	    player:tradeComplete();
		player:addItem(pole,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,pole);
		player:setVar("AftermathPlus_Pole",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(katana,1))) then
	    player:tradeComplete();
		player:addItem(katana,1,935,5);
		player:messageSpeical(ITEM_OBTAINED,katana);
		player:setVar("AftermathPlus_Katana",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(gkatana,1))) then
	    player:tradeComplete();
		player:addItem(gkatana,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,gkatana);
		player:setVar("AftermathPlus_Gkatana",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(club,1))) then
	    player:tradeComplete();
		player:addItem(club,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,club);
		player:setVar("AftermathPlus_Club",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(staff,1))) then
	    player:tradeComplete();
		player:addItem(staff,1,935,5);
		player:messageSpeical(ITEM_OBTAINED,staff);
		player:setVar("AftermathPlus_Staff",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(bow,1))) then
	    player:tradeComplete();
		player:addItem(bow,1,934,5);
		player:messageSpeical(ITEM_OBTAINED,bow);	
		player:setVar("AftermathPlus_Bow",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);			
	elseif ((trade:hasItemQty(4059,99)) and (trade:hasItemQty(gun,1))) then
	    player:tradeComplete();
		player:addItem(gun,1,935,5);
		player:messageSpeical(ITEM_OBTAINED,gun);
		player:setVar("AftermathPlus_Gun",1);
        player:PrintToPlayer("??? : You now have the power of Aftermath+.", 0xD);		
    end






end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- Spawn Mechanism

local h2h = 18264;
local dagger = 18270;
local sword = 18276;
local gs = 18282;
local axe = 18288;
local gaxe = 18294;
local scythe = 18306;
local pole = 18300;
local katana = 18312;
local gkatana = 18318;
local club = 18324;
local staff = 18330;
local bow = 18348;
local gun = 18336;

if ((player:getVar("WARHAFight") == 1) or (player:getVar("MNKHAFight") == 1) or (player:getVar("WHMHAFight") == 1) or (player:getVar("BLMHAFight") == 1) or (player:getVar("RDMHAFight") == 1) or 
   (player:getVar("THFHAFight") == 1) or (player:getVar("PLDHAFight") == 1) or (player:getVar("DRKHAFight") == 1) or (player:getVar("BSTHAFight") == 1) or (player:getVar("BRDHAFight") == 1) or 
   (player:getVar("RNGHAFight") == 1) or (player:getVar("SAMHAFight") == 1) or (player:getVar("NINHAFight") == 1) or (player:getVar("DRGHAFight") == 1) or (player:getVar("SMNHAFight") == 1) or 
   (player:getVar("BLUHAFight") == 1) or (player:getVar("CORHAFight") == 1) or (player:getVar("PUPHAFight") == 1) or (player:getVar("DNCHAFight") == 1) or (player:getVar("SCHHAFight") == 1) or
   (player:getVar("PLDHAFightShield") == 1)) then
    SpawnMob(16793977):updateEnmity(player);
end	


if ((player:getVar("WARHAFight") == 2) or (player:getVar("MNKHAFight") == 2) or (player:getVar("WHMHAFight") == 2) or (player:getVar("BLMHAFight") == 2) or (player:getVar("RDMHAFight") == 2) or 
   (player:getVar("THFHAFight") == 2) or (player:getVar("PLDHAFight") == 2) or (player:getVar("DRKHAFight") == 2) or (player:getVar("BSTHAFight") == 2) or (player:getVar("BRDHAFight") == 2) or 
   (player:getVar("RNGHAFight") == 2) or (player:getVar("SAMHAFight") == 2) or (player:getVar("NINHAFight") == 2) or (player:getVar("DRGHAFight") == 2) or (player:getVar("SMNHAFight") == 2) or 
   (player:getVar("BLUHAFight") == 2) or (player:getVar("CORHAFight") == 2) or (player:getVar("PUPHAFight") == 2) or (player:getVar("DNCHAFight") == 2) or (player:getVar("SCHHAFight") == 2) or
   (player:getVar("PLDHAFightShield") == 2)) then
   player:PrintToPlayer("??? : Bring more power to me!!!  Four seals of the Gods and 400,000 Infamy!!", 0xD);
end	

if ((player:getVar("WARHAFight") == 4) or (player:getVar("MNKHAFight") == 4) or (player:getVar("WHMHAFight") == 4) or (player:getVar("BLMHAFight") == 4) or (player:getVar("RDMHAFight") == 4) or 
   (player:getVar("THFHAFight") == 4) or (player:getVar("PLDHAFight") == 4) or (player:getVar("DRKHAFight") == 4) or (player:getVar("BSTHAFight") == 4) or (player:getVar("BRDHAFight") == 4) or 
   (player:getVar("RNGHAFight") == 4) or (player:getVar("SAMHAFight") == 4) or (player:getVar("NINHAFight") == 4) or (player:getVar("DRGHAFight") == 4) or (player:getVar("SMNHAFight") == 4) or 
   (player:getVar("BLUHAFight") == 4) or (player:getVar("CORHAFight") == 4) or (player:getVar("PUPHAFight") == 4) or (player:getVar("DNCHAFight") == 4) or (player:getVar("SCHHAFight") == 4)) then
   player:PrintToPlayer("??? : You seek the power of a higher Aftermath effect?  Trade me your weapon and 99 Plutons.", 0xD);
end	


if((player:getEquipID(SLOT_MAIN) == h2h) or (player:getEquipID(SLOT_MAIN) == dagger) or (player:getEquipID(SLOT_MAIN) == sword) or (player:getEquipID(SLOT_MAIN) == gs) or (player:getEquipID(SLOT_MAIN) == axe) or 
    (player:getEquipID(SLOT_MAIN) == gaxe) or (player:getEquipID(SLOT_MAIN) == scythe) or (player:getEquipID(SLOT_MAIN) == pole) or (player:getEquipID(SLOT_MAIN) == katana) or (player:getEquipID(SLOT_MAIN) == gkatana) or 
	(player:getEquipID(SLOT_MAIN) == club) or (player:getEquipID(SLOT_MAIN) == staff) or (player:getEquipID(SLOT_RANGED) == bow) or (player:getEquipID(SLOT_RANGED) == gun)) then
   player:PrintToPlayer("??? : You seek the power of a higher Aftermath effect?  Trade me your weapon and 99 Plutons.", 0xD);	
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