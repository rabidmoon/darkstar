-----------------------------------------
-- Spell: Holy
-- Deals light damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	--calculate raw damage
	
	if (caster:getObjType() == TYPE_PET) then
	    print("Avatar");
		local base = 125;
		local d = 0;
		local dmg = 0;
		local myint = caster:getStat(MOD_INT)
		printf("My Int is %u",myint);
		local enint = target:getStat(MOD_INT);
		local dint = myint - enint;
		    if (dint < 0) then
		    d = (base + dint) * 5;
			printf("low dint");
		    elseif (dint >= 0) then
		    d = (base + ((150 + dint) * 4.5));
						printf("high dint %u",d);
		    end
		
		-- Calculate fake resists for avatar or pet
		dmg = d;
		
	return dmg;	
		
    else
	    local dmg = calculateMagicDamage(125,1,caster,spell,target,DIVINE_MAGIC_SKILL,MOD_MND,false);
	    --get resist multiplier (1x if no resist)
	    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_MND)-target:getStat(MOD_MND),DIVINE_MAGIC_SKILL,1.0);
	    --get the resisted damage
	    dmg = dmg*resist;
	    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	    dmg = addBonuses(caster,spell,target,dmg);
	    --TODO: no additional bonus from Afflatus Solace yet
	   --add in target adjustment
	    dmg = adjustForTarget(target,dmg,spell:getElement());
	    --add in final adjustments
	    dmg = finalMagicAdjustments(caster,target,spell,dmg);
     return dmg;
	end
	
	
end;