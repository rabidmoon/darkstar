-------------------------------------------
-- Mob Scaler
-- This Function scales Notorious Monsters
-- level based on the amount of players present
-- in the party.  Set local variable
-- based on what the expected full level
-- of players needed to fight naturally
-- would be
-------------------------------------------

-------------------------------------------
-- Scale Chart
-- 1 = 1-3 Players
-- 2 = 4-6 Players
-- 3 = 7-9 Players
-- 4 = 10-12 Players
-- 5 = 13-15 Players
-- 6 = 16-18 Players
-------------------------------------------


-----------------------------------
-- mobScaler
-----------------------------------

function hpScaler(mob)

	local floorcount = mob:getLocalVar("Floor");

	local sizediff = (floorcount - 9);
	printf("Size Difference: %s",sizediff);
    local scale = mob:getLocalVar("Scale");
	
    if (scale == 1) then
	    local hpboost = (4 * sizediff);
	    mob:addStatusEffect(EFFECT_MAX_HP_BOOST,hpboost,0,5000);
	    mob:setLocalVar("Scale",2);
	end


end

function salvageChestZ(mob, killer)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	
	
	local blue1 = GetNPCByID(17076579);
	local blue2 = GetNPCByID(17076580);
	local blue3 = GetNPCByID(17076581);
	local blue4 = GetNPCByID(17076582);
	local blue5 = GetNPCByID(17076583);
	local blue6 = GetNPCByID(17076584);
	local brown1 = GetNPCByID(17076585);
	local brown2 = GetNPCByID(17076586);
	local brown3 = GetNPCByID(17076587);
	local gold1 = GetNPCByID(17076588);
	local gold2 = GetNPCByID(17076589);

	-- Decide which chest to drop. 
	-- Blue is low quality items
	-- brown is HQ meds
	-- Gold is Alexandrite
	
	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 15) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= STATUS_NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(STATUS_NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= STATUS_NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(STATUS_NORMAL);
				gold2:showNPC(60);
            end				
	    elseif (chesttype < 45) then
		    printf("BROWN");		
	        if (brown1:getStatus() ~= STATUS_NORMAL) then
	            brown1:setPos(killx+1,killy,killz);
	            -- brown1:setStatus(STATUS_NORMAL);
				brown1:showNPC(60);
		    elseif (brown2:getStatus() ~= STATUS_NORMAL) then
	            brown2:setPos(killx+1,killy,killz);
	            -- brown2:setStatus(STATUS_NORMAL);
				brown2:showNPC(60);
		    elseif (brown3:getStatus() ~= STATUS_NORMAL) then
	            brown3:setPos(killx+1,killy,killz);
	            -- brown3:setStatus(STATUS_NORMAL);	
				brown3:showNPC(60);
            end		
	    else
		    printf("BLUE");		
	        if (blue1:getStatus() ~= STATUS_NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(STATUS_NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= STATUS_NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(STATUS_NORMAL);	
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= STATUS_NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(STATUS_NORMAL);	
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= STATUS_NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(STATUS_NORMAL);	
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= STATUS_NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(STATUS_NORMAL);
				blue5:showNPC(60);				
		    elseif (blue6:getStatus() ~= STATUS_NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	            -- blue6:setStatus(STATUS_NORMAL);
				blue6:showNPC(60);
            end			
	    end
    end
end


function salvageChestA(mob, killer)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	
	
	local blue1 = GetNPCByID(17080586);
	local blue2 = GetNPCByID(17080587);
	local blue3 = GetNPCByID(17080588);
	local blue4 = GetNPCByID(17080589);
	local blue5 = GetNPCByID(17080590);
	local blue6 = GetNPCByID(17080591);
	local brown1 = GetNPCByID(17080592);
	local brown2 = GetNPCByID(17080593);
	local brown3 = GetNPCByID(17080594);
	local gold1 = GetNPCByID(17080595);
	local gold2 = GetNPCByID(17080598);

	-- Decide which chest to drop. 
	-- Blue is low quality items
	-- brown is HQ meds
	-- Gold is Alexandrite
	
	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 15) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= STATUS_NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(STATUS_NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= STATUS_NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(STATUS_NORMAL);
				gold2:showNPC(60);
            end				
	    elseif (chesttype < 45) then
		    printf("BROWN");		
	        if (brown1:getStatus() ~= STATUS_NORMAL) then
	            brown1:setPos(killx+1,killy,killz);
	            -- brown1:setStatus(STATUS_NORMAL);
				brown1:showNPC(60);
		    elseif (brown2:getStatus() ~= STATUS_NORMAL) then
	            brown2:setPos(killx+1,killy,killz);
	            -- brown2:setStatus(STATUS_NORMAL);
				brown2:showNPC(60);
		    elseif (brown3:getStatus() ~= STATUS_NORMAL) then
	            brown3:setPos(killx+1,killy,killz);
	            -- brown3:setStatus(STATUS_NORMAL);	
				brown3:showNPC(60);
            end		
	    else
		    printf("BLUE");		
	        if (blue1:getStatus() ~= STATUS_NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(STATUS_NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= STATUS_NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(STATUS_NORMAL);	
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= STATUS_NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(STATUS_NORMAL);	
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= STATUS_NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(STATUS_NORMAL);	
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= STATUS_NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(STATUS_NORMAL);
				blue5:showNPC(60);				
		    elseif (blue6:getStatus() ~= STATUS_NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	            -- blue6:setStatus(STATUS_NORMAL);
				blue6:showNPC(60);
            end			
	    end
    end
end


function salvageChestB(mob, killer)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	
	
	local blue1 = GetNPCByID(17084417);
	local blue2 = GetNPCByID(17084418);
	local blue3 = GetNPCByID(17084419);
	local blue4 = GetNPCByID(17084420);
	local blue5 = GetNPCByID(17084421);
	local brown1 = GetNPCByID(17084422);
	local brown2 = GetNPCByID(17084423);
	local brown3 = GetNPCByID(17084424);
	local gold1 = GetNPCByID(17084425);
	local gold2 = GetNPCByID(17084426);

	-- Decide which chest to drop. 
	-- Blue is low quality items
	-- brown is HQ meds
	-- Gold is Alexandrite
	
	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 15) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= STATUS_NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(STATUS_NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= STATUS_NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(STATUS_NORMAL);
				gold2:showNPC(60);
            end				
	    elseif (chesttype < 45) then
		    printf("BROWN");		
	        if (brown1:getStatus() ~= STATUS_NORMAL) then
	            brown1:setPos(killx+1,killy,killz);
	            -- brown1:setStatus(STATUS_NORMAL);
				brown1:showNPC(60);
		    elseif (brown2:getStatus() ~= STATUS_NORMAL) then
	            brown2:setPos(killx+1,killy,killz);
	            -- brown2:setStatus(STATUS_NORMAL);
				brown2:showNPC(60);
		    elseif (brown3:getStatus() ~= STATUS_NORMAL) then
	            brown3:setPos(killx+1,killy,killz);
	            -- brown3:setStatus(STATUS_NORMAL);	
				brown3:showNPC(60);
            end		
	    else
		    printf("BLUE");		
	        if (blue1:getStatus() ~= STATUS_NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(STATUS_NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= STATUS_NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(STATUS_NORMAL);	
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= STATUS_NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(STATUS_NORMAL);	
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= STATUS_NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(STATUS_NORMAL);	
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= STATUS_NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(STATUS_NORMAL);
				blue5:showNPC(60);				
            end			
	    end
    end
end

function salvageChestS(mob, killer)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	
	
	local blue1 = GetNPCByID(17088809);
	local blue2 = GetNPCByID(17088810);
	local blue3 = GetNPCByID(17088811);
	local blue4 = GetNPCByID(17088812);
	local blue5 = GetNPCByID(17088813);
	local blue6 = GetNPCByID(17088814);
	local brown1 = GetNPCByID(17088815);
	local brown2 = GetNPCByID(17088816);
	local brown3 = GetNPCByID(17088817);
	local gold1 = GetNPCByID(17088818);
	local gold2 = GetNPCByID(17088819);

	-- Decide which chest to drop. 
	-- Blue is low quality items
	-- brown is HQ meds
	-- Gold is Alexandrite
	
	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 15) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= STATUS_NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(STATUS_NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= STATUS_NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(STATUS_NORMAL);
				gold2:showNPC(60);
            end				
	    elseif (chesttype < 45) then
		    printf("BROWN");		
	        if (brown1:getStatus() ~= STATUS_NORMAL) then
	            brown1:setPos(killx+1,killy,killz);
	            -- brown1:setStatus(STATUS_NORMAL);
				brown1:showNPC(60);
		    elseif (brown2:getStatus() ~= STATUS_NORMAL) then
	            brown2:setPos(killx+1,killy,killz);
	            -- brown2:setStatus(STATUS_NORMAL);
				brown2:showNPC(60);
		    elseif (brown3:getStatus() ~= STATUS_NORMAL) then
	            brown3:setPos(killx+1,killy,killz);
	            -- brown3:setStatus(STATUS_NORMAL);	
				brown3:showNPC(60);
            end		
	    else
		    printf("BLUE");		
	        if (blue1:getStatus() ~= STATUS_NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(STATUS_NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= STATUS_NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(STATUS_NORMAL);	
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= STATUS_NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(STATUS_NORMAL);	
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= STATUS_NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(STATUS_NORMAL);	
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= STATUS_NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(STATUS_NORMAL);
				blue5:showNPC(60);				
		    elseif (blue6:getStatus() ~= STATUS_NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	            -- blue6:setStatus(STATUS_NORMAL);
				blue5:showNPC(60);
            end			
	    end
    end
end

function salvageChestAlways(mob, killer)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	
	printf("Killer X Pos is: %s",killx);
	local blue1 = GetNPCByID(17076579);
	local blue2 = GetNPCByID(17076580);
	local blue3 = GetNPCByID(17076581);
	local blue4 = GetNPCByID(17076582);
	local blue5 = GetNPCByID(17076583);
	local blue6 = GetNPCByID(17076584);
	local brown1 = GetNPCByID(17076585);
	local brown2 = GetNPCByID(17076586);
	local brown3 = GetNPCByID(17076587);
	local gold1 = GetNPCByID(17076588);
	local gold2 = GetNPCByID(17076589);

	-- Decide which chest to drop. 
	-- Blue is low quality items
	-- brown is HQ meds
	-- Gold is Alexandrite
	
	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 40%
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 40) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= STATUS_NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            gold1:setStatus(STATUS_NORMAL);
		    elseif (gold2:getStatus() ~= STATUS_NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            gold2:setStatus(STATUS_NORMAL);		
            end				
	    elseif (chesttype < 40) then
		    printf("RED");		
	        if (brown1:getStatus() ~= STATUS_NORMAL) then
	            brown1:setPos(killx+1,killy,killz);
	            brown1:setStatus(STATUS_NORMAL);
		    elseif (brown2:getStatus() ~= STATUS_NORMAL) then
	            brown2:setPos(killx+1,killy,killz);
	            brown2:setStatus(STATUS_NORMAL);	
		    elseif (brown3:getStatus() ~= STATUS_NORMAL) then
	            brown3:setPos(killx+1,killy,killz);
	            brown3:setStatus(STATUS_NORMAL);	
            end		
	    else
		    printf("BLUE");		
	        if (blue1:getStatus() ~= STATUS_NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            blue1:setStatus(STATUS_NORMAL);
		    elseif (blue2:getStatus() ~= STATUS_NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            blue2:setStatus(STATUS_NORMAL);	
		    elseif (blue3:getStatus() ~= STATUS_NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            blue3:setStatus(STATUS_NORMAL);	
		    elseif (blue4:getStatus() ~= STATUS_NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	            blue4:setStatus(STATUS_NORMAL);	
		    elseif (blue5:getStatus() ~= STATUS_NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	            blue5:setStatus(STATUS_NORMAL);	
		    elseif (blue6:getStatus() ~= STATUS_NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	           blue6:setStatus(STATUS_NORMAL);
            end			
	    end
    end
end


function salvageChestRed(mob, killer)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
	
	printf("Killer X Pos is: %s",killx);

	local brown1 = GetNPCByID(17076585);
	local brown2 = GetNPCByID(17076586);
	local brown3 = GetNPCByID(17076587);


	-- Decide which chest to drop. 
	-- Blue is low quality items
	-- brown is HQ meds
	-- Gold is Alexandrite
	
	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 50) then
	    if (brown1:getStatus() ~= STATUS_NORMAL) then
	        brown1:setPos(killx+1,killy,killz);
	        brown1:showNPC(60);
		elseif (brown2:getStatus() ~= STATUS_NORMAL) then
	        brown2:setPos(killx+1,killy,killz);
	        brown2:showNPC(60);	
	    elseif (brown3:getStatus() ~= STATUS_NORMAL) then
	        brown3:setPos(killx+1,killy,killz);
	        brown3:showNPC(60);
        end		
    end
end


function salvageLoot(player,npc)
    local item = 0;
    local npcID = npc:getID();
	local slvl = player:getVar("Salvage_Level");
    if ((npcID <= 17076584 and npcID >= 17076579) or (npcID <= 17080586 and npcID >= 17080591) or 
	    (npcID <= 17084417 and npcID >= 17084421) or (npcID <= 17088809 and npcID >= 17088814)) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (slvl <= 25) then
		    if (itemchance < 5) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 10) then
			    item = 4255; -- Mana Powder
		    elseif (itemchance < 55) then
		   	    item = 5432;  -- Dusty Ether
		    else
		        item = 5431;  -- Dusty Potion
			end
		elseif (slvl <= 45) then
		    if (itemchance < 5) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 10) then
			    item = 4255; -- Mana Powder
		    elseif (itemchance < 55) then
		   	    item = 5827;  -- Lucid Ether
		    else
		        item = 5824;  -- Lucid Potion
			end
		elseif (slvl <= 55) then
		    if (itemchance < 20) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 40) then
			    item = 4255; -- Mana Powder
		    elseif (itemchance < 75) then
		   	    item = 5828;  -- Lucid Ether II
		    else
		        item = 5825;  -- Lucid Potion II
			end
		elseif (slvl <= 75) then
		    if (itemchance < 20) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 40) then
			    item = 4255; -- Mana Powder
			elseif (itemchance < 60) then
			    item = 4254;
		    elseif (itemchance < 80) then
		   	    item = 5829;  -- Lucid Ether III
		    else
		        item = 5826;  -- Lucid Potion III
			end
		end			
    end
	
    if ((npcID <= 17076578 and npcID >= 17076585) or (npcID <= 17080592 and npcID >= 17080594) or
	    (npcID <= 17084422 and npcID >= 17084424) or (npcID <= 17088815 and npcID >= 17088817)) then -- Red always HQ temp items 
	    local itemchance = math.random(1,100);
		if (slvl <= 25) then
		    if (itemchance < 5) then
			    item = 5436; -- Instant Reraise
		    else
		        item = 5439;  -- Vicar's Drink (erase status ailments)
			end	
		elseif (slvl <= 35) then
		    if (itemchance < 5) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 50) then
			    item = 5439 -- Vicar's Drink (erase status ailments
		    elseif (itemchance < 75) then
		   	    item = 5388;  -- Assasins Drink (Magic Acc)				
		    else
		   	    item = 5386;  -- Fighters Drink (increased acc)
			end
		elseif (slvl <= 55) then
		    if (itemchance < 5) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 55) then
			    item = 5439 -- Vicar's Drink (erase status ailments
		    elseif (itemchance < 70) then
		   	    item = 5388;  -- Assasins Drink (magic acc)
		    elseif (itemchance < 85) then
		   	    item = 5386;  -- Fighters Drink (melee Acc)
		    else
		   	    item = 5385;  -- Barbarians Drink (Attack Power)			
			end	
		elseif (slvl <= 75) then
		    if (itemchance < 5) then
			    item = 5389; -- Spys Drink
		    elseif (itemchance < 10) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 30) then
			    item = 6575;  -- Lucid Wings II
		    elseif (itemchance < 55) then
			    item = 5439 -- Vicar's Drink (erase status ailments
		    elseif (itemchance < 70) then
		   	    item = 5388;  -- Assasins Drink (magic acc)
		    elseif (itemchance < 85) then
		   	    item = 5386;  -- Fighters Drink (melee Acc)
		    else
		   	    item = 5385;  -- Barbarians Drink (Attack Power)			
			end	
        end
    end		
	
	if ((npcID >= 17076588 and npcID <= 17076589) or (npcID == 17080595 or npcID == 17080598) or
        (npcID >= 17084425 and npcID <= 17084426) or (npcID >= 17088818 and npcID <= 17088819)) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = 5735;
		end
	end
	return item;
end

function salvageScaler(mob)
    mob:setMobMod(MOBMOD_EXP_BONUS, -100);
  -- Global because mobs are too defensive at the moment when porting up
    mob:addMod(MOD_DEFP, -10);
    mob:addMod(MOD_EVA, -20);	

	
end

function salvageRampart(mob,target)
    local mobID = mob:getID();
	
	
	
	-- Zhalyom Remnants
	if (mobID == 17076515) then  --Floor 5 South
	    mob:setLocalVar("SpawnID",17076670);
		mob:setLocalVar("NmID",17076558);
	end
	
	












end

function salvageAmbient(mob,killer)
    
	local salvagelvl = killer:getVar("Salvage_Level");
	local salvagefloor = 0;
	local playerzone = killer:getZoneID();

	local multiplier = 0;
	local additive = 0;
	if (playerzone == 73) then
	    salvagefloor = killer:getVar("Zhayolm_Floor");
	elseif (playerzone == 74) then
	    salvagefloor = killer:getVar("Arrapago_Floor");
	elseif (playerzone == 75) then
	    salvagefloor = killer:getVar("Bhaflau_Floor");
	elseif (playerzone == 76) then
	    salvagefloor = killer:getVar("Silver_Floor");	
	end
	printf("Salvage floor %s",salvagefloor);
	local lvldif = (mob:getMainLvl() - killer:getMainLvl());
	print(lvldif);
	local ambpts = killer:getVar("Ambience_Points");
	if (mob:checkBaseExp()) then 
		if (lvldif < 0) then  -- EP
			multiplier = 1;
			additive = math.random(48,53);
		elseif (lvldif == 0) then 
			multiplier = 2;
			additive = math.random(48,53);
		elseif (lvldif <= 1) then
			multiplier = 8;
			additive = math.random(48,53);
		elseif (lvldif <= 3) then
			multiplier = 8;
			additive = math.random(53,56);
		elseif (lvldif <= 8) then
			multiplier = 9;
			additive = math.random(57,60);
		else 
			multiplier = 15;
			additive = math.random(85,95);
		end
	end
    local ambience = math.floor((((lvldif * 2) + additive) * multiplier));
    if (killer:getObjType() == TYPE_PC) then
        local ambiencetot = ambpts + ambience;
        killer:setVar("Ambience_Points", ambiencetot);
        if (killer:getVar("Ambience_Points") >= 1500) then
	        ambiencetot = ambiencetot - 1500;
	        killer:setVar("Ambience_Points",ambiencetot);
	        salvagelvl = salvagelvl + 1;
            if (playerzone == 73 or playerzone == 74) then			
	            if (salvagefloor == 1) and (salvagelvl > 25) then
	                salvagelvl = 25;
	            elseif (salvagefloor == 2) and (salvagelvl > 35) then
	                salvagelvl = 35;
	            elseif (salvagefloor == 3) and (salvagelvl > 45) then
	                salvagelvl = 45;
	            elseif (salvagefloor == 4) and (salvagelvl > 55) then
	                salvagelvl = 55;
	            elseif (salvagefloor == 5) and (salvagelvl > 65) then
	                salvagelvl = 65;
	            elseif (salvagefloor == 6) and (salvagelvl > 75) then
	                salvagelvl = 75;					
	            end
            elseif (playerzone == 75 or playerzone == 76) then			
	            if (salvagefloor == 1) and (salvagelvl > 45) then
	                salvagelvl = 45;
	            elseif (salvagefloor == 2) and (salvagelvl > 55) then
	                salvagelvl = 55;
	            elseif (salvagefloor == 3) and (salvagelvl > 65) then
	                salvagelvl = 65;
	            elseif (salvagefloor == 4) and (salvagelvl > 75) then
	                salvagelvl = 75;				
	            end	
            end				
			ambpts = killer:getVar("Ambience_Points");
			killer:PrintToPlayer(string.format("%s gains "..ambience.." Ambience Points ("..ambpts.."/1500)", killer:getName()), 0x15); 
	        if (killer:getObjType() == TYPE_PC) then
			    local duration = killer:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getTimeRemaining();
				duration = duration / 1000;
				print(duration);
	            killer:PrintToPlayer("The dark energy has weakened around you.  You are now Level "..salvagelvl..".", 0x15);	 
	            killer:setVar("Salvage_Level",salvagelvl);
				
	            killer:addStatusEffect(EFFECT_LEVEL_RESTRICTION,salvagelvl,3,duration);
	        end
		else
		    ambpts = killer:getVar("Ambience_Points");
		    killer:PrintToPlayer(string.format("%s gains "..ambience.." Ambience Points ("..ambpts.."/1500)", killer:getName()), 0x15);
        end
	end

end;

function checkSpawn(mob, killer,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)
	if (mob:getID() >= moblow and mob:getID() <= mobhigh) then
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 30 and level <= 35 and GetNPCByID(nm):getStatus() ~= STATUS_NORMAL) then
            if (chance < math.random(0,99)) then 
                master:PrintToPlayer("You feel an unknown presense...",0x15);
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);
            end
		else
            printf("Not of the correct level yet");		
    	end
    else
        local plvl = killer:getVar("Salvage_Level");
		if (plvl >= 30 and plvl <= 35 and GetNPCByID(nm):getStatus() ~= STATUS_NORMAL) then
            if (chance < math.random(0,99)) then
	            if (killer:getObjType() == TYPE_PC) then
                    killer:PrintToPlayer("You feel an unknown presense...",0x15);
	            end
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);	
	        end
		else
		    printf("Not of the correct level yet");	
        end	
    end
    end	








end


