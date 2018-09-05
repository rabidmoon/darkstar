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
   
    target:delStatusEffect(EFFECT_DIA);
	target:delStatusEffect(EFFECT_BIO);
    target:delStatusEffect(EFFECT_RASP);
	target:delStatusEffect(EFFECT_SHOCK);
    target:delStatusEffect(EFFECT_BURN);
	target:delStatusEffect(EFFECT_DROWN);
    target:delStatusEffect(EFFECT_PARALYSIS);
	target:delStatusEffect(EFFECT_BLINDNESS);	
	target:delStatusEffect(EFFECT_BIND);	
	target:delStatusEffect(EFFECT_WEIGHT);	
	target:delStatusEffect(EFFECT_SLOW);	
	target:delStatusEffect(EFFECT_SILENCE);	
	target:delStatusEffect(EFFECT_CURSE);		
 
end;
