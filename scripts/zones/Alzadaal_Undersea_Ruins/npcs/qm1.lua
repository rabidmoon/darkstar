-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Ob(ZNM T1))
-- @pos 542 0 -129 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17072171;
    if (trade:hasItemQty(2592,1) and trade:getItemCount() == 1) then -- Trade Cog Lubricant
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2628,1) and trade:getItemCount() == 1) then -- Trade Ob's Arm
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            player:addKeyItem(CERISE_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,CERISE_SEAL);			
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