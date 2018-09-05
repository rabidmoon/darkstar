-----------------------------------------
--	ID: 4144
--	High Ether
--	Adds 50% HP and MP to user
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
    local hp = target:getMaxHP()*0.50;
    local mp = target:getMaxMP()*0.50;	
	target:addHP(hp);
	target:addHP(mp);	
end;