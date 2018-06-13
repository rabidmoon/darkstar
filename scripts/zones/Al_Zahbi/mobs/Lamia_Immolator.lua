-----------------------------------
-- Area: Lamia Controlls Spawns
-- NPC:  Lamia Immolator
-- Throne room volker npc bastok mission 9-2
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/besiegedhelper");
local BesiegeIDs = require("scripts/zones/Al_Zahbi/BesiegeIDs");
local Besieged = require("scripts/zones/Al_Zahbi/IDs");


function onMobInitialize(mob)
    mobID = mob:getID();
	-- Determine if other Besieged is happening if so despawn and reset timer
	local rand = math.random(1,4);
	if (mobID == 16974025) then
	    mob:setLocalVar("undeadSpawn", os.time() + 45);
        mob:setLocalVar("index",1);
		mob:setPos(-91,10,57);
	end
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mobID = mob:getID();
	local rand = randPath(mob);	
	if (mobID == 16974025) then
	   	if (GetServerVariable("Besieged_Horde") > 0) then 			
	        printf("DELAY UNDEAD BESIEGED BY 10 MINUTES");
		    DespawnMob(16974025);
		    GetMobByID(16974025):setRespawnTime(600);
			SetServerVariable("UndeadTimer",os.time() + 600);	
	    else
		    mob:PrintToServer("The Undead Swarm has begun their attack on Al Zahbi!",0x1C);
	        printf("LAMIA HAS JUST POPPED!!!");
	        SetServerVariable("Besieged_Timer", os.time() + 3600) -- Set besieged to 1 hour 3600
	       --  mob:setBehaviour(BEHAVIOUR_AGGRO_AMBUSH);
            mob:untargetable(true);
	        -- mob:hideModel(true);
			mob:hideName(true);
			SetServerVariable("UndeadTimeout", 0); -- Set Timeout to 0
			SetServerVariable("UndeadKills",0); -- Reset Undead Kills	
			local level = GetServerVariable("UndeadLevel");	
			printf("UNDEAD BESIEGED HAS STARTED!!")
			printf("Level: %u",level);	
			if (level <= 4) then
				printf("Kills needed for win: 35");	
			elseif (level > 4) then
				printf("Kills needed for win: 50");	
			end		
			local totalcaptured = 0;
			local genm = GetServerVariable("MihliCapture"); 
			local genr = GetServerVariable("RughadjeenCapture");
			local genz = GetServerVariable("ZazargCapture");
			local genn = GetServerVariable("NajelithCapture");
			local geng = GetServerVariable("GadalarCapture");
			totalcaptured = genm + genr + genz + genn + geng;
			SetServerVariable("Generals_Captured",totalcaptured);
			local generalsavail = 5 - totalcaptured;	
			printf("Generals Available: %u",generalsavail);			
			-- Set Server Message/Change Music
			local players = mob:getZone():getPlayers();
			for i, person in pairs(players) do
				person:messageSpecial(BESIEGED_START);
				person:addStatusEffect(EFFECT_BESIEGED,3,0,3600);
				person:ChangeMusic(1, 142);
				person:ChangeMusic(2, 142);
				person:PrintToPlayer("Generals Available: "..generalsavail.."",0x1C);
			end			
			mob:setLocalVar("undeadSpawn", os.time() + 30);  -- 5 Minutes Advancing
			SetServerVariable("Undead_Horde_Status", os.time() + 30);
			mob:setLocalVar("index",1);	
			mob:setLocalVar("Boss_POP",0);		
			SetServerVariable("Besieged_Horde",1);
			mob:setLocalVar("roamTime", os.time());
			for id = Besieged.npcs[1].npc_start,Besieged.npcs[1].npc_end do 
		    -- Despawn All Regular NPC's
				GetNPCByID(id):setStatus(3);
			end
			for helpers = Besieged.npcs[4].npc_start,Besieged.npcs[4].npc_end do 
		        -- Spawn Helper NPCS
			    SpawnMob(helpers);
			end	
			for i,v in pairs(Besieged.npcs[5]) do
			    SpawnMob(v);
			end
			spawnGenerals(mob) -- Spawn Generals
        end			
	else
    	undeadStrength(mob)			
	    mob:setLocalVar("roamTime", os.time());
        mob:setLocalVar("PickPath",rand);	
	    mob:setLocalVar("GoingToAC",1);		
        onMobRoam(mob);
	end


end;

