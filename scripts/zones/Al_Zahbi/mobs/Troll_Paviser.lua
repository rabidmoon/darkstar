-----------------------------------
-- Area: Troll_Paviser Controlls Spawns
-- NPC:  Troll_Paviser
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/besiegedhelper");
local BesiegeIDs = require("scripts/zones/Al_Zahbi/BesiegeIDs");
local Besieged = require("scripts/zones/Al_Zahbi/IDs");


function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ROAM_DISTANCE, 10);
	mob:setMobMod(MOBMOD_NO_DESPAWN, 1);
    mob:addStatusEffect(EFFECT_NO_REST,3,0,3600);
    mobID = mob:getID();
	local rand = math.random(1,4);
	if (mobID == 16973930) then
	    mob:setLocalVar("trollSpawn", os.time() + 45);
        mob:setLocalVar("index",1);
		
	end
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mobID = mob:getID();
	local rand = randPath(mob);	
	if (mobID == 16973930) then
	   	if (GetServerVariable("Besieged_Horde") > 0) then 			
	        printf("DELAY TROLL BESIEGED BY 10 MINUTES");
		    DespawnMob(16973930);
		    GetMobByID(16973930):setRespawnTime(600);
			SetServerVariable("TrollTimer",os.time() + 600);				
	    else	
        	printf("TROLL HAS JUST POPPED!!!");
			SetServerVariable("Besieged_Timer", os.time() + 3600) -- Set besieged to 1 hour 3600
		    --  mob:setBehaviour(BEHAVIOUR_AGGRO_AMBUSH);
			mob:untargetable(true);
			-- mob:hideModel(true);
			mob:hideName(true);
			SetServerVariable("TrollTimeout", 0); -- Set Timeout to 0
			SetServerVariable("TrollKills",0); -- Reset Troll Kills	
			local level = GetServerVariable("TrollLevel");	
			printf("TROLL MERCENARIES BESIEGED HAS STARTED!!")
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
			mob:setLocalVar("trollSpawn", os.time() + 30);  -- 5 Minutes Advancing
			SetServerVariable("Troll_Mercenaries_Status", os.time() + 30);
			mob:setLocalVar("index",1);	
			mob:setLocalVar("Boss_POP",0);		
			SetServerVariable("Besieged_Horde",2);
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
    	trollStrength(mob)			
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
    trollLoss(mob,killer);
end;


function onPath(mob)
    mobID = mob:getID();
	if (mobID ~= 16973930) then
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
	local level = GetServerVariable("TrollLevel");
	local spawns = 0;
	local bosspop = mob:getLocalVar("Boss_POP");
    local move = mob:getLocalVar("GoingToAC");
	local randpath = mob:getLocalVar("PickPath");	

	local captured = GetServerVariable("Generals_Captured");
	local pos = mob:getPos();   
	
	if (level <= 4) then
	    spawns = 50;  -- Change later when addding more
	else
	    spawns = 78;
    end
	
	if (mobID == 16973930) then
	    -- printf("Main Immolator Moving");
        local poptime = mob:getLocalVar("trollSpawn");
	    local index = mob:getLocalVar("index");
		local timer = GetServerVariable("Besieged_Timer");
        
        if (os.time() - poptime > 6 and index == 1) then
            SpawnMob(BesiegeIDs.trollmobs[index]);
		    index = index + 1;
            mob:setLocalVar("trollSpawn", os.time());
            mob:setLocalVar("index",index);	
	        -- Set Server Message
	        local players = mob:getZone():getPlayers();
	        for i, person in pairs(players) do
	            person:messageSpecial(TROLL_START);				
	        end			
        elseif (os.time() - poptime > 6 and index <= spawns) then
		    printf("Spawning Troll Besieged Mob: %u",index);
            SpawnMob(BesiegeIDs.trollmobs[index]);
		    index = index + 1;
            mob:setLocalVar("trollSpawn", os.time());
            mob:setLocalVar("index",index);
        end	
		
		if (os.time() >= timer) then -- end besieged
		    SetServerVariable("TrollTimeout", 1);
			printf("Troll Mercenaries have retreated due to timeout");
		    trollLoss(mob,killer)
		end
		
		-- Handle Boss pop
		if (index > spawns and bosspop ~= 1) then
		    if (level == 1) then
			    if (GetMobAction(BesiegeIDs.trollboss[1]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[1]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end
			elseif (level == 2) then
			    if (GetMobAction(BesiegeIDs.trollboss[2]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[2]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end
			elseif (level == 3) then
			    if (GetMobAction(BesiegeIDs.trollboss[3]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[3]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 4) then
			    if (GetMobAction(BesiegeIDs.trollboss[4]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[4]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 5) then
			    if (GetMobAction(BesiegeIDs.trollboss[5]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[5]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 6) then
			    if (GetMobAction(BesiegeIDs.trollboss[6]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[6]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 7) then
			    if (GetMobAction(BesiegeIDs.trollboss[7]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[7]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
					mob:setLocalVar("Boss_POP",1);
		        end		
			elseif (level == 8) then
			    if (GetMobAction(BesiegeIDs.trollboss[8]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[8]);
				elseif (GetMobAction(BesiegeIDs.trollboss[9]) == 0) then
				    SpawnMob(BesiegeIDs.trollboss[9]);
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
	        trollVictory(mob)		
        end		
        if (mob:isFollowingPath() == false) then
		    local randpath = mob:getLocalVar("PickPath");
            mob:pathThrough(pathfind.first(Besieged.mobpath[randpath]), PATHFLAG_NONE);
        end
	    besiegedMobAggro(mob)
	end	
  	
end;

