-----------------------------------------
--	ID: 5431
--	Dusty Ether
--	Adds 300 HP to the user
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target, itemid)

	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
      printf("USING!!!!");
    local zone = target:getZoneID();
	local party = target:getParty();
	if (zone == 73) then
	    printf("ZOne!!!!");
       
	end
	target:addHP(300);
end;