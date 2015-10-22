---------------------------------------------------
-- Arcuballista
-- Deals a ranged attack to a single target.
-- Damage Varries with TP
-- 100% TP - 2.5
-- 200% TP - 3.0
-- 300% TP - 4.0

-- TP Mods unknown
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/automatonweaponskills");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onPetAbility(target, pet, skill)
    local numhits = 1;
    local accmod = 1;
	local str_wsc = 0.5;
	local dex_wsc = 0.5;
	local agi_wsc = 0;
	local vit_wsc = 0;
	skill:setSkillchain(192);
	


	
	local info = AutoRangedMove(pet,target,skill,numhits,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,TP_DMG_BONUS,2.5,3,4);
 
    local dmg = MobFinalAdjustments(info.dmg,pet,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
	
	   if (dmg > 0) then
       target:addTP(2);
       pet:setTP(16);
    end

    target:delHP(dmg);
    return dmg;
end;
