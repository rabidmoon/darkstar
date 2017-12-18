---------------------------
-- Endurance Mobs
-- List of npc names by wave
---------------------------


function enduranceReset(mob)
	GetMobByID(17526937):setLocalVar("alive",0); 
    GetMobByID(17526938):setLocalVar("alive",0);
    GetMobByID(17526939):setLocalVar("alive",0);
    GetMobByID(17526940):setLocalVar("alive",0);

	-- GetMobByID(17526942):setLocalVar("alive",0); 
    -- GetMobByID(17526943):setLocalVar("alive",0);
    -- GetMobByID(17526944):setLocalVar("alive",0);
    -- GetMobByID(17526945):setLocalVar("alive",0);

	-- GetMobByID(17526947):setLocalVar("alive",0); 
    -- GetMobByID(17526948):setLocalVar("alive",0);
    -- GetMobByID(17526949):setLocalVar("alive",0);
    -- GetMobByID(17526950):setLocalVar("alive",0);	
end;


function encuranceResetZone(player,prevZone)
	GetMobByID(17526937):setLocalVar("alive",0); 
    GetMobByID(17526938):setLocalVar("alive",0);
    GetMobByID(17526939):setLocalVar("alive",0);
    GetMobByID(17526940):setLocalVar("alive",0);
	printf("Resetting all Mobs!!!!!");

	GetMobByID(17526942):setLocalVar("alive",0); 
    GetMobByID(17526943):setLocalVar("alive",0);
    GetMobByID(17526944):setLocalVar("alive",0);
    GetMobByID(17526945):setLocalVar("alive",0);

	-- GetMobByID(17526947):setLocalVar("alive",0); 
    -- GetMobByID(17526948):setLocalVar("alive",0);
    -- GetMobByID(17526949):setLocalVar("alive",0);
    -- GetMobByID(17526950):setLocalVar("alive",0);	
end;







