-----------------------------------
-- Area: Zhayolm Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Remnants/TextIDs"] = nil;


require("scripts/zones/Bhaflau_Remnants/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

function onTrigger(player,npc,trade)
    local npcID = npc:getID()
	-- Open
    if (npcID == 17084688 and player:getLocalVar(npc:getID()) == npc:getLocalVar(npc:getID())) then -- First floor
	    -- Spawn Rampart
		GetNPCByID(17084688):setStatus(STATUS_DISAPPEAR);
		local pos = player:getPos();
		local posx = pos.x;
		local posy = pos.y;
		local posz = pos.z;
		player:setVar("Bhaflau_X",posx);
		player:setVar("Bhaflau_Y",posy);
		player:setVar("Bhaflau_Z",posz);
        GetMobByID(17084692):updateEnmity(target);	-- When the player clicks the dormant rampart, the reactionary rampart becomes targeted by the player	
		player:startEvent(4);	    
	elseif (npcID == 17084689) then -- Second Floor
	
	
	elseif (npcID == 17084690) then -- Third Floor	
	
	
	elseif (npcID == 17084691) then -- Fouth Floor



    end	
    -- player:messageSpecial(ITEM_OBTAINED,5145);
	-- GetNPCByID(17076579):setAnimation(90);
	--GetNPCByID(17076579):setStatus(STATUS_DISAPPEAR);

end;

function onEventUpdate(player,csid,option)
    if (csid == 4) then
        player:setPos(6,0,35,32);
    end
--printf("RESULT: %u",option);
end;


function onEventFinish(player,csid,option)
--printf("RESULT: %u",option);
end;


