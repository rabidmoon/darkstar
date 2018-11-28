-----------------------------------
-- Area:  Dynamis San d'Oria
-- NPC:   qm0 (???)
-- Notes: Spawns when Megaboss
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

local slot1 = trade:getItem(0);
local slot2 = trade:getItem(1);
local slot3 = trade:getItem(2);
local slot4 = trade:getItem(3);

if (((slot1 == 3380) or (slot1 == 3381) or (slot1 == 3382) or (slot1 == 3387)) and ((slot2 == 3380) or (slot2 == 3381) or (slot2 == 3382) or (slot2 == 3387)) and
((slot3 == 3380) or (slot3 == 3381) or (slot3 == 3382) or (slot3 == 3387)) and ((slot4 == 3380) or (slot4 == 3381) or (slot4 == 3382) or (slot4 == 3387))) then
player:addKeyItem(ALABASTER_GRANULES_OF_TIME);
player:messageSpecial(KEYITEM_OBTAINED,ALABASTER_GRANULES_OF_TIME);
player:tradeComplete();
elseif (((slot1 == 3380) or (slot1 == 3381) or (slot1 == 3382) or (slot1 == 3387)) and ((slot2 == 3380) or (slot2 == 3381) or (slot2 == 3382) or (slot2 == 3387)) and
((slot3 == 3380) or (slot3 == 3381) or (slot3 == 3382) or (slot3 == 3387))) then
player:addKeyItem(AMBER_GRANULES_OF_TIME);
player:messageSpecial(KEYITEM_OBTAINED,AMBER_GRANULES_OF_TIME);
player:tradeComplete();
elseif (((slot1 == 3380) or (slot1 == 3381) or (slot1 == 3382) or (slot1 == 3387)) and ((slot2 == 3380) or (slot2 == 3381) or (slot2 == 3382) or (slot2 == 3387)) and
((slot3 == 3380))) then
player:addKeyItem(AZURE_GRANULES_OF_TIME);
player:messageSpecial(KEYITEM_OBTAINED,AZURE_GRANULES_OF_TIME);
player:tradeComplete();
elseif (((slot1 == 3380) or (slot1 == 3381) or (slot1 == 3382) or (slot1 == 3387))) then
player:addKeyItem(CRIMSON_GRANULES_OF_TIME);
player:messageSpecial(KEYITEM_OBTAINED,CRIMSON_GRANULES_OF_TIME);
player:tradeComplete();
end






if (GetMobAction(17534977) == 0 and trade:hasItemQty(3405,1)) and trade:hasItemQty(3406,1) and trade:hasItemQty(3407,1) and trade:hasItemQty(3408,1) and player:hasKeyItem(ALABASTER_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",4);
	SpawnMob(17534977):updateClaim(player);
	player:delKeyItem(ALABASTER_GRANULES_OF_TIME);
	player:tradeComplete();
elseif (GetMobAction(17534977) == 0 and trade:hasItemQty(3405,1)) and trade:hasItemQty(3406,1) and trade:hasItemQty(3407,1) and trade:hasItemQty(3408,1) and player:hasKeyItem(AMBER_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17534977):updateClaim(player);
    player:delKeyItem(AMBER_GRANULES_OF_TIME);
	player:tradeComplete();
elseif (GetMobAction(17534977) == 0 and trade:hasItemQty(3405,1)) and trade:hasItemQty(3406,1) and trade:hasItemQty(3407,1) and trade:hasItemQty(3408,1) and player:hasKeyItem(AZURE_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17534977):updateClaim(player);
	player:delKeyItem(AZURE_GRANULES_OF_TIME);
	player:tradeComplete();
elseif (GetMobAction(17534977) == 0 and trade:hasItemQty(3405,1)) and trade:hasItemQty(3406,1) and trade:hasItemQty(3407,1) and trade:hasItemQty(3408,1) and player:hasKeyItem(CRIMSON_GRANULES_OF_TIME) then
    player:setVar("DynaWeakener",1);
	SpawnMob(17534977):updateClaim(player);
	player:delKeyItem(CRIMSON_GRANULES_OF_TIME);
    player:tradeComplete();	
elseif (GetMobAction(17534977) == 0 and trade:hasItemQty(3405,1)) and trade:hasItemQty(3406,1) and trade:hasItemQty(3407,1) and trade:hasItemQty(3408,1) then
player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17534977):updateClaim(player);	
end	

end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	

	
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