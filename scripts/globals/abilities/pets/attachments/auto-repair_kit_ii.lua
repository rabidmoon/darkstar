-----------------------------------
-- Attachment: Auto-Repair Kit II
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onManeuverGain(player,maneuvers)
local power = 0;
local player = pet:getMaster();
local light = player:getEffectsCount(EFFECT_LIGHT_MANEUVER);
if (light == 1) then
power = 2;
elseif (light == 2) then
power = 1;
elseif (light == 3) then
power = 1;
end


local pet = player:getPet();
pet:addMod(MOD_REGEN, power);
end

function onManeuverLose(player,maneuvers)
local power = 0;
local player = pet:getMaster();
local light = player:getEffectsCount(EFFECT_LIGHT_MANEUVER);
local newlight = light - 1;
if (newlight == 0) then
power = 2;
elseif (newlight == 1) then
power = 1;
elseif (newlight == 2) then
power = 1;
end


local pet = player:getPet();
pet:delMod(MOD_REGEN, power);
end
