-----------------------------------------
-- ID: 4114
-- Item: Potion +2
-- Item Effect: Restores 75 HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
value = 0;
mHP = target:getMaxHP();
cHP = target:getHP();

if (mHP == cHP) then
	value = 56; -- Does not let player use item if their hp is full
end
	
return value;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	mHP = target:getMaxHP();
	cHP = target:getHP();
		
	dif = mHP - cHP;
	if(dif > 75) then
		heal = 75;
	else
		heal = dif;
	end
	
	target:addHP(heal*ITEM_POWER);
	target:messageBasic(24,0,heal);
	
end;
