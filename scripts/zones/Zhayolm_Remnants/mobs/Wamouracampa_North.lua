-----------------------------------
-- Area:
-- NPC:  Wamouracampa North
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("Stagger",1);
	mob:setLocalVar("MagicCount",1);
	mob:setLocalVar("CritCount",1);

	

end;

function onMobEngaged(mob,target)

	local level = target:getMainLvl();
	local ptsize = target:getPartySize();
	local sizediff = level - 29;
	if (ptsize > 8) then
	    sizediff = sizediff + 5;
	elseif (ptsize > 6) then
	    sizediff = sizediff + 3;
	end
	
	mob:addMod(MOD_ATT,3*sizediff);
	mob:addMod(MOD_DEF,19*sizediff);
	mob:addMod(MOD_ACC,4*sizediff);
	mob:addMod(MOD_MACC,2*sizediff);		
	mob:addMod(MOD_EVA,9*sizediff);
	mob:addMod(MOD_INT,2*sizediff);
	mob:addMod(MOD_CHR,2*sizediff);
	mob:addMod(MOD_MND,2*sizediff);
	mob:addMod(MOD_STR,2*sizediff);
    mob:addMod(MOD_VIT,2*sizediff);
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,sizediff*11,0,5000);
	mob:addHP(5000);
	
	
	
	   
	-- printf("Engaged");

end

function onMobFight(mob,target)
 
    local battletime = mob:getBattleTime();
    local ms = mob:getLocalVar("MS");
	local randpd = math.random(90,115);

    if (battletime > ms + randpd) then
        mob:useMobAbility(432);
        mob:setLocalVar("MS", battletime);
	end


end;



function onCriticalHit(mob)
    local critRate = math.random(1,100);
    local stagger = mob:getLocalVar("Stagger");	
	local critCount = mob:getLocalVar("CritCount");
	if (critCount > critRate) then
		if (stagger == 1) then
	        mob:weaknessTrigger(3);
			mob:setLocalVar("Stagger",2);
			mob:setLocalVar("MS",700);  -- Stagger "removes" Mighty Strikes
		    mob:addStatusEffect(EFFECT_TERROR,1,0,5);
		    return EFFECT_TERROR;
		end
	else
	    critCount = critCount + 1;
		mob:setLocalVar("CritCount",critCount);
	end	




end



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("3rd_Floor_NM",1);
    else
        killer:PrintToPlayer("The device emits a faint hum...",0x15);
		killer:setVar("3rd_Floor_NM",1);
    end	
 
end;