---------------------------------------------------
-- Tachi Gekko
-- Deciding Maneuver: Fire
-- Recover HP equal to damage dealth.  Damage varries with TP.  
-- HP recovery ineffective against undead
-- Skillchain Properties: Compression/Reverberation
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/trustweaponskills");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onPetAbility(target, pet, skill)
    local basemod = 1.4;
    local numhits = 1;
	local attmod = 1;
    local accmod = 0;
	local defignore = 1;
	local str_wsc = 0.20;
	local dex_wsc = 0;
	local agi_wsc = 0.50;
	local vit_wsc = 0;
	local mnd_wsc = 0;
	
	local info = AutoRangedMove(pet,target,skill,basemod,numhits,attmod,accmod,defignore,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_BONUS,5,5,5);
 
    local dmg = MobFinalAdjustments(info.dmg,pet,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
	
	   if (dmg > 0) then
       target:addTP(2);
       pet:addTP(16);
    end

    target:delHP(dmg);
    return dmg;
end;




