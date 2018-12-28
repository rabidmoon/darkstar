-----------------------------------------
-- ID: 5825
-- Item: Lucid Potion II
-- Item Effect: Restores 120 HP
-----------------------------------------
require("scripts/globals/settings")


function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    target:messageBasic(24,0,target:addHP(520*ITEM_POWER));
end