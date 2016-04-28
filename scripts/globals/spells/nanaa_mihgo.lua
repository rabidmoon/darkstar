-----------------------------------------
-- Spell: nanaa_mihgo

-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(78);
    caster:PrintToPlayer("(Nanaa Mihgo) This cat is rrready for a good fight!", 0xF); 
	return 0;
end;