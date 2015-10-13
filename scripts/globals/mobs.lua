-----------------------------------
--
--
--
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/conquest");
require("scripts/globals/status");

-----------------------------------
--
-----------------------------------

-- function onMobDeathEx(mob, killer, isKillShot, killType)
function onMobDeathEx(mob, killer, isKillShot, isWeaponSkillKill)
	-- DRK quest - Blade Of Darkness
	local BladeofDarkness = killer:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
	local BladeofDeath = killer:getQuestStatus(BASTOK, BLADE_OF_DEATH);
	local ChaosbringerKills = killer:getVar("ChaosbringerKills");
	local mobfamily = mob:getSystem();
    local lvldif = (mob:getMainLvl() - killer:getMainLvl());
    local kill = killer:getVar("FerretoryPlantoid");
	local job = killer:getMainJob();
	local ferretoryblmquest = killer:getVar("FerretoryBLM"); -- turns quest on
	local ferretoryblmkills = killer:getVar("FerretoryBLMkills"); -- sets kill number
	local multiplier = 0;
	local infamy = killer:getVar("Infamy");
	local playerlvl = killer:getMainLvl();
	local moblvl = mob:getMainLvl();



	
		
	
	
	if (BladeofDarkness == QUEST_ACCEPTED or BladeofDeath == QUEST_ACCEPTED) then
		if (killer:getEquipID(SLOT_MAIN) == 16607 and isKillShot == true and isWeaponSkillKill == false) then
			if (ChaosbringerKills < 200) then
				killer:setVar("ChaosbringerKills", ChaosbringerKills + 1);
			end
		end
	end

	if (killer:getCurrentMission(WINDURST) == A_TESTING_TIME) then
		if (killer:hasCompletedMission(WINDURST,A_TESTING_TIME) and killer:getZoneID() == 118) then
			killer:setVar("testingTime_crea_count",killer:getVar("testingTime_crea_count") + 1);
		elseif (killer:hasCompletedMission(WINDURST,A_TESTING_TIME) == false and killer:getZoneID() == 117) then
			killer:setVar("testingTime_crea_count",killer:getVar("testingTime_crea_count") + 1);
		end
	end
	
	--//TODO create a calculator based on level.  Replace the < # with a number that determines the level difference based on level.  If player level < 75 difference is 15.  If it is greater than 74 then it is 44?
	
	-------------------- Ferretory Quest #1 -----------------------
	
	if (mobfamily == 17) and (killer:getVar("FerretoryQuest1") == 1) and (mob:checkBaseExp()) then  -- check for plantoid, check if quest is active, and check if the level difference is less than 10
		if  (killer:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		killer:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		kill = killer:getVar("FerretoryPlantoid");
		if (killer:getVar("FerretoryPlantoid") > 0) then 
		killer:PrintToPlayer("Aura Quest #1 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		else if (killer:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		killer:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		killer:setVar("FerretoryPlantoidComplete",1);
		end
		end
		end	
end	





	-------------------- Ferretory Quest #2 -----------------------
	
	if (mobfamily == 14) and (killer:getVar("FerretoryQuest1") == 2) and (mob:checkBaseExp()) then  -- check for plantoid, check if quest is active, and check if the level difference is less than 10
		if  (killer:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		killer:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		kill = killer:getVar("FerretoryPlantoid");
		if (killer:getVar("FerretoryPlantoid") > 0) then 
		killer:PrintToPlayer("Aura Quest #2 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		else if (killer:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		killer:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		killer:setVar("FerretoryPlantoidComplete",2);
		end
		end
		end	
end	


	-------------------- Ferretory Quest #3 (Birds) -----------------------
	
	if (mobfamily == 8) and (killer:getVar("FerretoryQuest1") == 3) and (mob:checkBaseExp()) then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (killer:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		killer:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		kill = killer:getVar("FerretoryPlantoid");
		if (killer:getVar("FerretoryPlantoid") > 0) then 
		killer:PrintToPlayer("Aura Quest #3 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		else if (killer:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		killer:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		killer:setVar("FerretoryPlantoidComplete",3);
		end
		end
		end	
end	




	-------------------- Ferretory Quest #4 (Beast) -----------------------
	
	if (mobfamily == 6) and (killer:getVar("FerretoryQuest1") == 4) and (mob:checkBaseExp()) then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (killer:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		killer:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		kill = killer:getVar("FerretoryPlantoid");
		if (killer:getVar("FerretoryPlantoid") > 0) then 
		killer:PrintToPlayer("Aura Quest #4 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		else if (killer:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		killer:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		killer:setVar("FerretoryPlantoidComplete",4);
		end
		end
		end	
end	




	-------------------- Ferretory Quest #5 (Beastmen) -----------------------
	
	if (mobfamily == 7) and (killer:getVar("FerretoryQuest1") == 5) and (mob:checkBaseExp())then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (killer:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		killer:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		kill = killer:getVar("FerretoryPlantoid");
		if (killer:getVar("FerretoryPlantoid") > 0) then 
		killer:PrintToPlayer("Aura Quest #5 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		else if (killer:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		killer:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		killer:setVar("FerretoryPlantoidComplete",5);
		end
		end
		end	
end	














-- Black Mage Ferretory Quest

if (job == 4) and (killer:getVar("FerretoryBLM") == 1) and (mobfamily == 11) then
	if  (killer:getVar("FerretoryBLMkills")) > 0 then
	killer:setVar("FerretoryBLMkills",ferretoryblmkills - 1);  -- Subtract kill
	ferretoryblmkills = killer:getVar("FerretoryBLMkills");
	if (killer:getVar("FerretoryBLMkills") > 0) then 
	killer:PrintToPlayer("Grimoire Black Mage Quest #1 Objectives Remaining: " ..ferretoryblmkills..".", 0x15);  -- Print objectives remaining
	else if (killer:getVar("FerretoryBLMkills") == 0) then  -- check to see kills have been completed
	killer:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
	killer:setVar("FerretoryBLMQ1",1);
	killer:setVar("FerretoryBLM",0);
	end
	end
	end
end

--  Infamy Point Calculations

if (infamy == 1) and (playerlvl < 75) and (mob:checkBaseExp()) then -- check if infamy is turned on
if (lvldif < -11) then  -- EP
multiplier = 1.7;
else if (lvldif <= -3) then
multiplier = 2.3;
else if (lvldif <= -1) then
multiplier = 2.5;
else if (lvldif == 0) then 
multiplier = 2.7;
else if (lvldif <= 4) then
multiplier = 3;
else if (lvldif == 5) then
multiplier = 3.5;
else 
multiplier = 4.3;
end
end
end
end
end
end


local infamypoints = math.floor((lvldif + 25) * multiplier);
killer:addCurrency("infamy",infamypoints);
if (infamypoints > 0) then
killer:PrintToPlayer(string.format("%s gains "..infamypoints.." infamy points.", killer:getName()), 0x15);
-- killer:PrintToPlayer(lvldif);
else
-- killer:PrintToPlayer(infamypoints);
-- killer:PrintToPlayer(lvldif);
end

end





 
	










	
	

	-- doMagiantTrialCheck(mob, killer, isKillShot, killType);
end;


