-----------------------------------
-- Glory Slash
-- Sword weapon skill
-- Skill Level: NA
-- Only avaliable with High Artifact Weapon
-- Deals triple damage. Damage varies with TP. Additional effect Stun.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: Light
-- Modifiers: STR:30%
-- 100%TP    200%TP    300%TP
-- 3.00      3.50      4.00
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 4; params.ftp200 = 4; params.ftp300 = 4;
	params.str_wsc = 0.60; params.dex_wsc = 0.60; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0; params.crit200 = 0; params.crit300 = 0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 2.25;


	
	local rdmha = 0;
	local pldha = 0;
	local bluha = 0;
	if (((player:getEquipID(SLOT_MAIN) == 17761) and player:getVar("RDMHAFight") == 5)) then
	   rdmha = 1;
    end	   
	
	if (((player:getEquipID(SLOT_MAIN) == 17762) and player:getVar("PLDHAFight") == 5)) then
	   pldha = 1;
    end	   
	
	if (((player:getEquipID(SLOT_MAIN) == 17763) and player:getVar("BLUHAFight") == 5)) then
	   bluha = 1;
	end	

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	if((player:getEquipID(SLOT_MAIN) == 17761) or (player:getEquipID(SLOT_MAIN) == 17762) or (player:getEquipID(SLOT_MAIN) == 17763)) then
		if(damage > 0) then
			if(player:getTP() >= 100 and player:getTP() < 200) then
		        if (((rdmha == 1) or (pldha == 1) or (bluha == 1)) and (player:hasStatusEffect(EFFECT_AFTERMATH_PLUSHA3) == false) and (player:hasStatusEffect(EFFECT_LEVEL_TWO_SC) == false) 
				    and (player:hasStatusEffect(EFFECT_LEVEL_THREE_SC) == false) and (player:hasStatusEffect(EFFECT_LEVEL_FOUR_SC) == false)) then
			        player:addStatusEffectEx(EFFECT_AFTERMATH_PLUSHA1,EFFECT_AFTERMATH_LV1,0,3,60);
                end							
				player:addStatusEffect(EFFECT_AFTERMATH, 7, 3, 20, 0, 13);
			elseif(player:getTP() >= 200 and player:getTP() < 300) then
		        if (((rdmha == 1) or (pldha == 1) or (bluha == 1)) and (player:hasStatusEffect(EFFECT_AFTERMATH_PLUSHA3) == false) and (player:hasStatusEffect(EFFECT_LEVEL_TWO_SC) == false) 
				    and (player:hasStatusEffect(EFFECT_LEVEL_THREE_SC) == false) and (player:hasStatusEffect(EFFECT_LEVEL_FOUR_SC) == false)) then
			        player:addStatusEffectEx(EFFECT_AFTERMATH_PLUSHA2,EFFECT_AFTERMATH_LV2,0,3,60);
                end				
				player:addStatusEffect(EFFECT_AFTERMATH, 7, 3, 40, 0, 13);
			elseif(player:getTP() == 300) then
		        if (((rdmha == 1) or (pldha == 1) or (bluha == 1)) and (player:hasStatusEffect(EFFECT_AFTERMATH_PLUSHA3) == false) and (player:hasStatusEffect(EFFECT_LEVEL_TWO_SC) == false) 
				    and (player:hasStatusEffect(EFFECT_LEVEL_THREE_SC) == false) and (player:hasStatusEffect(EFFECT_LEVEL_FOUR_SC) == false)) then
			        player:addStatusEffectEx(EFFECT_AFTERMATH_PLUSHA3,EFFECT_AFTERMATH_LV3,0,3,60);					
                end				
				player:addStatusEffect(EFFECT_AFTERMATH, 7, 3, 60, 0, 13);
			end	
		    local tp = player:getTP();
		    local duration = (tp/50);
		    if (target:hasStatusEffect(EFFECT_STUN) == false) then
			    target:addStatusEffect(EFFECT_STUN, 1, 0, duration);
		    end		
		end
	end		
	
	
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
