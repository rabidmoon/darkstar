-----------------------------------
--
-- Zone: Western_Altepa_Desert (125)
--
-----------------------------------

package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;

require("scripts/zones/Western_Altepa_Desert/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/weather");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -19.901, 13.607, 440.058, 78);
	end
	
	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0002;
	end
	
	return cs;		
end;			

-----------------------------------			
-- onRegionEnter			
-----------------------------------			

function onRegionEnter( player, region)			
end;			

-----------------------------------			
-- onEventUpdate			
-----------------------------------			

function onEventUpdate( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x0002) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if (csid == 0x0002) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;

function OnZoneWeatherChange(zoneid, weather)
	local KingVinegarroon = GetMobByID(17289575); -- King Vinegarroon
	if(weather == WEATHER_DUST_STORM or weather == WEATHER_SAND_STORM and GetMobAction(17289575) == 0) then
		SpawnMob(17289575);
	end
end;