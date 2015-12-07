-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  qm1 (???)
-- Notes: Spawns Xuu Bhoqa the Enigma with Divine Bijou
-- Dispalcers weaken the mob
-----------------------------------
package.loaded["scripts/zones/Dynamis-Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Windurst/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade,mob)
if (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17543464):updateClaim(player);
elseif (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17543464):updateClaim(player);
elseif (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17543464):updateClaim(player);
elseif (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17543464):updateClaim(player);
end	


if (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17543294):updateClaim(player);
elseif (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17543294):updateClaim(player);
elseif (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17543294):updateClaim(player);
elseif (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17543294):updateClaim(player);
end	
	



end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	

		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);		
	
	
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