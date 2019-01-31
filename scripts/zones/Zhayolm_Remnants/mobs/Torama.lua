-----------------------------------
-- Area:
-- NPC:  Torama
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

	
	mob:addMod(MOD_ATT,20);
	mob:addMod(MOD_DEF,60);
	mob:addMod(MOD_ACC,30);
	mob:addMod(MOD_MACC,10);		
	mob:addMod(MOD_EVA,20);
	mob:addMod(MOD_INT,20);
	mob:addMod(MOD_CHR,20);
	mob:addMod(MOD_MND,20);
	mob:addMod(MOD_STR,20);
    mob:addMod(MOD_VIT,20);
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,30,0,5000);
	mob:addHP(5000);
	
	
	
	   
	-- printf("Engaged");

end

function onMobFight(mob,target)
 



end;



function onCriticalHit(mob)




end



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    salvageAmbient(mob,killer)
    salvageChestZ(mob, killer)
	

end;