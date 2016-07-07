-----------------------------------------
-- Spell: Kupipi

-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local zone = caster:getZoneID();
	local dynamis = caster:getVar("TrustDynamis");
	if (zone == 185) or (zone == 186) or (zone == 187) and (dynamis ~= 1) then
	caster:PrintToPlayer("You cannot summon a trust in this area",0xD);
	else if(not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
	else if (not caster:isUniqueAlly(76)) then
       	caster:PrintToPlayer("Kupipi is already summoned.",0xD);
    else
	return 0;
	end
	end
	end
	

end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(76);
   caster:PrintToPlayer("(Kupipi) Heaven's Tower has sent me to ensure the safety of this party.", 0xF); 

    
	return 0;
end;