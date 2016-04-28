-----------------------------------------
-- Spell: Naji

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
	caster:spawnAlly(75);
    local ally = caster:getRecentAlly();
	local str = ally:getStat(MOD_STR);
	local dex = ally:getStat(MOD_DEX);
	local level = ally:getMainLvl();
	local damage = 0;
	
	-- Add Attack and Accuracy Mods since Trusts don't have scalable gear
	local attack = str * 1;
	local accuracy = dex * 1;
	-- Add Delay and Damage Values based on Level and Weapon Type
	damage = level * 0.57;
	
	ally:setDamage(damage);
	ally:setDelay(4000); -- Roughly 240 Delay
	if (level >= 25) then
	ally:addMod(MOD_DOUBLE_ATTACK, 15);
    end

    
	return 0;
end;