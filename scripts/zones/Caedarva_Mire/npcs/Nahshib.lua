-----------------------------------
--  Area: Caedarva Mire
--  NPC:  Nahshib
--  Type: Assault
--  @pos -274.334 -9.287 -64.255 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Caedarva_Mire/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local IPpoint = player:getCurrency("imperial_standing");

	if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES) then
		if (player:hasKeyItem(SUPPLIES_PACKAGE)) then
			player:startEvent(0x0005);
		elseif (player:getVar("TOAUM2") == 1) then
			player:startEvent(0x0006);
		end

    -- SHADES OF VENGEANCE
    elseif (toauMission == SHADES_OF_VENGEANCE and player:hasKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT) == false and vanaDay() > player:getVar("TOAUM31_PERMITDAY")) then
        player:startEvent(22);		
		
	elseif (player:getCurrentMission(TOAU) >= PRESIDENT_SALAHEEM) then
		if (player:hasKeyItem(PERIQIA_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND) == false) then
			player:startEvent(0x0094,50,IPpoint);
		else
			player:startEvent(0x0007);
			-- player:delKeyItem(ASSAULT_ARMBAND);
		end
	else
		player:startEvent(0x0004);
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

	if (csid == 0x0094 and option == 1) then
		player:delCurrency("imperial_standing", 50);
		player:addKeyItem(ASSAULT_ARMBAND);
		player:messageSpecial(KEYITEM_OBTAINED,ASSAULT_ARMBAND);
	elseif (csid == 0x0005 and option == 1) then
		player:delKeyItem(SUPPLIES_PACKAGE);
		player:setVar("TOAUM2",1);
    -- SHADES OF VENGEANCE
    elseif (csid == 22) then
        player:setVar("TOAUM31_PERMITDAY",vanaDay());
        player:addKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:messageSpecial(KEYITEM_OBTAINED,PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);		
	end

end;