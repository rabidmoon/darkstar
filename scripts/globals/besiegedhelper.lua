require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/status");
local Besieged = require("scripts/zones/Al_Zahbi/IDs");

function besiegedNPCAggro(mob)
    -- NPC's will attack mobs in range
	local MobID = mob:getID();
    if (GetServerVariable("Besieged_Horde") == 1) then -- undead
        for id = Besieged.mobs[1].mobs_start,Besieged.mobs[1].mobs_end do 
            if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 25) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
	    end	
    elseif (GetServerVariable("Besieged_Horde") == 2) then -- Trolls
        for id = Besieged.mobs[2].mobs_start,Besieged.mobs[2].mobs_end do 
            if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 25) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
	    end	
    elseif (GetServerVariable("Besieged_Horde") == 3) then -- Mamool
        for id = Besieged.mobs[3].mobs_start,Besieged.mobs[3].mobs_end do 
            if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 25) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
	    end			
	end
end;

function besiegedGeneralAggro(mob)
    -- NPC's will attack mobs in range
	local MobID = mob:getID();
    if (GetServerVariable("Besieged_Horde") == 1) then -- undead
        for id = Besieged.mobs[1].mobs_start,Besieged.mobs[1].mobs_end do 
            if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 20) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
	    end	
    elseif (GetServerVariable("Besieged_Horde") == 2) then -- Trolls
        for id = Besieged.mobs[2].mobs_start,Besieged.mobs[2].mobs_end do 
            if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 20) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
	    end	
    elseif (GetServerVariable("Besieged_Horde") == 3) then -- Mamool
        for id = Besieged.mobs[3].mobs_start,Besieged.mobs[3].mobs_end do 
            if (GetMobAction(id) ~= ACTION_NONE and GetMobAction(MobID) ~= ACTION_ATTACK) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 20) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
	    end			
	end
end;



function besiegedMobAggro(mob)
    -- Mobs will attack NPC's in range
    -- If the agro range is too short it will loop thru everything and error out on
	-- Qiqirn Mines which don't exist.  Keep the Agro Range WIDE!!!
	local randomfight = math.random(1,10) -- Will randomly agro an NPC if it is fighting    
        for id = Besieged.npcs[4].npc_start,Besieged.npcs[4].npc_end do 
		
		-- make random hrre to see if it will attack an npc that is already fighting
            if (GetMobAction(id) ~= ACTION_NONE) then  -- ID is up
			    if (mob:checkDistance(GetMobByID(id)) < 20) then
				    if ((GetMobAction(id) == 1) and (randomfight < 1)) then
	                    mob:addEnmity(GetMobByID(id),0,1);
					    break;
					elseif (GetMobAction(id) ~= 1) then
	                    mob:addEnmity(GetMobByID(id),0,1);
					    break;					
	                end
                end
		    end
		end
       -- for i,v in pairs(Besieged.npcs[5]) do
	     --   if (GetMobAction(v) ~= ACTION_NONE) then  -- ID is up
			--    if (mob:checkDistance(GetMobByID(v)) < 10) then
			  --      if ((GetMobAction(v) == 1) and (randomfight < 2)) then
	            --        mob:addEnmity(GetMobByID(v),0,1);
				  --      break;
				   -- elseif (GetMobAction(v) ~= 1) then
	                 --   mob:addEnmity(GetMobByID(v),0,1);
				       -- break;	
                   -- end	
               -- end			
	       -- end
	--	end
end;

function besiegedNPCCure(mob)
 
end;

function spawnGenerals(mob)
    local mihli = GetServerVariable("MihliCapture");
    local gadalar = GetServerVariable("GadalarCapture");
	local rughadjeen = GetServerVariable("RughadjeenCapture");
	local zazarg = GetServerVariable("ZazargCapture");
	local najelith = GetServerVariable("NajelithCapture");
	
	if (rughadjeen ~= 1) then
	    printf("Spawning Rughadjeen");
	    SpawnMob(16974135);
	end

	if (gadalar ~= 1) then
	    printf("Spawning Galadar");	
	    SpawnMob(16974136);
	end

	if (najelith ~= 1) then
	    printf("Spawning Najelith");	
	    SpawnMob(16974137);
	end

	if (zazarg ~= 1) then
	    printf("Spawning Zazarg");		
	    SpawnMob(16974138);
	end

	if (mihli ~= 1) then
	    printf("Spawning Mihli");		
	    SpawnMob(16974139);
	end	
	
	
	
end;

function randPath(mob)
    local randpath = math.random(1,8);
	return randpath;
end

