-----------------------------------
-- Area: Ghelsba outpost
-- NPC:  Furies
-- BCNM20
-----------------------------------

require("scripts/globals/endurancemessage");
require("scripts/globals/endurancereset");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  mob:setLocalVar("Wave",0);
  mob:setLocalVar("Wave_Progress",0);
  enduranceReset(mob) -- Reset all waves to not killed
  mob:untargetable(false); 
  mob:setLocalVar("Engage",1);
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local master;
	local leader;
	local hasKey;
	local leaderWave;
	local mammetHP = mob:getHP();
	local engageCheck = mob:getLocalVar("Engage");
	
	
	if (target:getObjType() == TYPE_PET) then
	  master = target:getMaster();
	  -- check for party leader
	  if (master:getPartyLeader() ~= nil) then -- master has party
	    leader = master:getPartyLeader();
		hasKey = leader:getVar("EnduranceKey");
        leaderWave = leader:getVar("EnduranceWave");
	  else
		hasKey = master:getVar("EnduranceKey");
        leaderWave = master:getVar("EnduranceWave");
	  end 	
	else
	  if (target:getPartyLeader() ~= nil) then -- target has party
	    leader = target:getPartyLeader();
		hasKey = leader:getVar("EnduranceKey");
        leaderWave = leader:getVar("EnduranceWave");
	  else
		hasKey = target:getVar("EnduranceKey");
        leaderWave = target:getVar("EnduranceWave");
	  end	    
	end
	
	if (engageCheck == 1) then
	  printf("Engage Check Enabled");
      if (hasKey == 1) then -- Leader paid for to use Endurance Key to start off at a specific Wave
	    printf("Leader has Key");
   	    if (leaderWave == 1) then	    
	      mob:setLocalVar("Wave",1);  -- Set Mammet Wave to 1 
	      mob:setHP(mammetHP * 0.98)    -- Reduce HP by 2%	
          printf("Change HP");		  
	    end
      else
        mob:setLocalVar("Wave",0); -- No Key present set wave to 0	
		printf("Leader Doesn't Have Key");
      end	 	
	  mob:setLocalVar("Engage",0);
	end  





end;

function onMobFight(mob,target)

  -- target:PrintToParty("TEST");

  local wave = mob:getLocalVar("Wave");
  local hp = mob:getHPP();
  local coeurl = 17526937;
  local mandragora = 17526942;
  -- do Waves
  if (hp < 98 and wave == 0) then
      mob:setLocalVar("Wave",1);
      tauntFightMsg(mob,target)	  
	  mob:untargetable(true);
	  mob:hideName(true);
	  mob:setPos(300,300,300);	  
	  mob:addStatusEffect(EFFECT_TERROR,1,0,1800);
      SpawnMob(coeurl):updateClaim(target);	
  elseif (hp < 96 and wave == 1) then
      mob:setLocalVar("Wave",2);
      tauntFightMsg(mob,target)	  
	  mob:untargetable(true);
	  mob:hideName(true);
	  mob:setPos(300,300,300);	  
	  mob:addStatusEffect(EFFECT_TERROR,1,0,1800);
      SpawnMob(mandragora):updateClaim(target);	  
  
  end
  
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
