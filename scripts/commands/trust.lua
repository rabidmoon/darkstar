---------------------------------------------------------------------------------------------------
-- func: trust
-- desc: displays trust options
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
 	player:PrintToPlayer("The following Trust commands are available" ,0x1C);
 	player:PrintToPlayer("@bodygaurd" ,0x1C);
 	player:PrintToPlayer("@disband" ,0x1C);		
end