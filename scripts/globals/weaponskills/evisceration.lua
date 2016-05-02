-----------------------------------
-- Evisceration
-- Dagger weapon skill
-- Skill level: 230
-- In order to obtain Evisceration, the quest Cloak and Dagger must be completed.
-- Delivers a fivefold attack. Chance of params.critical hit varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.
-- Element: None
-- Modifiers: DEX:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/quests");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 5;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.1; params.crit200 = 0.3; params.crit300 = 0.5;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp100 = 1.25; params.ftp200 = 1.25; params.ftp300 = 1.25;
		params.dex_wsc = 0.5;
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	
	local wsnm = player:getVar("EVISCERATION");
	local unlock = 0;
    if (player:hasCompleteQuest(OUTLANDS,CLOAK_AND_DAGGER) == true) then -- Evisceration Quest is done
	unlock = 1;
	elseif (player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER) == QUEST_ACCEPTED and wsnm > 0) then -- Evisceration Quest Active
	unlock = 0.05;
	wsnm = wsnm - 1;
    if (wsnm < 1) then
	wsnm = 1;
	end
	player:setVar("EVISCERATION",wsnm);
	elseif (player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER) == QUEST_ACCEPTED and wsnm <= 0) then -- Evisceration powered up
	unlock = 0.30;
	else
	unlock = 0.05;
	end
	
	
	
	
	
	
	if (damage > 0) then
	if ((player:getEquipID(SLOT_MAIN) == 20618) and (player:getMainJob() == JOB_THF)) then
		
		unlock = 1.50; -- High Artifact Multiplier

			if (player:getTP() >= 100 and player:getTP() <200) then
				player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, 20, 0, 13);
			elseif (player:getTP() >= 200 and player:getTP() <300) then
				player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, 40, 0, 13);
			elseif (player:getTP() == 300) then
				player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, 60, 0, 13);
			end
		end
	end
	
	
	
	damage = damage * WEAPON_SKILL_POWER * unlock;
	return tpHits, extraHits, criticalHit, damage;

end
