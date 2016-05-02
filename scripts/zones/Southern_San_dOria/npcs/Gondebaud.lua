-----------------------------------
--  Area: South Sandy
--   NPC: Gondebaud
--  Type: Trust NPC
-- @zone: 241
--  @pos 7.800 -3.5 -10.064
--
-- 
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
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
if (player:getNation() == 0) and (player:hasKeyItem(SAN_DORIA_TRUST_PERMIT) == false) then
    player:addKeyItem(SAN_DORIA_TRUST_PERMIT);
	player:addKeyItem(RED_INSTITUTE_CARD);
	player:messageSpecial(KEYITEM_OBTAINED,SAN_DORIA_TRUST_PERMIT);
	player:messageSpecial(KEYITEM_OBTAINED,RED_INSTITUTE_CARD);	
    else if (player:getNation() == 0) and (player:hasKeyItem(SAN_DORIA_TRUST_PERMIT)) then
	player:PrintToPlayer("Gondebaud : If you find any trust ciphers, bring them to me.", 0xD);
	else
	player:PrintToPlayer("Godenbaud : You seem to be from another Nation.  I can't really help you", 0xD);
	end
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

end;

