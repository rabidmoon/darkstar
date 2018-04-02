-----------------------------------
-- Area: Halvung
-- NPC:  Helper
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Halvung/IDs");


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local nmhelp = math.random(320,420);
	mob:setLocalVar("helperSpawn", os.time() + 45);
	mob:setLocalVar("nm_mobSpawn", os.time() + nmhelp);
	mob:setLocalVar("helppop",1);
	local length = math.random(900,1320);
	printf("Helper.lua - Time of Siege is %u in seconds",length);
	local fighttime = os.time() + length;
	local randgen = math.random(1,3);
	local general = 0;
	local genscap = 0;
	printf("HALVUNG SIEGE HAS STARTED!!! Spawning Helpers in 45 Seconds.");
	SetServerVariable("Besieged_Horde",3);
	local players = mob:getZone():getPlayers();
	    for i, person in pairs(players) do
			person:ChangeMusic(1, 142);
			person:ChangeMusic(2, 142);
		end	
		
	-- Add petrification to Mirros so they don't move/hit back
	local mirror1 = GetMobByID(17031568);
	local mirror2 = GetMobByID(17031569);
	local mirror3 = GetMobByID(17031570);
	mirror1:addStatusEffect(EFFECT_PETRIFICATION,1,3,4000);
	mirror2:addStatusEffect(EFFECT_PETRIFICATION,1,3,4000);
	mirror3:addStatusEffect(EFFECT_PETRIFICATION,1,3,4000);	
    local mihli = GetServerVariable("MihliCapture");
	printf ("Mihli is %u",mihli);
    local gadalar = GetServerVariable("GadalarCapture");
	printf ("Gadalar is %u",gadalar);	
	local rughadjeen = GetServerVariable("RughadjeenCapture");
	printf ("Rughadjeen is %u",rughadjeen);	
	local zazarg = GetServerVariable("ZazargCapture");
	printf ("Zazarg is %u",zazarg);	
	local najelith = GetServerVariable("NajelithCapture");
	printf ("Najelith is %u",najelith);	
	
	if (randgen == 1) then
	    if (mihli == 0) then
		    general = 17031754;
		elseif (gadalar == 0) then
            general = 17031757;		
		elseif (rughadjeen == 0) then
            general = 17031756;	
		elseif (zazarg == 0) then
            general = 17031755;	
		elseif (najelith == 0) then
            general = 17031758;				
	    else
		    genscap = 1;
	    end
	elseif (randgen == 2) then
		if (gadalar == 0) then
            general = 17031757;		
		elseif (rughadjeen == 0) then
            general = 17031756;	
		elseif (zazarg == 0) then
            general = 17031755;	
		elseif (najelith == 0) then
            general = 17031758;	
	    elseif (mihli == 0) then
		    general = 17031754;			
	    else
		    genscap = 1;
	    end	
	elseif (randgen == 3) then
        if (rughadjeen == 0) then
            general = 17031756;	
		elseif (zazarg == 0) then
            general = 17031755;	
		elseif (najelith == 0) then
            general = 17031758;	
	    elseif (mihli == 0) then
		    general = 17031754;	
	    elseif (gadalar == 0) then
            general = 17031757;				
	    else
		    genscap = 1;
	    end	
    end	

    mob:setLocalVar("GeneralSpawn",general);
	printf("General is %u",general);
    mob:setLocalVar("GeneralCaptured",genscap);	

	SetServerVariable("Helper_Fight_Length",fighttime);
	SpawnMob(17031565);
	SpawnMob(17031566);
	SpawnMob(17031567);	
    onMobRoam(mob);
	SetServerVariable("Helper_Death",0);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

function onPath(mob)

end;

function onMobDespawn(mob)
	local players = mob:getZone():getPlayers();
	    -- for i, person in pairs(players) do
			-- person:ChangeMusic(1, 150);
			-- person:ChangeMusic(2, 139);
		-- end	
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

end;

function onMobRoam(mob)
    -- printf("ROAM");
    local poptime = mob:getLocalVar("helperSpawn");
	local index = mob:getLocalVar("index");
	local genscap = mob:getLocalVar("GeneralCaptured");	
	local general = mob:getLocalVar("GeneralSpawn");
    local nmhelp = mob:getLocalVar("nm_mobSpawn");	
    local helppop = mob:getLocalVar("helppop");
    if (os.time() - poptime > 6 and index <= 13) then
        SpawnMob(Besieged.halvunghelpers[index]);
        printf("Index is %u",index);		
		index = index + 1;
        mob:setLocalVar("helperSpawn", os.time());
        mob:setLocalVar("index",index);	
    elseif (os.time() - poptime > 6 and index == 14 and genscap ~= 1) then
        SpawnMob(general);	
		index = index + 1;
        mob:setLocalVar("helperSpawn", os.time());
        mob:setLocalVar("index",index);		
	end
	
	if (os.time() > nmhelp and helppop == 1) then
	    for i,v in pairs(Besieged.nmmobs[1]) do
            SpawnMob(v, instance);
        end
		printf("SPAWNING HELPER MOBS NOW!!!!");
		mob:setLocalVar("helppop",0);

    end		
end;