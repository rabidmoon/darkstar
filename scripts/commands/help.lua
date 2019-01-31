---------------------------------------------------------------------------------------------------
-- func: help
-- desc: List of Help commands
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, hp, target)
    player:PrintToPlayer("List of commands", 0x1C);
    player:PrintToPlayer("@besieged - Shows current status of beseiged", 0x1C);	
    player:PrintToPlayer("@boons - Shows Feretory Boon Bonus", 0x1C);	
    player:PrintToPlayer("@dynamis - Shows current time left in Dynamis", 0x1C);	
    player:PrintToPlayer("@feretory - Shows current Feretory Objective", 0x1C);	
    player:PrintToPlayer("@mogshop - Opens special mog shop", 0x1C);	
    player:PrintToPlayer("@resting - Shows current resting EXP bonus", 0x1C);	
    player:PrintToPlayer("@salvage - Shows current time left in Salvage", 0x1C);		
    player:PrintToPlayer("@trust - Opens help menu with all trust commands", 0x1C);
    player:PrintToPlayer("@trustpoint - Shows accumulation of Trust Points", 0x1C);			
end