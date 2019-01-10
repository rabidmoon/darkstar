-----------------------------------------
-- Spell: Geo-Poison
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

local geoBuff = "poison";
local buffType = 2;  -- Buff / 2 = debuff
local dot = 0;


function onMagicCastingCheck(caster,target,spell)
	local result = 0;
	if(caster:hasPet()) then
      result = 1;
   elseif (not caster:canUsePet()) then
		result = MSGBASIC_CANT_BE_USED_IN_AREA;
    end

return 0;
end;

function onSpellCast(caster,target,spell)
    spawnLuopan(caster, target, spell, geoBuff, dot, buffType); 
	caster:setVar("FullCircle",25);
	return 0;	
end;