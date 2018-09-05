-----------------------------------------
-- ID: 5386
-- Item: Fighter's Drink
-- Item Effect: Erase + -na
-----------------------------------------

require("scripts/globals/status");

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
   
    target:addStatusEffect(ACCURACY_BOOST,100,0,90);
 
end;
