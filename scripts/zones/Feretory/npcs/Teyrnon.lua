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
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local boonpower = player:getVar("FerretoryMageBoonPower");
local meleeboonpower = player:getVar("FerretoryMeleeBoonPower");
	local mpboon = boonpower * 10;
	local mabboon = boonpower * 2;
	local fcboon = math.floor(boonpower * 1.5);
	local curepotboon = boonpower;	
	
	local hpboon = meleeboonpower * 10;
	local attboon = meleeboonpower * 5;
	local stp = meleeboonpower * 1;
	local haste = math.floor(meleeboonpower * 0.5);


player:PrintToPlayer("Teyrnon : The following Perks are active:",0xD);
player:PrintToPlayer("Teyrnon : Magic Attack Bonus +"..mabboon.." Fast Cast+"..fcboon.."% Cure Potency+"..curepotboon.."% ", 0xD);
player:PrintToPlayer("Teyrnon : Attack/Ranged Attack +"..attboon.." Store TP+"..stp.." Haste+"..haste.."% ", 0xD);
	
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



