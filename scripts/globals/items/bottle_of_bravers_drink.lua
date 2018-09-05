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
   
    target:addStatusEffect(EFFECT_STR_BOOST,15,0,90);
    target:addStatusEffect(EFFECT_DEX_BOOST,15,0,90);
    target:addStatusEffect(EFFECT_VIT_BOOST,15,0,90);
    target:addStatusEffect(EFFECT_AGI_BOOST,15,0,90);
    target:addStatusEffect(EFFECT_INT_BOOST,15,0,90);
    target:addStatusEffect(EFFECT_MND_BOOST,15,0,90);
    target:addStatusEffect(EFFECT_CHR_BOOST,15,0,90);	
end;
