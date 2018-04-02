-----------------------------------
--  Area: Al Zahbi
--   NPC: Bjibar
--  Type: Standard NPC
-- @zone: 48
--  @pos -105.178 0.999 60.115
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local posession = GetServerVariable("AC_Posession");
	if (trade:hasItemQty(65535,3000) and (posession == 2)) then	
	    player:tradeComplete();	
	    player:setPos(-10,112,54,50,0x36);
	elseif (trade:hasItemQty(65535,3000) and (posession == 3)) then
	    player:tradeComplete();
	    player:setPos(-32,9,334,62,0x3E);
	elseif (trade:hasItemQty(65535,3000) and (posession == 4)) then
	    player:tradeComplete();	
		player:setPos(86,16,-185,110,0x41);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Get who has AC posession
	local posession = GetServerVariable("AC_Posession");
	if (posession == 1) then -- AC in Al Zahbi
	    player:PrintToPlayer("Keylala : The Astral Candescance is currently in Al Zahbi.  You can donate Imp. Gold Pieces",0xD);
	    player:PrintToPlayer("Keylala : to help train our troops!",0xD);
    elseif (posession == 2) then -- AC in Arapaggo
	    player:PrintToPlayer("Keylala : The Undead Swarm currently have the Astral Candescence.  Help us get it back by",0xD);
	    player:PrintToPlayer("Keylala : participating in Siege Missions.  I can warp you to the battlefield for 3,000 gil.",0xD);   
    elseif (posession == 3) then -- AC in Halvung
	    player:PrintToPlayer("Keylala : The Troll Mercinaries currently have the Astral Candescence.  Help us get it back by",0xD);
	    player:PrintToPlayer("Keylala : participating in Siege Missions.  I can warp you to the battlefield for 3,000 gil.",0xD);	
    elseif (posession == 4) then -- AC in Halvung
	    player:PrintToPlayer("Keylala : The Mamool Ja Savages currently have the Astral Candescence.  Help us get it back by",0xD);
	    player:PrintToPlayer("Keylala : participating in Siege Missions.  I can warp you to the battlefield for 3,000 gil.",0xD);
    end		
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

