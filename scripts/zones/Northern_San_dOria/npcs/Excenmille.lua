-----------------------------------
--  Area: Northern San d'Oria
--   NPC: Excenmille
--  Type: Ballista Pursuivant
-- @zone: 231
--  @pos -229.344 6.999 22.976
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local srank = player:getNationRank(SANDORIA);
	local wrank = player:getNationRank(WINDURST);
	local brank = player:getNationRank(BASTOK);
	
	if (srank >= 4) and (player:hasKeyItem(RED_INSTITUTE_CARD)) and (player:hasSpell(899) == false) then  -- Sandy Rnak 4 or higher
	player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Excenmille : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
    player:addSpell(899);	
	elseif (wrank >= 4) and (player:hasKeyItem(GREEN_INSTITUTE_CARD)) and (player:hasSpell(899) == false) then  -- Sandy Rnak 4 or higher
	player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Excenmille : Ah a Green Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
    player:addSpell(899);
	elseif (brank >= 4) and (player:hasKeyItem(BLUE_INSTITUTE_CARD)) and (player:hasSpell(899) == false) then  -- Sandy Rnak 4 or higher
	player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Excenmille : Ah a Blue Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
    player:addSpell(899);
	else
	player:startEvent(0x001d);
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

