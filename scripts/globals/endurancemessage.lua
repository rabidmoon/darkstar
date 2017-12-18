---------------------------
-- Endurance Mobs
-- List of npc names by wave
---------------------------


function ominousFightMsg(mob,target)
    local player;
	local party;
    if (target:getObjType() == TYPE_PET) then
      player = target:getMaster();
      party = player:getParty();
      if (party ~= nil) then
        for i,member in ipairs(party) do
          member:PrintToPlayer("You sense an omnious presence...",0x15);
        end
      else
	      player = target:getMaster();
          player:PrintToPlayer("You sense an omnious presence...",0x15);
      end
    else
      party = target:getParty();
      if (party ~= nil) then
        for i,member in ipairs(party) do
          member:PrintToPlayer("You sense an omnious presence...",0x15);
        end
      else
        player = target:getMaster();
        player:PrintToPlayer("You sense an omnious presence...",0x15);
      end
	end
end;


function ominousKillMsg(mob,killer)
    local player;
	local party;
    if (killer:getObjType() == TYPE_PET) then
      player = killer:getMaster();
      party = player:getParty();
      if (party ~= nil) then
        for i,member in ipairs(party) do
          member:PrintToPlayer("You sense an omnious presence...",0x15);
        end
      else
	      player = killer:getMaster();
          player:PrintToPlayer("You sense an omnious presence...",0x15);
      end
    else
      party = killer:getParty();
      if (party ~= nil) then
        for i,member in ipairs(party) do
          member:PrintToPlayer("You sense an omnious presence...",0x15);
        end
      else
        player = killer:getMaster();
        player:PrintToPlayer("You sense an omnious presence...",0x15);
      end
	end
end;


function tauntFightMsg(mob,target)
    local player;
	local party;
    if (target:getObjType() == TYPE_PET) then
      player = target:getMaster();
      party = player:getParty();
      if (party ~= nil) then
        for i,member in ipairs(party) do
          member:PrintToPlayer("??? : Ha ha ha...lets see how you handle my reinforcements!",0xD);
        end
      else
	      player = target:getMaster();
          player:PrintToPlayer("??? : Ha ha ha...lets see how you handle my reinforcements!",0xD);
      end
    else
      party = target:getParty();
      if (party ~= nil) then
        for i,member in ipairs(party) do
          member:PrintToPlayer("??? : Ha ha ha...lets see how you handle my reinforcements!",0xD);
        end
      else
        player = target:getMaster();
        player:PrintToPlayer("??? : Ha ha ha...lets see how you handle my reinforcements!",0xD);
      end
	end
end;


