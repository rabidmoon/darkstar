-----------------------------------
-- Area: Halvung
-- NPC:  Achaic Mirror
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/besiegedhelper");
require("scripts/globals/pathfind");
local Besieged = require("scripts/zones/Halvung/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
 mob:addStatusEffect(EFFECT_PETRIFICATION,1,3,432000);
 mob:addMod(MOD_UDMGPHYS, -90);
 mob:addMod(MOD_UDMGRANGE, -90);
 mob:addMod(MOD_DMGMAGIC, -90);
 mob:addStatusEffect(EFFECT_NO_REST,3,0,0);
 local MobID = mob:getID(); 
 local hp1 = GetServerVariable("[HA]Mirror1");
 local hp2 = GetServerVariable("[HA]Mirror2");
 local hp3 = GetServerVariable("[HA]Mirror3");	
 -- printf("Mirror1 hp on spawn is %u",hp1);
 -- printf("Mirror2 hp on spawn is %u",hp2);
 -- printf("Mirror3 hp on spawn is %u",hp3); 
 -- GetMobByID(16998838):setHP(hp1);
 -- GetMobByID(16998839):setHP(hp2);
--  GetMobByID(16998840):setHP(hp3);
    if (MobID == 17031568) then
        mob:setHP(hp1);
	end
    if (MobID == 17031569) then
        mob:setHP(hp2);
	end  
    if (MobID == 17031570) then
        mob:setHP(hp3);
	end  	
 
 
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
 
end;

function onPath(mob)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local killed = GetServerVariable("TrollACKilled");
	killed = killed + 1;
	printf("Archaic_Mirror.lua - Mirror Down");
	-- Move this to besiegedhelper global after if then when testing done
	if (killed >= 3) then
	    printf("THE AC HAS BEEN RECOVERED!!!! RESTART BESIEGED!");
        SetServerVariable("AC_Posession",1);  -- Set AC posession back to Al Zahbi
		-- Spawn Astral Candy
		local npc = GetNPCByID(16974245); 
        npc:setStatus(STATUS_NORMAL);
		-- despawn Achieve and prevent helper from spawn
	    local achieve = GetNPCByID(17031612);
	    achieve:setStatus(STATUS_DISAPPEAR);
        -- Despawn All Helpers
        for id = Besieged.acnms[1].hahelper_start,Besieged.acnms[1].hahelper_end do 
		    DespawnMob(id);
		end	
		-- Depsawn all trolls and helpers
		DespawnMob(17031565);
		DespawnMob(17031566);
		DespawnMob(17031567);
        -- Despawn Helper NM's
		for i,v in pairs(Besieged.nmmobs[1]) do
            DespawnMob(v, instance);
        end		
		SetServerVariable("Generals_Captured",0);
		SetServerVariable("SiegeDonation",0);		
	    -- Deter spawn BLU Helper
	    DeterMob(17031741, true);
        DespawnMob(17031741);
        -- Despawn Archieve Master
	    local achieve = GetNPCByID(17031612);
	    achieve:setStatus(STATUS_DISAPPEAR);	
        -- Set Mirrors 
		local mirror1 = GetMobByID(17031568):getHP();
		local mirror2 = GetMobByID(17031569):getHP();
		local mirror3 = GetMobByID(17031570):getHP();
     	SetServerVariable("[HA]Mirror1",mirror1);
     	SetServerVariable("[HA]Mirror2",mirror2);
     	SetServerVariable("[HA]Mirror3",mirror3);		
		-- Set Besiged Mobs to Spawn
	    DeterMob(16974025, false);  -- undead
	    DeterMob(16973825, false);  -- Trolls
	    DeterMob(16973930, false);  -- Mamool		
	    -- Reset All mobs Levels and respawn timers	
		GetMobByID(16974025):setRespawnTime(3600);  -- Undead Attacks first at 1 hr
		GetMobByID(16973825):setRespawnTime(5400);  -- Trolls 1.5 hrs
		GetMobByID(16973930):setRespawnTime(7200);  -- Mamool 2 hrs	
		-- Reset Levels for now.  Later Update don't do this only reset the beastmen who lose the AC
		SetServerVariable("UndeadLevel",1);
		SetServerVariable("MamoolLevel",1);	
		SetServerVariable("TrollLevel",1);	
		-- Despawn Prisoners
        GetNPCByID(17031704):setStatus(STATUS_DISAPPEAR);
		GetNPCByID(17031705):setStatus(STATUS_DISAPPEAR);
		GetNPCByID(17031706):setStatus(STATUS_DISAPPEAR);	
		GetNPCByID(17031707):setStatus(STATUS_DISAPPEAR);
		GetNPCByID(17031708):setStatus(STATUS_DISAPPEAR);	
        -- Reset AC Killed
		SetServerVariable("TrollACKilled",0);	
        -- Set General Captures to 0
	    SetServerVariable("RughadjeenCapture",0);
	    SetServerVariable("GadalarCapture",0);
	    SetServerVariable("ZazargCapture",0);
	    SetServerVariable("MihliCapture",0);
	    SetServerVariable("NajelithCapture",0);	
        -- Set Besieged Horde to 0 otherwise Besieged won't start
        SetServerVariable("Besieged_Horde",0);		
        -- Reset Timer info for @besiged
		local defaultpoptimeU = GetMobByID(16974025):getRespawnTime();
		local defaultpoptimeM = GetMobByID(16973930):getRespawnTime();	
		local defaultpoptimeT = GetMobByID(16973825):getRespawnTime();			
		local repoptimeU = defaultpoptimeU / 1000;
		local repoptimeM = defaultpoptimeM / 1000;	
		local repoptimeT = defaultpoptimeT / 1000;		
		local levelU = GetServerVariable("UndeadLevel");
		local levelM = GetServerVariable("MamoolLevel");
		local levelT = GetServerVariable("TrollLevel");		
        SetServerVariable("UndeadStr",(10800 + (1080 * levelU)));	-- Used to calculate the strength of Undead	
        SetServerVariable("MamoolStr",(10800 + (1080 * levelM)));	-- Used to calculate the strength of Undead	
        SetServerVariable("TrollStr",(10800 + (1080 * levelT)));	-- Used to calculate the strength of Undead			
        SetServerVariable("UndeadTimer",os.time() + repoptimeU);
        SetServerVariable("MamoolTimer",os.time() + repoptimeM);
        SetServerVariable("TrollTimer",os.time() + repoptimeT);			
		SetServerVariable("Besieged_Helpers_Death",0);	
	-- GetNPCByID(16998886):setStatus(STATUS_DISAPPEAR);
	end
    SetServerVariable("TrollACKilled",killed);	

end;

function onMobRoam(mob)

end;