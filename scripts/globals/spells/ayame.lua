-----------------------------------------
-- Spell: Ayame

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
    --if not (caster:isUniqueAlly(77)) then
      --  return MSGBASIC_EFFECT_ALREADY_ACTIVE;
    -- end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(77);
	caster:PrintToPlayer(string.format("(Ayame) My blade is at your disposal %s.  Let's do good work today.", caster:getName()),0xF);
	return 0;
end;
