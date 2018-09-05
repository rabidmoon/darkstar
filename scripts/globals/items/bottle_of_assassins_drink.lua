-----------------------------------------
-- ID: 5388
-- Item: Assassin's Drink
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
   
    target:addStatusEffect(MAGIC_ACC_BOOST_II,100,0,90);
 
end;
