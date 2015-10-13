-----------------------------------
-- Area: Ferretory
-- NPC: Aengus
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local balance = 0;
local calculus = 20000;
local twobud = 25000;
local threebud = 30000;
local fourbud = 35000;
local potshard = 40000;

local infamy = player:getCurrency("infamy");
local meleeboon = player:getVar("FerretoryMeleeBoon");
local aura = player:getVar("FerretoryAura");

if (trade:hasItemQty( 1156, 1 )) and (meleeboon == 1) and (aura > 0) then
	if (infamy >= calculus) then
    player:delCurrency("infamy", 20000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",2);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",1);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 1: Atk/R.Atk +5, Store TP +1", 0x15);
	else
	balance = calculus - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
	end
	end
	
if (trade:hasItemQty( 4368, 1 )) and (meleeboon == 2) and (aura > 1) then
	if (infamy >= twobud) then
    player:delCurrency("infamy", 25000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",3);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",2);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 2: Atk/R.Atk +10, Store TP +2, Haste +1%", 0x15);
	else
	balance = twobud - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end
	
	
	
if (trade:hasItemQty( 1154, 1 )) and (meleeboon == 3) and (aura > 2) then
	if (infamy >= threebud) then
    player:delCurrency("infamy", 30000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",4);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",3);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 3: Atk/R.Atk +15, Store TP +3, Haste +1%", 0x15);
	else
	balance = threebud - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end




if (trade:hasItemQty( 4369, 1 )) and (meleeboon == 4) and (aura > 3) then
	if (infamy >= fourbud) then
    player:delCurrency("infamy", 35000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",5);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",4);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 4: Atk/R.Atk +20, Store TP +4, Haste +2%", 0x15);
	else
	balance = fourbud - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end


if (trade:hasItemQty( 954, 3 )) and (meleeboon == 5) and (aura > 4) then
	if (infamy >= potshard) then
    player:delCurrency("infamy", 40000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",6);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",5);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 5: Atk/R.Atk +25, Store TP +5, Haste +2%", 0x15);
	else
	balance = potshard - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end	
	

	













end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local aura = player:getVar("FerretoryAura");
local meleeboon = player:getVar("FerretoryMeleeBoon");




if (aura == 0) then
player:PrintToPlayer("Leovad : Don'taru bother me with your presence until you have an aura", 0xD);
else if (aura > 0) and (meleeboon == 1) then
player:PrintToPlayer("Leovad : Hey, bring me a crawler calculus and 20,000 Infamy Points for a Melee Boon.", 0xD);
else if (aura > 1) and (meleeboon == 2) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a 2-Leaf Mandragora Bud and 25,000 Infamy Points.", 0xD);
else if (aura > 2) and (meleeboon == 3) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a 3-Leaf Mandragora Bud and 30,000 Infamy Points.", 0xD);
else if (aura > 3) and (meleeboon == 4) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a 4-Leaf Mandragora Bud and 35,000 Infamy Points.", 0xD);
else if (aura > 4) and (meleeboon == 5) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me 3 Magic Pot Shards and 40,000 Infamy Points.", 0xD);
else
player:PrintToPlayer("Leovad : Your Aura isn't high enough.", 0xD);
end
end
end
end
end
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



