-----------------------------------
--
-- Zone: Al_Zahbi (48)
--
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/Al_Zahbi/TextIDs");

local Besieged = require("scripts/zones/Al_Zahbi/IDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

-- Get POP Functions for Beseiged.  There is a default pop number for NM's so when server resets they spawn within an hour?
    local ac = GetServerVariable("AC_Posession");
	SetServerVariable("Besieged_Horde",0);
	SetServerVariable("Dead_Helpers",0);
		for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
		    GetNPCByID(id):setStatus(0);
		end	
        -- Despawn all Helper NPCs
		for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
		    DespawnMob(helpers);
		end		
	if (ac == 1) then
        -- Set Undead Pop Functions	
	   	DeterMob(16974025, false);
		GetMobByID(16974025):setRespawnTime(2500); -- 1 hr  3600
        local defaultpoptimeU = GetMobByID(16974025):getRespawnTime();
		local repoptime = defaultpoptimeU / 1000;
		local level = GetServerVariable("UndeadLevel");
        SetServerVariable("UndeadStr",(10800 + (1080 * level)));	-- Used to calculate the strength of the mob	
        SetServerVariable("UndeadTimer",os.time() + repoptime);	
		-- Set Troll POP fuctions 
	   	DeterMob(16973930, false);
		GetMobByID(16973930):setRespawnTime(1200); -- 1 hr 45 min 6300
        local defaultpoptimeT = GetMobByID(16973930):getRespawnTime();
		local repoptime = defaultpoptimeT / 1000;
		local level = GetServerVariable("TrollLevel");
        SetServerVariable("TrollStr",(10800 + (1080 * level)));	-- Used to calculate the strength of the mob	
        SetServerVariable("TrollTimer",os.time() + repoptime);			
		-- Set Mamool Ja POP fuctions 
	   	DeterMob(16973825, false);
		GetMobByID(16973825):setRespawnTime(30); -- 2 hr 15 min   8100
        local defaultpoptimeM = GetMobByID(16973825):getRespawnTime();
		local repoptime = defaultpoptimeM / 1000;
		local level = GetServerVariable("MamoolLevel");
        SetServerVariable("MamoolStr",(10800 + (1080 * level)));	-- Used to calculate the strength of the mob	
        SetServerVariable("MamoolTimer",os.time() + repoptime);	
    elseif (ac == 2) then
	   	DeterMob(16974025, true); 
		DeterMob(16973930, true); 
		DeterMob(16973825, true);
    elseif (ac == 3) then
	   	DeterMob(16974025, true); 
		DeterMob(16973930, true); 
		DeterMob(16973825, true);
    elseif (ac == 4) then
	   	DeterMob(16974025, true); 
		DeterMob(16973930, true); 
		DeterMob(16973825, true);		
	end

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;
	local besieged = GetServerVariable("Besieged_Horde");
	printf("Besieged Horde on Login is %u",besieged);
	-- MOG HOUSE EXIT
	if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		position = math.random(1,5) + 37;
		player:setPos(position,0,-62,192);
	end
	
	if (besieged > 0) then
	    printf("Apply Besieged");
	    player:addStatusEffect(EFFECT_BESIEGED,3,0,3600);
	end
	
	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;