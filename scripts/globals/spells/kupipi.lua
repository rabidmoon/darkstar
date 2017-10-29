-----------------------------------------
-- Spell: Kupipi

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
    caster:spawnAlly(76);
    caster:PrintToPlayer("(Kupipi) Heaven's Tower has sent me to ensure the safety of this party.", 0xF);


    return 0;
end;
