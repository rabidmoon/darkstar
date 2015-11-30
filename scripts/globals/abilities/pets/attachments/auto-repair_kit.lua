-----------------------------------
-- Attachment: Auto-Repair Kit
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onManeuverGain(player,maneuvers)
local power = 0;
local light = player:getEffectsCount(EFFECT_LIGHT_MANEUVER);
if (light == 1) then
power = 4;
elseif (light == 2) then
power = 4; 
elseif (light == 3) then 
power = 5;
end



local pet = player:getPet();
pet:addMod(MOD_REGEN, power);

end

function onManeuverLose(player,maneuvers)
local power = 0;
if (maneuvers == 3) then 
power = 5;
elseif (maneuvers == 2) then
power = 4;
elseif (maneuvers == 1) then
power = 0;
end
local pet = player:getPet();
pet:delMod(MOD_REGEN, power);
end
