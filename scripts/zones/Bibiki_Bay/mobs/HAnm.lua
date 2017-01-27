-----------------------------------
-- Area: Bibiki Bay
--  MOB: Naraka
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
   mob:setLocalVar("Trigger",1); 
   local blank = GetNPCByID(16793928);
   blank:setStatus(STATUS_DISAPPEAR);
end;







-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

local hp = mob:getHPP();
local trigger = mob:getLocalVar("Trigger");
local rnd = 0;



if (hp <= 75 and trigger == 1) then
    randtwohour = math.random(1,7);
	if (randtwohour == 1) then
	    mob:useMobAbility(432);
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 2) then
	    mob:useMobAbility(437);  -- Perfect Dodge
		mob:setLocalVar("Trigger",2);	
	elseif (randtwohour == 3) then
	    mob:useMobAbility(436);  -- Chainspell
		mob:setLocalVar("Trigger",2);			
	elseif (randtwohour == 4) then
	    mob:useMobAbility(438);  -- Invincible
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 5) then
	    mob:useMobAbility(439);  -- Bloodweapon
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 56) then
	    mob:useMobAbility(764);  -- Meikyo Shisui
		mob:setLocalVar("Trigger",2);
    end		
elseif (hp <= 50 and trigger == 2) then
    randtwohour = math.random(1,7);
	if (randtwohour == 1) then
	    mob:useMobAbility(432);
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 2) then
	    mob:useMobAbility(437);  -- Perfect Dodge
		mob:setLocalVar("Trigger",3);	
	elseif (randtwohour == 3) then
	    mob:useMobAbility(436);  -- Chainspell
		mob:setLocalVar("Trigger",3);			
	elseif (randtwohour == 4) then
	    mob:useMobAbility(438);  -- Invincible
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 5) then
	    mob:useMobAbility(439);  -- Bloodweapon
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 56) then
	    mob:useMobAbility(764);  -- Meikyo Shisui
		mob:setLocalVar("Trigger",3);
    end		
elseif (hp <= 25 and trigger == 3) then
    randtwohour = math.random(1,7);
	if (randtwohour == 1) then
	    mob:useMobAbility(432);
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 2) then
	    mob:useMobAbility(437);  -- Perfect Dodge
		mob:setLocalVar("Trigger",4);	
	elseif (randtwohour == 3) then
	    mob:useMobAbility(436);  -- Chainspell
		mob:setLocalVar("Trigger",4);			
	elseif (randtwohour == 4) then
	    mob:useMobAbility(438);  -- Invincible
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 5) then
	    mob:useMobAbility(439);  -- Bloodweapon
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 56) then
	    mob:useMobAbility(764);  -- Meikyo Shisui
		mob:setLocalVar("Trigger",4);	
    end
end	



end;


-----------------------------------
-- onWeaponskillHit
-----------------------------------
function onWeaponskillHit(mob, attacker, weaponskill)

local rnd = math.random(1,5);
-- printf(rnd);

if (rnd == 1) then -- strong against slashing
    mob:setMod(MOD_SLASHRES,100);
    mob:setMod(MOD_PIERCERES,1000);
    mob:setMod(MOD_HTHRES,1000);
	mob:setMod(MOD_DMGMAGIC, 0);
	-- printf("Slashing \n");
elseif (rnd == 2) then -- strong against piercing
    mob:setMod(MOD_SLASHRES,1000);
    mob:setMod(MOD_PIERCERES,100);
    mob:setMod(MOD_HTHRES,1000);
	mob:setMod(MOD_DMGMAGIC, 0);
	-- printf("Pierce \n");	
elseif (rnd == 3) then -- strong against blunt
    mob:setMod(MOD_SLASHRES,1000);
    mob:setMod(MOD_PIERCERES,1000);
    mob:setMod(MOD_HTHRES,100);
	mob:setMod(MOD_DMGMAGIC, 0);
	-- printf("Blunt \n");	
elseif (rnd == 4) then -- strong against magic
    mob:setMod(MOD_SLASHRES,100);
    mob:setMod(MOD_PIERCERES,1000);
    mob:setMod(MOD_HTHRES,1000);
	mob:setMod(MOD_DMGMAGIC, -80);
	-- printf("Magic \n");	
end	
return 0;
	



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)


if (killer:getObjType() == TYPE_PC) then

    if (killer:getVar("WARHAFight") == 1) then
	    killer:setVar("WARHAFight",2);
	end

    if (killer:getVar("MNKHAFight") == 1) then
	    killer:setVar("MNKHAFight",2);
	end	

    if (killer:getVar("WHMHAFight") == 1) then
	    killer:setVar("WHMHAFight",2);
	end

    if (killer:getVar("BLMHAFight") == 1) then
	    killer:setVar("BLMHAFight",2);
	end	

    if (killer:getVar("RDMHAFight") == 1) then
	    killer:setVar("RDMHAFight",2);
	end

    if (killer:getVar("THFHAFight") == 1) then
	    killer:setVar("THFHAFight",2);
	end	

    if (killer:getVar("PLDHAFight") == 1) then
	    killer:setVar("PLDHAFight",2);
	end

    if (killer:getVar("DRKHAFight") == 1) then
	    killer:setVar("DRKHAFight",2);
	end	

    if (killer:getVar("BSTHAFight") == 1) then
	    killer:setVar("BSTHAFight",2);
	end

    if (killer:getVar("BRDHAFight") == 1) then
	    killer:setVar("BRDHAFight",2);
	end	

    if (killer:getVar("RNGHAFight") == 1) then
	    killer:setVar("RNGHAFight",2);
	end

    if (killer:getVar("SAMHAFight") == 1) then
	    killer:setVar("SAMHAFight",2);
	end	

    if (killer:getVar("NINHAFight") == 1) then
	    killer:setVar("NINHAFight",2);
	end

    if (killer:getVar("DRGHAFight") == 1) then
	    killer:setVar("DRGHAFight",2);
	end	

    if (killer:getVar("SMNHAFight") == 1) then
	    killer:setVar("SMNHAFight",2);
	end

    if (killer:getVar("BLUHAFight") == 1) then
	    killer:setVar("BLUHAFight",2);
	end	

    if (killer:getVar("CORHAFight") == 1) then
	    killer:setVar("CORHAFight",2);
	end

    if (killer:getVar("PUPHAFight") == 1) then
	    killer:setVar("PUPHAFight",2);
	end	

    if (killer:getVar("DNCHAFight") == 1) then
	    killer:setVar("DNCHAFight",2);
	end

    if (killer:getVar("SCHHAFight") == 1) then
	    killer:setVar("SCHHAFight",2);
	end	
	killer:PrintToPlayer("There is something sparkling in the sand!", 0xD); 
end	

end;


function onMobDespawn(mob)
   local blank = GetNPCByID(16793928);
   blank:setStatus(STATUS_NORMAL);
end;