function gotoAC(mob)

	    -- Check Location
	    local pos = mob:getPos();
        -- printf("Check Location");		
	    -- Quadrant 5
	    if (pos.x >= 17 and pos.z >= 17 and pos.z <= 62) then
	        mob:setLocalVar("PickPath",13);
			printf("Location Confirmed");
		    mob:setLocalVar("GoingToAC",2);
		end
		
		
		
		
		
		
		
		

end;


function undeadStrength(mob)
    local level = GetServerVariable("UndeadLevel");
	local hpboost = (10 * level) + 30;
	local attboost = (50 * level);
	local defboost = (80 * level);
	local accboost = (50 * level);
	local evaboost = (15 * level) + 30;
	
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(MOD_ATT,attboost);
	mob:addMod(MOD_DEF,defboost);
	mob:addMod(MOD_ACC,accboost);
	mob:addMod(MOD_EVA,evaboost);
    mob:addHP(19000);	
end

function trollStrength(mob)
    local level = GetServerVariable("TrollLevel");
	local hpboost = (10 * level) + 30;
	local attboost = (50 * level);
	local defboost = (80 * level);
	local accboost = (50 * level);
	local evaboost = (15 * level) + 30;
	local magicatk = (4 * level);
	
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(MOD_ATT,attboost);
	mob:addMod(MOD_DEF,defboost);
	mob:addMod(MOD_ACC,accboost);
	mob:addMod(MOD_EVA,evaboost);
	mob:addMod(MOD_MATT,magicatk);	
    mob:addHP(19000);	
end

function mamoolStrength(mob)
    local level = GetServerVariable("MamoolLevel");
	local hpboost = (10 * level) + 30;
	local attboost = (50 * level);
	local defboost = (80 * level);
	local accboost = (50 * level);
	local evaboost = (15 * level) + 30;
	local magicatk = (4 * level);
	
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(MOD_ATT,attboost);
	mob:addMod(MOD_DEF,defboost);
	mob:addMod(MOD_ACC,accboost);
	mob:addMod(MOD_EVA,evaboost);
	mob:addMod(MOD_MATT,magicatk);	
    mob:addHP(19000);	
end



function generalStrength(mob)
    local level = GetServerVariable("Consecutive_BWins");
	if (level == nil) then
	    level = 1;
	elseif (level < 3) then
	    level = 1;
	elseif (level >= 3) then
	    level = math.floor((level / 3) + 1);
	end
	
	printf("Level of strength of generals is %u",level);
	
	if (level >= 15) then 
	    level = 15;
	end
	
	local hpboost = (2 * level) + 40;
	local strboost = (25 * level) + 100;
	local attboost = (20 * level) + 375;
	local defboost = (35 * level) + 350;
	local accboost = (20 * level) + 30;
	local evaboost = (35 * level) + 95;
	local regain = (level * 10) + 20;
	local magicatk = (4 * level) + 50;
	
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(MOD_ATT,attboost);
	mob:addMod(MOD_DEF,defboost);
	mob:addMod(MOD_ACC,accboost);
	mob:addMod(MOD_EVA,evaboost);
    mob:addMod(MOD_REGAIN,regain);
    mob:addMod(MOD_STR,strboost);	
	mob:addMod(MOD_MATT,magicatk);	
	
end

