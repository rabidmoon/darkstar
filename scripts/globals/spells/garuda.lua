-----------------------------------------
--	
--	Spell: Garuda
--	Summons Garuda to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_GARUDA);
	return 0;
end;