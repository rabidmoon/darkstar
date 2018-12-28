-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
--  MOB: Ashu Talif Crew
-----------------------------------

require("scripts/globals/instance");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setUnkillable(false);
	mob:untargetable(false); 

end;

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
    -- The captain gives up at <= 20% HP. Everyone disengages
    local instance = mob:getInstance();
	local crew1 = GetMobByID(17022986);
	local crew2 = GetMobByID(17022987);
	local crew3 = GetMobByID(17022988);
	local crew4 = GetMobByID(17022989);

    if (mob:getHPP() <= 20 and instance:completed() == false) then
	    mob:addStatusEffect(EFFECT_TERROR,1,0,120);
		mob:untargetable(true);
        instance:setProgress(10);

		
	    printf("Should be done");
		mob:setHP(0);

        mob:setPos(0,-28,-7);
		
    end
	

 
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local jumped = mob:getLocalVar("jump");
    local ready = mob:getLocalVar("ready");
mob:untargetable(false); 
    -- Becomes ready when the Crew is engaged. Jump down!


        mob:setLocalVar("jump", 1);
    

end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------

function onMobDisengage(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    printf("Mob Died");
    if (killer:getObjType() == TYPE_PET) then
        local master = killer:getMaster();
		local party = master:getParty();
		if (party ~= nil) then
		    for i,v in ipairs(party) do
			    if (v:getCurrentMission(TOAU) == THE_BLACK_COFFIN and v:getVar("AhtUrganStatus") == 1) then
                    v:setVar("AhtUrganStatus", 2);
			        v:startEvent(102);
				end
			end
		else
		    master:startEvent(102);
		end
	elseif (killer:getObjType() == TYPE_PC) then
	    local party = killer:getParty();
		if (party ~= nil) then
		    for i,v in ipairs(party) do
			    if (v:getCurrentMission(TOAU) == THE_BLACK_COFFIN and v:getVar("AhtUrganStatus") == 1) then
                    v:setVar("AhtUrganStatus", 2);
			        v:startEvent(102);
				end
			end
		else
		    if (killer:getCurrentMission(TOAU) == THE_BLACK_COFFIN and killer:getVar("AhtUrganStatus") == 1) then
		        killer:startEvent(102);
				killer:setVar("AhtUrganStatus", 2);
			end
		end
	end
end;


-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

end;
