---------------------------------------------------------------------------------------------------
-- func: checks time
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player)
local resting = player:getStatusEffect(EFFECT_RESTING_BONUS);
local power = resting:getPower();
player:PrintToPlayer("You have been granted a Resting Bonus of +"..power.."% Experience Points gained through battles.", 0x15);
end