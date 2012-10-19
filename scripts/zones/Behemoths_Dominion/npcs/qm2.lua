-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  ???
-- @zone 127
-- @pos -267 -19 74
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Behemoths_Dominion/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Savory Shank
	if(GetMobAction(17297441) == 0 and trade:hasItemQty(3342,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17297441,180):updateEnmity(player);
	-- Trade Beastly Shank
	elseif(GetMobAction(17297440) == 0 and trade:hasItemQty(3341,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17297440,180):updateEnmity(player);
	end
	

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(IRREPRESSIBLE_MIGHT);
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