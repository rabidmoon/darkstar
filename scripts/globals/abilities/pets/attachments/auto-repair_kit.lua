-----------------------------------
-- Attachment: Auto-Repair Kit
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onManeuverGain(player,maneuvers)
local pet = player:getPet();
pet:addMod(MOD_REGEN, 1);

end

function onManeuverLose(player,maneuvers)
local pet = player:getPet();
pet:delMod(MOD_REGEN, 1);
end
