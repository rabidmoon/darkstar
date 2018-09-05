-----------------------------------------
-- ID: 5439
-- Item: Vicar's Drink
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
   
    target:addStatusEffect(PHYSICAL_SHIELD,0,1,0,90);
 
end;
