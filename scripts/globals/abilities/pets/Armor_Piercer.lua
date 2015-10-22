---------------------------------------------------
-- Armor Piercer
-- Deals a ranged attack to a single target that ignores Defense
-- Chance of Stunning Varries with TP
-- 100% TP - 40% Stun Chance
-- 200% TP - 60% Stun Chance
-- 300% TP - 80% Stun Chance

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
	skill:setSkillchain(135);




	
	local info = AutoRangedMove(pet,target,skill,numhits,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,TP_DMG_BONUS,6,6,6);
 
    local dmg = MobFinalAdjustments(info.dmg,pet,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
	
	   if (dmg > 0) then
       target:addTP(2);
       pet:setTP(16);
    end
	

	
	
	

    target:delHP(dmg);
    return dmg;
end;