function onMobEngaged(mob, target)
end;

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

end;


function onPath(mob)
    mobID = mob:getID();
	if (mobID ~= 16974025) then
	    besiegedMobAggro(mob)
		local randpath = mob:getLocalVar("PickPath");
        local roamTime = mob:getLocalVar("roamTime");
        if (os.time() - roamTime > 2) then
            pathfind.patrol(mob, Besieged.mobpath[randpath], PATHFLAG_NONE);
	        mob:setLocalVar("roamTime", os.time());
	    end
    else
	    local roamTime = mob:getLocalVar("roamTime");
        if (os.time() - roamTime > 2) then
            pathfind.patrol(mob, Besieged.mobpath[1], PATHFLAG_NONE);
	        mob:setLocalVar("roamTime", os.time());
	    end	
	end		
end;



function onMobRoamAction(mob)



end


function onMobRoam(mob)
    mobID = mob:getID();
	local level = GetServerVariable("UndeadLevel");
	local spawns = 0;
	local bosspop = mob:getLocalVar("Boss_POP");
    local move = mob:getLocalVar("GoingToAC");
	local randpath = mob:getLocalVar("PickPath");	

	local captured = GetServerVariable("Generals_Captured");
	local pos = mob:getPos();   
	
	if (level <= 4) then
	    spawns = 50;
	else
	    spawns = 79;
    end
	
	if (mobID == 16974025) then
	    -- printf("Main Immolator Moving");
        local poptime = mob:getLocalVar("undeadSpawn");
	    local index = mob:getLocalVar("index");
		local timer = GetServerVariable("Besieged_Timer");
        
        if (os.time() - poptime > 6 and index == 1) then
            SpawnMob(BesiegeIDs.undeadmobs[index]);
		    index = index + 1;
            mob:setLocalVar("undeadSpawn", os.time());
            mob:setLocalVar("index",index);	
	        -- Set Server Message
	        local players = mob:getZone():getPlayers();
	        for i, person in pairs(players) do
	            person:messageSpecial(UNDEAD_START);				
	        end			
        elseif (os.time() - poptime > 6 and index <= spawns) then
		    printf("Spawning Besieged Mob: %u",index);
            SpawnMob(BesiegeIDs.undeadmobs[index]);
		    index = index + 1;
            mob:setLocalVar("undeadSpawn", os.time());
            mob:setLocalVar("index",index);
        end	
		
		if (os.time() >= timer) then -- end besieged
		    SetServerVariable("UndeadTimeout", 1);
			printf("Undead have retreated due to timeout");
		    undeadVictory(mob,killer)
		end
		
		-- Handle Boss pop
		if (index > spawns and bosspop ~= 1) then
		    if (level == 1) then
			    if (GetMobAction(BesiegeIDs.undeadboss[1]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[1]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end
			elseif (level == 2) then
			    if (GetMobAction(BesiegeIDs.undeadboss[2]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[2]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end
			elseif (level == 3) then
			    if (GetMobAction(BesiegeIDs.undeadboss[3]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[3]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 4) then
			    if (GetMobAction(BesiegeIDs.undeadboss[4]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[4]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 5) then
			    if (GetMobAction(BesiegeIDs.undeadboss[5]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[5]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 6) then
			    if (GetMobAction(BesiegeIDs.undeadboss[6]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[6]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 7) then
			    if (GetMobAction(BesiegeIDs.undeadboss[7]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[7]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 8) then
			    if (GetMobAction(BesiegeIDs.undeadboss[8]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[8]);
				elseif (GetMobAction(BesiegeIDs.undeadboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.undeadboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end				
		    end
		end
		
		
		
       -- if (mob:isFollowingPath() == false) then
         --   mob:pathThrough(pathfind.first(Besieged.mobpath[1]), PATHFLAG_NONE);
       -- end		
    else
    if ((captured == 5 and move == 1) or (GetServerVariable("Dead_Helpers") > 30 and move == 1)) then
	        -- printf("Generals are captured");
		    mob:clearPath();
	        gotoAC(mob);
        elseif (pos.x >= 77 and pos.z > 118) then
	        undeadLoss(mob)		
        end		
        if (mob:isFollowingPath() == false) then
		    local randpath = mob:getLocalVar("PickPath");
            mob:pathThrough(pathfind.first(Besieged.mobpath[randpath]), PATHFLAG_NONE);
        end
	    besiegedMobAggro(mob)
	end	
  	
end;

