-----------------------------------
-- Retribution
-- Staff weapon skill
-- Skill Level: 230
-- Delivers a single-hit attack. Damage varies with TP.
-- In order to obtain Retribution, the quest Blood and Glory must be completed.
-- Despite the appearance of throwing the staff, this is not a long-range Weapon Skill like Mistral Axe.
-- The range only extends the usual 1 yalm beyond meleeing range.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:30% ; MND:50%
-- 100%TP    200%TP    300%TP
-- 2.00      2.50      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/quests");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 2; params.ftp200 = 2.5; params.ftp300 = 3;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.atkmulti = 1.5;
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
    local wsnm = player:getVar("RETRIBUTION");
	local unlock = 0;
    if (player:hasCompleteQuest(SANDORIA,BLOOD_AND_GLORY) == true) then -- Retribution Quest is done
	unlock = 1;
	elseif (player:getQuestStatus(SANDORIA,BLOOD_AND_GLORY) == true and wsnm > 0) then -- Retribution Quest Active
	wsnm = wsnm - 1;
	player:setVar("RETRIBUTION",wsnm);
	elseif (player:getQuestStatus(SANDORIA,BLOOD_AND_GLORY) == true and wsnm <= 0) then -- Retribution powered up
	unlock = 0.30;
	else
	unlock = 0.05;
	end
	
	damage = damage * WEAPON_SKILL_POWER * unlock
	return tpHits, extraHits, criticalHit, damage;

end
