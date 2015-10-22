---------------------------------------------------
-- Chimera Ripper
-- Deals damage to a single target
-- Can only be used when Fire Maneuver is present
-- Damage Varries with TP
-- 100% TP - 1.5
-- 200% TP - 2.0
-- 300% TP - 3.0

-- TP Mods unknown
-- STR 25%
-- VIT 25%
-- Skillchain Properties: Induration/Detonation (Reversed from Retail)
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
	local str_wsc = 0.15;
	local dex_wsc = 0;
	local agi_wsc = 0;
	local vit_wsc = 0.15;
	skill:setSkillchain(150);
	
	


	
	local info = AutoPhysicalMove(pet,target,skill,numhits,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,TP_DMG_BONUS,1.5,2,3);
 
    local dmg = MobFinalAdjustments(info.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	
	   if (dmg > 0) then
       target:addTP(2);
       pet:setTP(8);
    end

    target:delHP(dmg);
    return dmg;
end;
