-----------------------------------------
-- Spell: Indi-STR
-- Gradually restores target party member's MP
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)


return 0;
end;

function onSpellCast(caster,target,spell)
    local potency = doGeoPotency(caster, target, spell)
	-- local duration = 180 + player:getMod(MOD_INDI_DURATION);NYI
	local duration = 180;
    caster:addStatusEffectEx(EFFECT_INDI_STR,EFFECT_STR_BOOST_III,potency,0,duration)
	return 0;	
end;