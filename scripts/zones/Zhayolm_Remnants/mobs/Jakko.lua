-----------------------------------
-- Area:
-- NPC:  Vagrant Lindwurm
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    

	

end;

function onMobEngaged(mob,target)
	local chance = 15; -- change chance to be dependant on members present
	SetDropRate(1839, 14551, chance * 10);
	local level = target:getMainLvl();
	local ptsize = target:getPartySize();
	local sizediff = level - 29;
	if (ptsize > 8) then
	    sizediff = sizediff + 5;
	elseif (ptsize > 6) then
	    sizediff = sizediff + 3;
	end
	
	mob:addMod(MOD_ATT,8*sizediff);
	mob:addMod(MOD_DEF,20*sizediff);
	mob:addMod(MOD_ACC,8*sizediff);
	mob:addMod(MOD_MACC,3*sizediff);		
	mob:addMod(MOD_EVA,3*sizediff);
	mob:addMod(MOD_INT,2*sizediff);
	mob:addMod(MOD_CHR,2*sizediff);
	mob:addMod(MOD_MND,2*sizediff);
	mob:addMod(MOD_STR,2*sizediff);
    mob:addMod(MOD_VIT,2*sizediff);
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,sizediff*4,0,5000);
	mob:addHP(5000);
	
	
	
	   
	printf("Engaged");

end

function onMobFight(mob,target)
 




end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	local battletime = mob:getBattleTime();
	printf("Battle Time is %s",battletime);
	if (battletime < 100) then
	    SetDropRate(1839, 14551, 1000);
	end	
 
end;