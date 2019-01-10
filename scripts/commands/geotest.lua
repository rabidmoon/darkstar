---------------------------------------------------------------------------------------------------
-- func: @ah
-- desc: opens the Auction House menu anywhere in the world just to see if we can
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player, target)
 
	local id = player:getVar("GEO_TEST_ID");
	
	player:injectActionPacket(11, id);
	player:PrintToPlayer("Animation ID is: "..id..".");
	id = id + 4;
	player:setVar("GEO_TEST_ID",id);

	
    
   
end;