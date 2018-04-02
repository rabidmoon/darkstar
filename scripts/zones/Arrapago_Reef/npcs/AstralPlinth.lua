-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Astral Plinth
-- @pos 22.446 -7.920 573.390 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Arrapago_Reef/TextIDs");
local Besieged = require("scripts/zones/Al_Zahbi/IDs");

function onSpawn(npc)
 
end
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	    SetServerVariable("AC_Posession",0);  -- Set AC posession back to Al Zahbi
		-- Spawn Astral Candy
		local npc = GetNPCByID(16974245); 
        npc:setStatus(STATUS_NORMAL);
		-- despawn Achieve and prevent helper from spawn
	    local achieve = GetNPCByID(16998895);
	    achieve:setStatus(STATUS_DISAPPEAR);
        -- Despawn All Helpers
        for id = Besieged.acnms[2].arhelper_start,Besieged.acnms[2].arhelper_end do 
		    DespawnMob(id);
		end	
		SetServerVariable("Generals_Captured",0);	
	    -- Deter spawn BLU Helper
	    DeterMob(16999067, true);
        DespawnMob(16999067);		
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
        GetNPCByID(16998975):setStatus(STATUS_DISAPPEAR);
		GetNPCByID(16998976):setStatus(STATUS_DISAPPEAR);
		GetNPCByID(16998977):setStatus(STATUS_DISAPPEAR);	
		GetNPCByID(16998978):setStatus(STATUS_DISAPPEAR);
		GetNPCByID(16998979):setStatus(STATUS_DISAPPEAR);	

		
        -- Set General Captures to 0
	    SetServerVariable("RughadjeenCapture",0);
	    SetServerVariable("GadalarCapture",0);
	    SetServerVariable("ZazargCapture",0);
	    SetServerVariable("MihliCapture",0);
	    SetServerVariable("NajelithCapture",0);				
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
	GetNPCByID(16998886):setStatus(STATUS_DISAPPEAR);
    player:PrintToServer("The Astral Candescance has been recovered!", 0x1C);	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	

	
end;