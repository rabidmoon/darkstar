-----------------------------------
-- Area: Al Zahbi
--  NPC: Dahaaba
-- Type: Chocobo Renter
-- !pos -65.309 -1 -39.585
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/chocobo");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local level = player:getMainLvl();
    local gil = player:getGil();

    if (player:hasKeyItem(CHOCOBO_LICENSE) and level >= 20) then
        local price = getChocoboPrice(player);
        player:setLocalVar("chocoboPriceOffer",price);

        player:startEvent(0x010E,price,gil);
    else
        player:startEvent(0x010F);
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

    local price = player:getLocalVar("chocoboPriceOffer");

    if (csid == 0x010E and option == 0) then
        if (player:delGil(price)) then
            updateChocoboPrice(player, price);

            local duration = 1800 + (player:getMod(MOD_CHOCOBO_RIDING_TIME) * 60)

            player:addStatusEffectEx(EFFECT_MOUNTED,EFFECT_MOUNTED,0,0,duration,true);

            player:setPos(610,-24,356,0x80,0x33);
        end
    end
end;