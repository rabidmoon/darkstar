-----------------------------------------
-- Spell: Abienzo NIN

-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local zone = caster:getZoneID();
	local bf = caster:getBattlefield();		
	local dynamis = caster:getVar("TrustDynamis");
	if (((zone == 185) or (zone == 186) or (zone == 187) or (zone == 188) or (zone == 134) or (zone == 135)) and (dynamis ~= 1)) then
	caster:PrintToPlayer("You cannot summon a trust in this area",0xD);
	elseif ((bf ~= nil) and (((bf:getBcnmID() > 1384) and (bf:getBcnmID() < 1387)) or ((bf:getBcnmID() > 1376) and (bf:getBcnmID() < 1384)))) then
	    caster:PrintToPlayer("Rughadjeen is unavailable for this fight.  Please try another Trust.",0xD);		
	    return MSGBASIC_CANT_BE_USED_IN_AREA;
	elseif (bf == nil and (zone == 139 or zone == 144 or zone == 146 or zone == 206)) then
	  caster:PrintToPlayer("Rughadjeen cannot be summoned outside a BC fight.",0xD);
	  return MSGBASIC_CANT_BE_USED_IN_AREA;		
	elseif(not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
	elseif (not caster:isUniqueAlly(100)) then
       	caster:PrintToPlayer("Rughadjeen is already summoned.",0xD);
    else
	return 0;
	end
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(100);
	caster:PrintToPlayer(string.format("(Rughadjeen) We must do our best for the Empire!", caster:getName()),0xF);    
	return 0;
end;