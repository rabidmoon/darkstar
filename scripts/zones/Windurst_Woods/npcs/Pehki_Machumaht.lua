-----------------------------------
-- Area: Windurst Woods
-- NPC: Pehki Machumaht
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/globals/magic_maps"] = nil;
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/magic_maps");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player, npc)
	CheckMaps(player, npc, 0x2710);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player, csid, option)
	if (csid == 0x2710) then
		CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)

end;


