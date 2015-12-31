-----------------------------------
-- Area: Ferretory
-- NPC: Suibhne
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local aura = player:getVar("FerretoryAura");
local plvl = player:getMainLvl();

if (player:getVar("FerretoryAura") == 0) and (plvl > 9) then -- check for ferretory aura if it is 0 start the initial quest
	player:PrintToPlayer("NPC : Hey, I don't sense an aura on you.  If you do some tasks for me, your aura will increase", 0xD);
	player:setVar("FerretoryQuest1",1); -- enable the quest
	player:setVar("FerretoryPlantoid",15); -- set the quest monster number needed to defeat
	end
	
if (player:getVar("FerretoryQuest1") == 1) then
	player:PrintToPlayer("Maccus : Defeat 15 experience yielding plantoid monsters and report back to me", 0xD);  -- give the task for the quest
	end
	
if (player:getVar("FerretoryPlantoidComplete") == 1) then
    player:PrintToPlayer("Maccus : You've done well!  I feel your Aura getting stronger", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",2);
	player:setVar("FerretoryAura",1);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("You are now able to collect Infamy Points", 0x15);
	player:setVar("infamy",1);
	player:setVar("FerretoryMageBoon",1); 
	player:setVar("FerretoryMeleeBoon",1); 
	player:setVar("FerretoryTankBoon",1); 
	player:setVar("FerretoryPetBoon",1);  
	end
	
	
	---------------- Start Ferretory Quest #2 -------------------
	if (player:getVar("FerretoryAura") == 1) and (plvl > 19) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 30 experience yielding lizard monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",2); -- enable the quest
	player:setVar("FerretoryPlantoid",30); -- set the quest monster number needed to defeat
	end
	
	if (player:getVar("FerretoryPlantoidComplete") == 2) then
    player:PrintToPlayer("Maccus : You've done well!  I feel your Aura getting stronger", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",3);
	player:setVar("FerretoryAura",2);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);

    end
	
	
	
	---------------- Start Ferretory Quest #3 -------------------
	if (player:getVar("FerretoryAura") == 2) and (plvl > 29) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 50 experience yielding bird type monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",3); -- enable the quest
	player:setVar("FerretoryPlantoid",50); -- set the quest monster number needed to defeat
	end
	
	if (player:getVar("FerretoryPlantoidComplete") == 3) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura isn't so weak now", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",4);
	player:setVar("FerretoryAura",3);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);

    end
	
	
	
		---------------- Start Ferretory Quest #4 -------------------
	if (player:getVar("FerretoryAura") == 3) and (plvl > 39) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 75 experience yielding beast type monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",4); -- enable the quest
	player:setVar("FerretoryPlantoid",75); -- set the quest monster number needed to defeat
	end
	
	if (player:getVar("FerretoryPlantoidComplete") == 4) then
    player:PrintToPlayer("Maccus : You've done well!  Keep up the hard work", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",5);
	player:setVar("FerretoryAura",4);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);

    end
	
	
			---------------- Start Ferretory Quest #5 -------------------
	if (player:getVar("FerretoryAura") == 4) and (plvl > 49) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 100 experience yielding Beastmen and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",5); -- enable the quest
	player:setVar("FerretoryPlantoid",100); -- set the quest monster number needed to defeat
	end
	
	if (player:getVar("FerretoryPlantoidComplete") == 5) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura is strong now!", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",6);
	player:setVar("FerretoryAura",5);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);

    end
	
			---------------- Start Ferretory Quest #6 -------------------
	if (player:getVar("FerretoryAura") == 5) and (plvl > 59) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 125 experience yielding Arcana and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",6); -- enable the quest
	player:setVar("FerretoryPlantoid",125); -- set the quest monster number needed to defeat
	end
	
	if (player:getVar("FerretoryPlantoidComplete") == 6) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura is strong now!", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",7);
	player:setVar("FerretoryAura",6);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);

    end	
	
	
			---------------- Start Ferretory Quest #7 -------------------
	if (player:getVar("FerretoryAura") == 6) and (plvl > 69) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 150 experience yielding Undead and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",7); -- enable the quest
	player:setVar("FerretoryPlantoid",150); -- set the quest monster number needed to defeat
	end
	
	if (player:getVar("FerretoryPlantoidComplete") == 7) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura is strong now!", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryQuest1",8);
	player:setVar("FerretoryAura",7);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);

    end		
	
	
	
	
	
	
	
	
	
	
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



