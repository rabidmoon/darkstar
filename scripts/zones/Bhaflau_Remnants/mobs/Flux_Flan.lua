-----------------------------------
-- Area:
-- NPC:  Demented Jalawaa
-- Role: Portal Unlock
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Arrapago_Remnants/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    
    salvageScaler(mob)

end;


function onMobFight(mob,target)
 
 


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    salvageLoot(player,npc)
	if (killer:getObjType() ~= TYPE_PC) then
	    local master = killer:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("2nd_Floor_NM",1);
    else
        killer:PrintToPlayer("The device emits a faint hum...",0x15);
		killer:setVar("2nd_Floor_NM",1);
		killer:setVar("Bhaflau_Card",1);
		killer:PrintToPlayer("The Bhaflau Card price has now been reduced.",0x15);
    end	

end;