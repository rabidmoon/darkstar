---------------------------------------------------
-- Knockout
-- Deals Threefold Damage
-- Damage Varries with TP
-- 100% TP - 1.5
-- 200% TP - 2.0
-- 300% TP - 3.0

-- TP Mods unknown
-- STR 25%

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
	local str_wsc = 0.25;
	local dex_wsc = 0.25;
	local agi_wsc = 0;
	local vit_wsc = 0;
	skill:setSkillchain(148);
	
	
	
	


	
	local info = AutoPhysicalMove(pet,target,skill,numhits,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,TP_DMG_BONUS,4,4.5,5);
 
    local dmg = MobFinalAdjustments(info.dmg,pet,skill,target,scattr,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	
	local hits = automatonhitslanded;
	local firsthit = 0;
	local remaining = 0;
	local finaltp = 0;
	
	   if (dmg > 0) then
       target:addTP(2);
	   if (hits > 1) then
	   remaining = hits - 1;
	   finaltp = (8.3 + remaining);
       pet:setTP(finaltp);
	   elseif (hits == 1) then
	   pet:setTP(8);
	   end
	   end
	 
    

    target:delHP(dmg);
    return dmg;
end;
