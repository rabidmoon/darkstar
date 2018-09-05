-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Justice
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",6);  
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local size = target:getPartySize();
	mobScaler(mob,target);
    local popTime = mob:getLocalVar("lastPetPop");
    -- ffxiclopedia says 30 sec, bgwiki says 1-2 min..
    -- Going with 60 seconds until I see proof of retails timing.
    if (os.time() - popTime > 60) then
        local alreadyPopped = false;
        for Xzomit = mob:getID()+1, mob:getID()+6 do
            if (alreadyPopped == true) then
                break;
            else
                if (GetMobAction(Xzomit) == ACTION_NONE or GetMobAction(Xzomit) == ACTION_SPAWN) then
                    SpawnMob(Xzomit, 300):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                    alreadyPopped = true;
                end
            end
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getObjType() == TYPE_PET) then
        player:setVar("Justice_Win",1);
	    player:addCurrency('zeni_point',700);
	    player:PrintToPlayer("You obtain 700 Zeni Points.", 0x15);	
    elseif (killer:getObjType() == TYPE_PC) then
        player:setVar("Justice_Win",1);
	    player:addCurrency('zeni_point',700);
	    player:PrintToPlayer("You obtain 700 Zeni Points.", 0x15);		
    end
end;