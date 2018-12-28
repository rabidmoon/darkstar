-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Meyaada
-- @pos 22.446 -7.920 573.390 54

-- Accepts Gold Pieces 2187 to increase strength of army
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Arrapago_Reef/TextIDs");

function onSpawn(npc)
  --  printf("Spawning BLU");
   -- SpawnMob(16999067);
end
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local qty = trade:getItemCount();
    local trooplevel = GetServerVariable("SiegeDonation");
	printf("Quantity is %u",qty);
	if (trade:hasItemQty(2187,qty)) then
	    if (qty > 25) then
		   qty = 25;
		end
		trooplevel = qty + trooplevel;
		if (trooplevel > 25) then
		    trooplevel = 25;
		end
		SetServerVariable("SiegeDonation",trooplevel);
		player:PrintToPlayer("Achieve Master : Thank you for your donation.  Our troop level is now  "..trooplevel.."/25",0xD);
        player:tradeComplete();		
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local tagtime = GetServerVariable("Helper_Fight_Length");
	local siegetime = GetServerVariable("[AR]SiegeTime");
	local currenttime = os.time();
	local tagremaining = 0;
	local nextsiege = siegetime - currenttime;
    local trooplevel = GetServerVariable("SiegeDonation");
	
	if (player:hasStatusEffect(EFFECT_BESIEGED)) then
	    player:PrintToPlayer("Achieve Master : You are already signed up for Siege operations",0xD); 	
	elseif (currenttime < tagtime) then
	    tagremaining = tagtime - currenttime;
		player:addStatusEffect(EFFECT_BESIEGED,3,0,tagremaining);
	else
	    player:PrintToPlayer("Achieve Master : The next Siege on the Archaic Mirrors will occur in "..nextsiege.." seconds.",0xD); 
	    player:PrintToPlayer("Achieve Master : Our current Troop Stength is:  "..trooplevel.."/25",0xD); 		
	    player:PrintToPlayer("Achieve Master : You can increase our Troops strength with Imp. Gold Pieces as a donation.",0xD); 		
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