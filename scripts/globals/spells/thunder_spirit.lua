-----------------------------------------
-- Spell: ThunderSpirit
-- Summons ThunderSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	local result = 0;

	return result;
end;



function onSpellCast(caster,target,spell)
if (caster:getObjType() == TYPE_PC) then
local ixion = caster:getVar("DarkIxionWin");
    
	 if (caster:hasStatusEffect(EFFECT_AVATAR_S_FAVOR) == true) and (ixion == 1) then
	caster:PrintToPlayer("Dark Ixion: You dare summon me...?  I shall honor thy pact",0x0D);
	caster:spawnPet(84);
	
	else
	caster:spawnPet(PET_THUNDER_SPIRIT);

    end




	return 0;
	end
end;