function helperStrength(mob)
    local level = GetServerVariable("Consecutive_BWins");
	if (level == nil) then
	    level = 1;
	elseif (level < 3) then
	    level = 1;
	elseif (level >= 3) then
	    level = math.floor((level / 3) + 1);
	end
	

	
	if (level >= 15) then 
	    level = 15;
	end
	
	local hpboost = (2 * level) + 10;
	local strboost = (10 * level) + 50;
	local attboost = (20 * level) + 125;
	local defboost = (30 * level) + 120;
	local accboost = (20 * level) + 10;
	local evaboost = (20 * level) + 30;
	local regain = level;
	local magicatk = (4 * level) + 20;
	
	mob:addStatusEffect(EFFECT_MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(MOD_ATT,attboost);
	mob:addMod(MOD_DEF,defboost);
	mob:addMod(MOD_ACC,accboost);
	mob:addMod(MOD_EVA,evaboost);
    mob:addMod(MOD_REGAIN,regain);
    mob:addMod(MOD_STR,strboost);	
	mob:addMod(MOD_MATT,magicatk);	
	
end

function undeadVictory(mob,killer)
	-- killer:PrintToPlayer("UNDEAD VICTORY TRIGGERED");
    local level = GetServerVariable("UndeadLevel");
	local kills = GetServerVariable("UndeadKills");
	local timeout = GetServerVariable("UndeadTimeout");
	local win = 0;


	kills = kills + 1;
	SetServerVariable("UndeadKills",kills);
	if (level <= 4) then
	    win = 15;
	elseif (level > 4) then
        win = 20;	
	end
	
	printf("Current Undead Kills %u",kills);

	
	-- Find out if there is a Victory
	if ((kills == win) or (timeout == 1)) then
	    printf("Undead have Retreated!! Al Zahbi is Victorious!!");
		mob:PrintToServer("The Undead Swarm have retreated!",0x1C);
	    SetServerVariable("UndeadKills",0); -- Reset Undead Kills
		local consecwins = GetServerVariable("Consecutive_BWins");
		consecwins = consecwins + 1;
		SetServerVariable("Consecutive_BWins",consecwins);
	    SetServerVariable("Dead_Helpers",0);
	    -- Set Server Message
	    local players = mob:getZone():getPlayers();
	    for i, person in pairs(players) do
	        person:messageSpecial(UNDEAD_LOSE);
			person:delStatusEffect(EFFECT_BESIEGED);
			person:ChangeMusic(1, 178);
			person:ChangeMusic(2, 178);
		    local getcurepts = person:getVar("Besieged_Cure_Points");
			local getwspts = person:getVar("Besieged_WS_Points");
		    local gettotal = (math.floor(getcurepts / 10) + getwspts);
		    person:setVar("Besieged_Points",gettotal);	
		    person:PrintToPlayer("You gain "..gettotal.." Mercenary Points",0x1C);	
            -- Calculate Exp
			local mainlvl = person:getMainLvl();
			local rate = 0;
			if (mainlvl >= 75) then
			    rate = 1;
			elseif (mainlvl > 65) then
			    rate = 0.5;
			elseif (mainlvl > 50) then
			    rate = 0.3;
			else
			    rate = 0.1;
			end
            person:addExp(rate*gettotal);			
	    end	
		-- Despawn All Undead Mobs		
	    for i,v in pairs(BesiegeIDs.undeadmobs) do
		    DespawnMob(v);
	    end
		DespawnMob(16974025);
		DespawnMob(16974135);
		DespawnMob(16974136);
		DespawnMob(16974137);
		DespawnMob(16974138);
		DespawnMob(16974139);	
        -- Despawn All Bosses
        for i,v in pairs(BesiegeIDs.undeadboss) do
		    DespawnMob(v);
	    end       
		-- Make NPC's appear (Also need to set Music and CS here)
		for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
		    GetNPCByID(id):setStatus(0);
		end	
        -- Despawn all Helper NPCs
		for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
		    DespawnMob(helpers);
		end			
		SetServerVariable("Besieged_Horde",0);
		SetServerVariable("Undead_Horde_Status", 1000);
		-- Set The respawn time for the Lamia that controlls Undead Swarp
		GetMobByID(16974025):setRespawnTime(10800 + (1080 * level));
        SetServerVariable("UndeadStr",(10800 + (1080 * level)));
        local undeadrepoptime = GetServerVariable("UndeadStr");
        SetServerVariable("UndeadTimer",os.time() + undeadrepoptime);		
	    -- Increase undead level
		level = level + 1;
		-- cap level at 8
		if (level > 8) then
		    level = 8;
		end
		SetServerVariable("UndeadLevel",level);
	end	
end;

function trollLoss(mob,killer) -- Victory for Al Zahbi Loss for Trolls
	-- killer:PrintToPlayer("UNDEAD VICTORY TRIGGERED");
    local level = GetServerVariable("TrollLevel");
	local kills = GetServerVariable("TrollKills");
	local timeout = GetServerVariable("TrollTimeout");
	local win = 0;
	

	kills = kills + 1;
	SetServerVariable("TrollKills",kills);
	if (level <= 4) then
	    win = 15;
	elseif (level > 4) then
        win = 20;	
	end
	
	printf("Current Kills %u",kills);

	
	-- Find out if there is a Victory
	if ((kills == win) or (timeout == 1)) then
	    printf("Trolls have Retreated!! Al Zahbi is Victorious!!");
		mob:PrintToServer("The Troll Mercenaries have retreated!",0x1C);
	    SetServerVariable("TrollKills",0); -- Reset Undead Kills
		local consecwins = GetServerVariable("Consecutive_BWins");
		consecwins = consecwins + 1;
		SetServerVariable("Consecutive_BWins",consecwins);		
		SetServerVariable("Dead_Helpers",0);
	    -- Set Server Message
	    local players = mob:getZone():getPlayers();
	    for i, person in pairs(players) do
	        person:messageSpecial(TROLL_LOSE);
			person:delStatusEffect(EFFECT_BESIEGED);
			person:ChangeMusic(1, 178);
			person:ChangeMusic(2, 178);
		    local getcurepts = person:getVar("Besieged_Cure_Points");
			local getwspts = person:getVar("Besieged_WS_Points");
		    local gettotal = (math.floor(getcurepts / 10) + getwspts);
		    person:setVar("Besieged_Points",gettotal);	
		    person:PrintToPlayer("You gain "..gettotal.." Mercenary Points",0x1C);	
            -- Calculate Exp
			local mainlvl = person:getMainLvl();
			local rate = 0;
			if (mainlvl >= 75) then
			    rate = 1;
			elseif (mainlvl > 65) then
			    rate = 0.5;
			elseif (mainlvl > 50) then
			    rate = 0.3;
			else
			    rate = 0.1;
			end
            person:addExp(rate*gettotal);			
	    end	
		-- Despawn All Undead Mobs		
	    for i,v in pairs(BesiegeIDs.trollmobs) do
		    DespawnMob(v);
	    end
		-- Despawn Pop Mechanism Troll
		DespawnMob(16973930);	
		-- Depsanw Generals
		DespawnMob(16974135);
		DespawnMob(16974136);
		DespawnMob(16974137);
		DespawnMob(16974138);
		DespawnMob(16974139);	
        -- Despawn All Bosses
        for i,v in pairs(BesiegeIDs.trollboss) do
		    DespawnMob(v);
	    end       
		-- Make NPC's appear (Also need to set Music and CS here)
		for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
		    GetNPCByID(id):setStatus(0);
		end	
        -- Despawn all Helper NPCs
		for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
		    DespawnMob(helpers);
		end			
		SetServerVariable("Besieged_Horde",0);
		SetServerVariable("Troll_Horde_Status", 1000);
		-- Set The respawn time for the Troll that controlls Troll Mercenaries
		GetMobByID(16973930):setRespawnTime(10800 + (1080 * level));
        SetServerVariable("TrollStr",(10800 + (1080 * level)));
        local trollrepoptime = GetServerVariable("TrollStr");
        SetServerVariable("TrollTimer",os.time() + trollrepoptime);		
	    -- Increase Troll level
		level = level + 1;
		-- cap level at 8
		if (level > 8) then
		    level = 8;
		end
		SetServerVariable("TrollLevel",level);
	end	
end;


function mamoolLoss(mob,killer) -- Victory for Al Zahbi Loss for Mamool
	-- killer:PrintToPlayer("UNDEAD VICTORY TRIGGERED");
    local level = GetServerVariable("MamoolLevel");
	local kills = GetServerVariable("MamoolKills");
	local timeout = GetServerVariable("MamoolTimeout");
	local win = 0;
	

	kills = kills + 1;
	SetServerVariable("MamoolKills",kills);
	if (level <= 4) then
	    win = 15;
	elseif (level > 4) then
        win = 20;	
	end
	
	printf("Current Kills %u",kills);

	
	-- Find out if there is a Victory
	if ((kills == win) or (timeout == 1)) then
	    printf("The Mamool Ja Savages have Retreated!! Al Zahbi is Victorious!!");
		mob:PrintToServer("The Mamool Ja Savages have retreated!",0x1C);
	    SetServerVariable("MamoolKills",0); -- Reset Mamool Kills
		local consecwins = GetServerVariable("Consecutive_BWins");
		consecwins = consecwins + 1;
		SetServerVariable("Consecutive_BWins",consecwins);		
		SetServerVariable("Dead_Helpers",0);
	    -- Set Server Message
	    local players = mob:getZone():getPlayers();
	    for i, person in pairs(players) do
	        person:messageSpecial(TROLL_LOSE);
			person:delStatusEffect(EFFECT_BESIEGED);
			person:ChangeMusic(1, 178);
			person:ChangeMusic(2, 178);
		    local getcurepts = person:getVar("Besieged_Cure_Points");
			local getwspts = person:getVar("Besieged_WS_Points");
		    local gettotal = (math.floor(getcurepts / 10) + getwspts);
		    person:setVar("Besieged_Points",gettotal);	
		    person:PrintToPlayer("You gain "..gettotal.." Mercenary Points",0x1C);	
            -- Calculate Exp
			local mainlvl = person:getMainLvl();
			local rate = 0;
			if (mainlvl >= 75) then
			    rate = 1;
			elseif (mainlvl > 65) then
			    rate = 0.5;
			elseif (mainlvl > 50) then
			    rate = 0.3;
			else
			    rate = 0.1;
			end
            person:addExp(rate*gettotal);			
	    end	
		-- Despawn All Undead Mobs		
	    for i,v in pairs(BesiegeIDs.mamoolmobs) do
		    DespawnMob(v);
	    end
		-- Despawn Pop Mechanism Mamool
		DespawnMob(16973825);	
		-- Depsanw Generals
		DespawnMob(16974135);
		DespawnMob(16974136);
		DespawnMob(16974137);
		DespawnMob(16974138);
		DespawnMob(16974139);	
        -- Despawn All Bosses
        for i,v in pairs(BesiegeIDs.mamoolboss) do
		    DespawnMob(v);
	    end       
		-- Make NPC's appear (Also need to set Music and CS here)
		for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
		    GetNPCByID(id):setStatus(0);
		end	
        -- Despawn all Helper NPCs
		for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
		    DespawnMob(helpers);
		end			
		SetServerVariable("Besieged_Horde",0);
		SetServerVariable("Mamool_Horde_Status", 1000);
		-- Set The respawn time for the Mamool that controlls Troll Mercenaries
		GetMobByID(16973825):setRespawnTime(10800 + (1080 * level));
        SetServerVariable("MamoolStr",(10800 + (1080 * level)));
        local mamoolrepoptime = GetServerVariable("MamoolStr");
        SetServerVariable("MamoolTimer",os.time() + mamoolrepoptime);		
	    -- Increase Mamool level
		level = level + 1;
		-- cap level at 8
		if (level > 8) then
		    level = 8;
		end
		SetServerVariable("MamoolLevel",level);
	end	
end;











function undeadLoss(mob)  -- Victory for Undead (Should change to be more consistant)
    SetServerVariable("AC_Posession",2) -- Undead now has posession
	printf("Undead has taken the Astral Candy!!");
	mob:PrintToServer("The Undead Swarm have taken the Astral Candescence!",0x1C);
	SetServerVariable("Consecutive_BWins",0);
	SetServerVariable("Dead_Helpers",0);
	SetServerVariable("UndeadACKilled",0); -- Set AC mobs to 0 kills
	-- Spawn AC mobs
	
	-- Deter the besiged mobs from spawning
	DeterMob(16974025, true);  -- undead
	UpdateNMSpawnPoint(16974025);
	GetMobByID(16974025):setRespawnTime(345600);
	DeterMob(16973930, true);  -- Trolls?
	UpdateNMSpawnPoint(16973930);
	GetMobByID(16973930):setRespawnTime(345600);	
	DeterMob(16973825, true);  -- Mamool
	UpdateNMSpawnPoint(16973825);	
	GetMobByID(16973825):setRespawnTime(345600);	
	SetServerVariable("UndeadKills",0); -- Reset Undead Kills
	-- Set Server Message/Calculate Points
	local players = mob:getZone():getPlayers();
		

	for i, person in pairs(players) do
	    person:messageSpecial(UNDEAD_WIN);
		person:delStatusEffect(EFFECT_BESIEGED);		
		local getcurepts = person:getVar("Besieged_Cure_Points");
		local getwspts = person:getVar("Besieged_WS_Points");
		local getmagpts = person:getVar("Besieged_Mag_Points");
		local gettotal = (math.floor(getcurepts / 10) + getwspts + getmagpts);
		local bespoint = person:getVar("Besieged_Points");
		local mercpoint = person:getVar("Mercenary_Points");
		person:setVar("Besieged_Points",gettotal + bespoint);	
		person:setVar("Mercenary_Points",gettotal + mercpoint);
		local totalpts = gettotal + mercpoint;
		-- add cap based on rank
		person:PrintToPlayer("You gain "..gettotal.." Mercenary Points.  Total: "..totalpts.."",0x1C);			
	end
    -- Despawn All Undead Mobs
	for i,v in pairs(BesiegeIDs.undeadmobs) do
		DespawnMob(v);
	end
	-- Depsawn All Undead Bosses
	for i,v in pairs(BesiegeIDs.undeadboss) do
		DespawnMob(v);
	end	
    DespawnMob(16974025);
	DespawnMob(16974135);
	DespawnMob(16974136);
	DespawnMob(16974137);
	DespawnMob(16974138);
	DespawnMob(16974139);		
	-- Make NPC's appear (Also need to set Music and CS here)
	for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
	    GetNPCByID(id):setStatus(0);
	end	
    -- Despawn all Helper NPCs
	for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
	    DespawnMob(helpers);
	end			
	SetServerVariable("Besieged_Horde",0);
	SetServerVariable("Undead_Horde_Status", 1000);
	-- Despawn Astral Candy (astral plinth)
    local npc = GetNPCByID(16974245); 
    npc:setStatus(STATUS_DISAPPEAR);
    -- Set Mirrors in Arrapago's HP
    SetServerVariable("[AR]Mirror1",1200000);
    SetServerVariable("[AR]Mirror2",1200000);
    SetServerVariable("[AR]Mirror3",1200000);	
	-- Spawn the 3 Mirros in Arrapago	
	SpawnMob(16998838);
	SpawnMob(16998839);
	SpawnMob(16998840);	
	-- Spawn Achieve Master
	local achieve = GetNPCByID(16998895);
	achieve:setStatus(STATUS_NORMAL);
	-- Spawn BLU Helper
	DeterMob(16999067, false);	
	SpawnMob(16999067);
	-- Spawn Teleport
	-- Make Teleport NPC
	-- Hardcode the enemy forces so it doesn't increase
    local level = GetServerVariable("UndeadLevel");
	local undeadForces = 100 + (level * 10) + 10;
	SetServerVariable("Undead_Forces",undeadForces);
end

function trollVictory(mob)  -- Victory for Trolls
    SetServerVariable("AC_Posession",3) -- Trolls now have posession
	printf("The Troll Mercenaries have taken the Astral Candy!!");
	mob:PrintToServer("The Troll Mercenaries have taken the Astral Candescence!",0x1C);	
	SetServerVariable("Consecutive_BWins",0);	
	SetServerVariable("Dead_Helpers",0);
	SetServerVariable("TrollACKilled",0); -- Set AC mobs to 0 kills
	-- Spawn AC mobs
	
	-- Deter the besiged mobs from spawning
	DeterMob(16974025, true);  -- undead
	UpdateNMSpawnPoint(16974025);
	GetMobByID(16974025):setRespawnTime(345600);
	DeterMob(16973930, true);  -- Trolls?
	UpdateNMSpawnPoint(16973930);
	GetMobByID(16973930):setRespawnTime(345600);	
	DeterMob(16973825, true);  -- Mamool
	UpdateNMSpawnPoint(16973825);	
	GetMobByID(16973825):setRespawnTime(345600);	
	SetServerVariable("TrollKills",0); -- Reset Undead Kills
	-- Set Server Message/Calculate Points
	local players = mob:getZone():getPlayers();
		

	for i, person in pairs(players) do
	    person:messageSpecial(TROLL_WIN);
		person:delStatusEffect(EFFECT_BESIEGED);		
		local getcurepts = person:getVar("Besieged_Cure_Points");
		local getwspts = person:getVar("Besieged_WS_Points");
		local getmagpts = person:getVar("Besieged_Mag_Points");
		local gettotal = (math.floor(getcurepts / 10) + getwspts + getmagpts);
		local bespoint = person:getVar("Besieged_Points");
		local mercpoint = person:getVar("Mercenary_Points");
		local bescap = person:getVar("Besieged_Cap");
		
		local totalmerc = gettotal + mercpoint;
		if (totalmerc > 25000) then
		    totalmerc = 25000;
		end
		
		local getbes = gettotal / 2;  -- Total besieged points.  Should be half of Merc Point
		local totalbes = getbes + bespoint; -- Get total points along with current points
		if (totalbes > bescap) then  -- set points given based on cap
		    totalbes = bescap;
		end
	   	
		person:setVar("Besieged_Points",totalbes);	
		person:setVar("Mercenary_Points",totalmerc);

		-- add cap based on rank
		person:PrintToPlayer("You gain "..gettotal.." Mercenary Points.  Total: "..totalmerc.."",0x1C);	
		person:PrintToPlayer("You gain "..getbes.." Besieged Points.  Total: "..totalbes.."",0x1C);			
	end
    -- Despawn All Undead Mobs
	for i,v in pairs(BesiegeIDs.trollmobs) do
		DespawnMob(v);
	end
	-- Depsawn All Undead Bosses
	for i,v in pairs(BesiegeIDs.trollboss) do
		DespawnMob(v);
	end	
    DespawnMob(16973930);
	-- Depsawn Generals
	DespawnMob(16974135);
	DespawnMob(16974136);
	DespawnMob(16974137);
	DespawnMob(16974138);
	DespawnMob(16974139);		
	-- Make NPC's appear (Also need to set Music and CS here)
	for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
	    GetNPCByID(id):setStatus(0);
	end	
    -- Despawn all Helper NPCs
	for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
	    DespawnMob(helpers);
	end			
	SetServerVariable("Besieged_Horde",0);
	SetServerVariable("Undead_Horde_Status", 1000);
	-- Despawn Astral Candy (astral plinth)
    local npc = GetNPCByID(16974245); 
    npc:setStatus(STATUS_DISAPPEAR);
    -- Set Mirrors in Halvung's HP
    SetServerVariable("[HA]Mirror1",1200000);
    SetServerVariable("[HA]Mirror2",1200000);
    SetServerVariable("[HA]Mirror3",1200000);	
	-- Spawn the 3 Mirros in Arrapago	
	SpawnMob(17031568);
	SpawnMob(17031569);
	SpawnMob(17031570);
	-- Spawn Achieve Master
	local achieve = GetNPCByID(17031612);
	achieve:setStatus(STATUS_NORMAL);
	-- Spawn BLU Helper
	DeterMob(17031741, false);	
	SpawnMob(17031741);
	-- Spawn Teleport
	-- Make Teleport NPC
	-- Hardcode the enemy forces so it doesn't increase
    local level = GetServerVariable("TrollLevel");
	local trollForces = 100 + (level * 10) + 10;
	SetServerVariable("Troll_Forces",trollForces);
end



function mamoolVictory(mob)  -- Victory for Trolls
    SetServerVariable("AC_Posession",4) -- Trolls now have posession
	printf("The Mamool Ja Savages have taken the Astral Candy!!");
	mob:PrintToServer("The Mamool Ja Savages have taken the Astral Candescence!",0x1C);	
	SetServerVariable("Consecutive_BWins",0);	
	SetServerVariable("Dead_Helpers",0);
	SetServerVariable("TrollACKilled",0); -- Set AC mobs to 0 kills
	-- Spawn AC mobs
	
	-- Deter the besiged mobs from spawning
	DeterMob(16974025, true);  -- undead
	-- UpdateNMSpawnPoint(16974025);
	GetMobByID(16974025):setRespawnTime(345600);
	DeterMob(16973930, true);  -- Trolls?
	-- UpdateNMSpawnPoint(16973930);
	GetMobByID(16973930):setRespawnTime(345600);	
	DeterMob(16973825, true);  -- Mamool
	-- UpdateNMSpawnPoint(16973825);	
	GetMobByID(16973825):setRespawnTime(345600);	
	SetServerVariable("MamoolKills",0); -- Reset Undead Kills
	-- Set Server Message/Calculate Points
	local players = mob:getZone():getPlayers();
		

	for i, person in pairs(players) do
	    person:messageSpecial(TROLL_WIN);
		person:delStatusEffect(EFFECT_BESIEGED);		
		local getcurepts = person:getVar("Besieged_Cure_Points");
		local getwspts = person:getVar("Besieged_WS_Points");
		local getmagpts = person:getVar("Besieged_Mag_Points");
		local gettotal = (math.floor(getcurepts / 10) + getwspts + getmagpts);
		local bespoint = person:getVar("Besieged_Points");
		local mercpoint = person:getVar("Mercenary_Points");
		local pointcap = person:getVar("Besieged_Cap");

		person:setVar("Besieged_Points",gettotal + bespoint);	
		person:setVar("Mercenary_Points",gettotal + mercpoint);
		local totalpts = gettotal + mercpoint;
		
		
		-- add cap based on rank
		
		
		person:PrintToPlayer("You gain "..gettotal.." Mercenary Points.  Total: "..totalpts.."",0x1C);			
	end
    -- Despawn All Mamool Mobs
	for i,v in pairs(BesiegeIDs.mamoolmobs) do
		DespawnMob(v);
	end
	-- Depsawn All Mamool Bosses
	for i,v in pairs(BesiegeIDs.mamoolboss) do
		DespawnMob(v);
	end	
    DespawnMob(16973825);
	-- Depsawn Generals
	DespawnMob(16974135);
	DespawnMob(16974136);
	DespawnMob(16974137);
	DespawnMob(16974138);
	DespawnMob(16974139);		
	-- Make NPC's appear (Also need to set Music and CS here)
	for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
	    GetNPCByID(id):setStatus(0);
	end	
    -- Despawn all Helper NPCs
	for helpers = Besieged.npcs[2].npc_start,Besieged.npcs[2].npc_end do 
	    DespawnMob(helpers);
	end			
	SetServerVariable("Besieged_Horde",0);
	SetServerVariable("Mamool_Horde_Status", 1000);
	-- Despawn Astral Candy (astral plinth)
    local npc = GetNPCByID(16974245); 
    npc:setStatus(STATUS_DISAPPEAR);
    -- Set Mirrors in Halvung's HP
    SetServerVariable("[MA]Mirror1",1200000);
    SetServerVariable("[MA]Mirror2",1200000);
    SetServerVariable("[MA]Mirror3",1200000);	
	-- Spawn the 3 Mirros in Mamook	
	SpawnMob(17043847);
	SpawnMob(17043848);
	SpawnMob(17043849);
	-- Spawn Achieve Master
	local achieve = GetNPCByID(17043919);
	achieve:setStatus(STATUS_NORMAL);
	-- Spawn BLU Helper
	DeterMob(17044059, false);	
	SpawnMob(17044059);
	-- Spawn Teleport
	-- Make Teleport NPC
	-- Hardcode the enemy forces so it doesn't increase
    local level = GetServerVariable("MamoolLevel");
	local mamoolForces = 100 + (level * 10) + 10;
	SetServerVariable("Mamool_Forces",mamoolForces);
end







function besiegedCurePoints(caster,final)
    local besieged = GetServerVariable("Besieged_Horde");
	printf("Besieged horde is %u",besieged);
    local zones = caster:getZone();
	local cap = 0;
	local curepts = caster:getVar("Besieged_Cure_Points");
	local finalpoints = 0;
	-- printf("Obtained Cure Points for variable: %u",curepts);
	-- find caps and then apply
    if (besieged > 0) then
	    if (caster:hasKeyItem(CAPTAIN_WILDCAT_BADGE) == true) then
            cap = 2200;
		elseif (caster:hasKeyItem(FL_WILDCAT_BADGE) == true) then
		    cap = 1800;
		elseif (caster:hasKeyItem(SL_WILDCAT_BADGE) == true) then
		    cap = 1600;	
		elseif (caster:hasKeyItem(CS_WILDCAT_BADGE) == true) then
		    cap = 1400;
		elseif (caster:hasKeyItem(SM_WILDCAT_BADGE) == true) then
		    cap = 1000;	
		elseif (caster:hasKeyItem(S_WILDCAT_BADGE) == true) then
		    cap = 800;			
		elseif (caster:hasKeyItem(C_WILDCAT_BADGE) == true) then
		    cap = 600;	
		elseif (caster:hasKeyItem(LC_WILDCAT_BADGE) == true) then
		    cap = 400;
		elseif (caster:hasKeyItem(SP_WILDCAT_BADGE) == true) then
		    cap = 300;
		elseif (caster:hasKeyItem(PFC_WILDCAT_BADGE) == true) then
		    cap = 200;			
        end
		
		local points = final / 50;
		-- printf("Here are your points %u",points);
		finalpoints = points + curepts;
		if (curepts >= cap) then
		   curepts = cap;
		end

        -- printf("Finished Curepoints is: %u",curepts);
		caster:setVar("Besieged_Cure_Points",finalpoints);
	end	
		
		
end

function besiegedWSPoints(attacker,finaldmg)
    local besieged = GetServerVariable("Besieged_Horde");
	local cap = 0;
	local wspts = attacker:getVar("Besieged_WS_Points");
	local finalpoints = 0;
	-- printf("Obtained Cure Points for variable: %u",curepts);
	-- find caps and then apply
    if (besieged > 0 and attacker:hasStatusEffect(EFFECT_BESIEGED) == true) then
	    printf("Calcualte WS pts is %u",besieged);
	    if (attacker:hasKeyItem(CAPTAIN_WILDCAT_BADGE) == true) then
            cap = 3000;
		elseif (attacker:hasKeyItem(FL_WILDCAT_BADGE) == true) then
		    cap = 2500;
		elseif (attacker:hasKeyItem(SL_WILDCAT_BADGE) == true) then
		    cap = 2100;	
		elseif (attacker:hasKeyItem(CS_WILDCAT_BADGE) == true) then
		    cap = 1800;
		elseif (attacker:hasKeyItem(SM_WILDCAT_BADGE)== true) then
		    cap = 1600;	
		elseif (attacker:hasKeyItem(S_WILDCAT_BADGE) == true) then
		    cap = 1200;			
		elseif (attacker:hasKeyItem(C_WILDCAT_BADGE) == true) then
		    cap = 1000;	
		elseif (attacker:hasKeyItem(LC_WILDCAT_BADGE) == true) then
		    cap = 700;
		elseif (attacker:hasKeyItem(SP_WILDCAT_BADGE) == true) then
		    cap = 500;
		elseif (attacker:hasKeyItem(PFC_WILDCAT_BADGE) == true) then
		    cap = 400;			
        end
		
		local points = finaldmg / 10;
		-- printf("Here are your points %u",points);
	
		finalpoints = points + wspts;
		if (finalpoints >= cap) then
		   finalpoints = cap;
		end	

        printf("Finished WS is: %u",finalpoints);
		attacker:setVar("Besieged_WS_Points",finalpoints);
	end	
		
		
end