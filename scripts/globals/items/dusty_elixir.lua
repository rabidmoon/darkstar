-----------------------------------------
--	ID: 5431
--	Dusty Ether
--	Adds 300 HP to the user
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local hp = target:getMaxHP()*0.25;
    local mp = target:getMaxMP()*0.25;	
	target:addHP(hp);
	target:addHP(mp);	
end;