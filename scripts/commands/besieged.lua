---------------------------------------------------------------------------------------------------
-- func: besieged
-- desc: Starts Besieged: 1 = Undead, 2 = Trolls, 3 = Mamool, 0 = Off
---------------------------------------------------------------------------------------------------
local Besieged = require("scripts/zones/Al_Zahbi/IDs");

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, horde, level)
    -- SetServerVariable("UndeadTimer",os.time() + 12960);
    -- Get General Info
   
    -- Arrapago
    local rughadjeen = GetServerVariable("Rughadjeen_Prison");
    local gadalar = GetServerVariable("Gadalar_Prison");
    local mihli = GetServerVariable("Mihli_Prison");
    local zazarag = GetServerVariable("Zazarag_Prison");
    local najelith = GetServerVariable("Najelith_Prison");
   
   
   
   
   
   
   
   
    local undead = GetMobByID(16974025);
	local trolls = GetMobByID(16973825);
	local mamool = GetMobByID(16973930);
	local defendforcesU = GetServerVariable("Undead_Forces");

    local generals = GetServerVariable("Generals_Captured");	
	local respawn = GetMobByID(16974025):getRespawnTime();
    local hordeStatusU = GetServerVariable("Undead_Horde_Status");
    local hordeStatusT = GetServerVariable("Troll_Horde_Status");
    local hordeStatusM = GetServerVariable("Mamool_Horde_Status");	
	
    local undeadSpawn = undead:getRespawnTime();
	local trollSpawn = trolls:getRespawnTime();
	local mamoolSpawn = mamool:getRespawnTime();
	
	local undeadLevel = GetServerVariable("UndeadLevel");
	local trollLevel = GetServerVariable("TrollLevel");
	local mamoolLevel = GetServerVariable("MamoolLevel");
	
	local undeadStr = GetServerVariable("UndeadStr");
	local trollStr = GetServerVariable("TrollStr");
	local mamoolStr = GetServerVariable("MamoolStr");
	
	local undeadremaining = GetServerVariable("UndeadTimer");  -- When the besiged will start in os time
	local trollremaining = GetServerVariable("TrollTimer");  -- When the besiged will start in os time
	local mamoolremaining = GetServerVariable("MamoolTimer");  -- When the besiged will start in os time
	
	
	local undeadDif = undeadremaining - os.time();
	

	player:PrintToPlayer("Undead will spawn in "..undeadDif.." seconds",0x1C);
	local trollDif = trollremaining - os.time();
	local mamoolDif = mamoolremaining - os.time();
	
	
	local hordeDifU = hordeStatusU - os.time();
	local hordeDifT = hordeStatusT - os.time();
	local hordeDifM = hordeStatusM - os.time();	
	
	

	local undeadtimer = math.floor((undeadStr - (undeadDif)) / 108);
	local trolltimer = math.floor((trollStr - (trollDif)) / 108);	
	local mamooltimer = math.floor((mamoolStr - (mamoolDif)) / 108);	
	
	local posession =  GetServerVariable("AC_Posession")
	
	if (posession == nil or posession == 0) then
	    if (hordeStatusU == 1000) then
    	    player:PrintToPlayer("Undead Swarm - Lv: "..undeadLevel.." Enemy Forces: "..undeadtimer.." Status: Preparing",0x1C);
	    elseif (hordeDifU < 0) then
    	    player:PrintToPlayer("Undead Swarm - Lv: "..undeadLevel.." Enemy Forces: "..undeadtimer.." Status: Attacking",0x1C);
	    elseif (hordeDifU < 300) then
    	    player:PrintToPlayer("Undead Swarm - Lv: "..undeadLevel.." Enemy Forces: "..undeadtimer.." Status: Advancing",0x1C);
        end
		-- Trolls
	    if (hordeStatusT == 1000) then
    	    player:PrintToPlayer("Troll Mercanaries - Lv: "..trollLevel.." Enemy Forces: "..trolltimer.." Status: Preparing",0x1C);
	    elseif (hordeDifT < 0) then
    	    player:PrintToPlayer("Troll Mercanaries - Lv: "..trollLevel.." Enemy Forces: "..trolltimer.." Status: Attacking",0x1C);
	    elseif (hordeDifT < 300) then
    	    player:PrintToPlayer("Troll Mercanaries - Lv: "..trollLevel.." Enemy Forces: "..trolltimer.." Status: Advancing",0x1C);
        end	
        -- Mamool Ja
	    if (hordeStatusM == 1000) then
    	    player:PrintToPlayer("Mamool Ja Savages - Lv: "..mamoolLevel.." Enemy Forces: "..mamooltimer.." Status: Preparing",0x1C);
	    elseif (hordeDifM < 0) then
    	    player:PrintToPlayer("Mamool Ja Savages - Lv: "..mamoolLevel.." Enemy Forces: "..mamooltimer.." Status: Attacking",0x1C);
	    elseif (hordeDifM < 300) then
    	    player:PrintToPlayer("Mamool Ja Savagess - Lv: "..mamoolLevel.." Enemy Forces: "..mamooltimer.." Status: Advancing",0x1C);
        end			
	elseif (posession == 1) then
	    player:PrintToPlayer("Undead Swarm - Lv: "..undeadLevel.." Enemy Forces: "..defendforcesU.." Status: Defending",0x1C);
	end
	player:PrintToPlayer("Generals Captured: "..generals.."",0x1C);
	
	
	if (rughadjeen == 1) then
	    player:PrintToPlayer("Rughadjeen Location: Arrapago",0x1C);
	elseif (rughadjeen == 2) then
	    player:PrintToPlayer("Rughadjeen Location: Halvung",0x1C);	
	elseif (rughadjeen == 3) then
	    player:PrintToPlayer("Rughadjeen Location: Mamook",0x1C);		
	end

	
	if (gadalar == 1) then
	    player:PrintToPlayer("Gadalar Location: Arrapago",0x1C);
	elseif (gadalar == 2) then
	    player:PrintToPlayer("Gadalar Location: Halvung",0x1C);	
	elseif (gadalar == 3) then
	    player:PrintToPlayer("Gadalar Location: Mamook",0x1C);		
	end


	if (mihli == 1) then
	    player:PrintToPlayer("Mihli Location: Arrapago",0x1C);
	elseif (mihli == 2) then
	    player:PrintToPlayer("Mihli Location: Halvung",0x1C);	
	elseif (mihli == 3) then
	    player:PrintToPlayer("Mihli Location: Mamook",0x1C);		
	end


	if (zazarag == 1) then
	    player:PrintToPlayer("Zazarag Location: Arrapago",0x1C);
	elseif (zazarag == 2) then
	    player:PrintToPlayer("Zazarag Location: Halvung",0x1C);	
	elseif (zazarag == 3) then
	    player:PrintToPlayer("Zazarag Location: Mamook",0x1C);		
	end


	if (najelith == 1) then
	    player:PrintToPlayer("Najelith Location: Arrapago",0x1C);
	elseif (najelith == 2) then
	    player:PrintToPlayer("Najelith Location: Halvung",0x1C);	
	elseif (najelith == 3) then
	    player:PrintToPlayer("Najelith Location: Mamook",0x1C);		
	end	
	

	
end