---------------------------------------------------------------------------------------------------
-- func: checks time
-- desc: Checks time remaining in Salvage
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player)
local duration = player:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getTimeRemaining();




local currentm = 0;
local current = 0;
local currentpres = 0;
local currents = 0;

current = ((duration / 1000));

local currenttest = math.floor(duration / 1000);
currentm = math.floor((duration / 1000) / 60); -- Minutes

currentpres = current - (currentm * 60);
print(currentpres);
currents = math.floor((currentpres ));

if (currentm < 1) then
player:PrintToPlayer("You have less than 1 minute remaining in Salvage.", 0x15);
elseif (currentm < 10) then
player:PrintToPlayer("You have 0:0"..currentm..":"..currents.." minutes remaining in Salvage.", 0x15);
elseif (currentm < 10) and (currents < 10) then
player:PrintToPlayer("You have 0:0"..currentm..":0"..currents.." minutes remaining in Salvage.", 0x15);
elseif (currents < 10) then
player:PrintToPlayer("You have 0:"..currentm..":0"..currents.." minutes remaining in Salvage.", 0x15);
else
player:PrintToPlayer("You have 0:"..currentm..":"..currents.." minutes remaining in Salvage.", 0x15);
end
-- player:PrintToPlayer("You currently have a +"..scyldmult.."% scyld bonus", 0x15);

end