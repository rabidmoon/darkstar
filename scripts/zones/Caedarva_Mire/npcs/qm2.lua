-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Experimental Lamia(ZNM T3))
-- @pos -773 -11 322 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17101205;
    if (trade:hasItemQty(2595,1) and trade:getItemCount() == 1) then -- Trade Myrrh
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2631,1) and trade:getItemCount() == 1) then -- Trade Experimental Lamia
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            player:addKeyItem(TAUPE_COLORED_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,TAUPE_COLORED_SEAL);			
        end		
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
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