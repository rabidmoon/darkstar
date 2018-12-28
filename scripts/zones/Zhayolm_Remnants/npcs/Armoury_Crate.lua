-----------------------------------
-- Area: Zhayolm Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Zhayolm_Remnants/TextIDs"] = nil;


require("scripts/zones/Zhayolm_Remnants/TextIDs");
require("scripts/globals/treasure");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

function onTrigger(player,npc,trade)
    local npcID = npc:getID()
	-- Open
    if (npc:getAnimation() == 90) then
	    -- Determine Loot
		
		-- Gold Boxes contain Alexandrite very rare
		local ptSize = player:getPartySize();
		local item = salvageLoot(player,npc)
		local chest = GetNPCByID(npcID);
		-- player:addItem(item,1);
		if (ptSize == 1) then
		    player:addTreasure(item,chest);
		elseif (ptSize == 2) then
		    player:addTreasure(item,chest);
			player:addTreasure(item,chest);
		elseif (ptSize == 3) then
		    player:addTreasure(item,chest);
			player:addTreasure(item,chest);
			player:addTreasure(item,chest);
		elseif (ptSize == 4) then
		    player:addTreasure(item,chest);
		    player:addTreasure(item,chest);
			player:addTreasure(item,chest);
			player:addTreasure(item,chest);
		elseif (ptSize == 5) then
		    player:addTreasure(item,chest);
			player:addTreasure(item,chest);
			player:addTreasure(item,chest);
			player:addTreasure(item,chest);
			player:addTreasure(item,chest);
		else
		    player:addTreasure(item,chest);
		end
	    -- player:messageSpecial(ITEM_OBTAINED,item);
	    GetNPCByID(npcID):setAnimation(0);
	
	    
	    GetNPCByID(npcID):setStatus(STATUS_DISAPPEAR);
	elseif (npc:getAnimation() ~= 90) then
	    local ani = npc:getAnimation();
		printf("Aniatmion is: %s",ani);
	    GetNPCByID(npcID):setAnimation(90);
	end
	
	
    -- player:messageSpecial(ITEM_OBTAINED,5145);
	-- GetNPCByID(17076579):setAnimation(90);
	--GetNPCByID(17076579):setStatus(STATUS_DISAPPEAR);

end;

