-----------------------------------------
-- Spell: Curilla

-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local caster:getZoneID();
	If (zone == 185) or (zone == 186) or (zone == 187) then
	caster:PrintToPlayer("You cannot summon a trust in this area",0xD);
	end
	
	if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(79);
   caster:PrintToPlayer("(Curilla) This should prove to be a good training exercise to hone my skills as a Knight.", 0xF); 

    
	return 0;
end;