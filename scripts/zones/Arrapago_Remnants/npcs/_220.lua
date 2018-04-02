
function onTrigger(entity, npc)
    entity:startEvent(300)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:setAnimation(8)
        local instance = door:getInstance();
		local chars = door:getInstance():getChars();
        -- spawn mobs, etc
        for i,v in pairs(Arrapago.npcs[1][2]) do
            local npc = instance:getEntity(bit.band(v, 0xFFF), TYPE_NPC);
            npc:setStatus(STATUS_NORMAL)
        end
        for id = Arrapago.mobs[1][2].mobs_start, Arrapago.mobs[1][2].mobs_end do
            SpawnMob(id, instance)
        end
        door:untargetable(true)
		for j,player in pairs(chars) do
		    player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,5,3,5400);
			player:PrintToPlayer("A dark energy has weakened your maximum level.", 0x15);
			player:setVar("Salvage_Floor",1);
		    break;
		end
    end
end
