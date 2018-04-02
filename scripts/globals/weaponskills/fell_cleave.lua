-----------------------------------
-- Fell Cleave
-- Great Axe weapon skill
-- Skill Level: 300
-- Delivers an area attack. Radius varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget.
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.
-- Element: None
-- Modifiers: STR: 60%
-- 100%TP    200%TP    300%TP
-- 2.00   	 2.00      2.00
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 2.0; params.ftp200 = 2.0; params.ftp300 = 2.0;
	params.str_wsc = 0.5; params.dex_wsc = 0.5; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp100 = 3.0; params.ftp200 = 3.0; params.ftp300 = 3.0;
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	local warha = 0;

	if (((player:getEquipID(SLOT_MAIN) == 18505) and player:getVar("WARHAFight") == 5)) then
	   warha = 1;
    end	  
	
	if((player:getEquipID(SLOT_MAIN) == 18505)) then
		if(damage > 0) then
			if(player:getTP() >= 100 and player:getTP() < 200) then
		        if (((warha == 1))  and (player:hasStatusEffect(EFFECT_AFTERMATH_PLUSHA3) == false) and (player:hasStatusEffect(EFFECT_LEVEL_TWO_SC) == false) 
				    and (player:hasStatusEffect(EFFECT_LEVEL_THREE_SC) == false) and (player:hasStatusEffect(EFFECT_LEVEL_FOUR_SC) == false)) then
			        player:addStatusEffectEx(EFFECT_AFTERMATH_PLUSHA1,EFFECT_AFTERMATH_LV1,0,3,60);
                end							
				player:addStatusEffect(EFFECT_AFTERMATH, 7, 3, 20, 0, 13);
			elseif(player:getTP() >= 200 and player:getTP() < 300) then
		        if (((warha == 1)) and (player:hasStatusEffect(EFFECT_AFTERMATH_PLUSHA3) == false) and (player:hasStatusEffect(EFFECT_LEVEL_TWO_SC) == false) 
				    and (player:hasStatusEffect(EFFECT_LEVEL_THREE_SC) == false) and (player:hasStatusEffect(EFFECT_LEVEL_FOUR_SC) == false)) then
			        player:addStatusEffectEx(EFFECT_AFTERMATH_PLUSHA2,EFFECT_AFTERMATH_LV2,0,3,60);
                end				
				player:addStatusEffect(EFFECT_AFTERMATH, 7, 3, 40, 0, 13);
			elseif(player:getTP() == 300) then
		        if (((warha == 1)) and (player:hasStatusEffect(EFFECT_AFTERMATH_PLUSHA3) == false) and (player:hasStatusEffect(EFFECT_LEVEL_TWO_SC) == false) 
				    and (player:hasStatusEffect(EFFECT_LEVEL_THREE_SC) == false) and (player:hasStatusEffect(EFFECT_LEVEL_FOUR_SC) == false)) then
			        player:addStatusEffectEx(EFFECT_AFTERMATH_PLUSHA3,EFFECT_AFTERMATH_LV3,0,3,60);
                end				
				player:addStatusEffect(EFFECT_AFTERMATH, 7, 3, 60, 0, 13);
			end		
		
		end
	end		
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
