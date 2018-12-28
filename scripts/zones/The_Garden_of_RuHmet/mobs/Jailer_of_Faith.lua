-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Faith
-----------------------------------

require("scripts/globals/mobscaler");
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",8); 
    -- Give it two hour
    mob:setMod(MOBMOD_MAIN_2HOUR, 1);
    -- Change animation to open
    mob:AnimationSub(2);
end;

-----------------------------------
-- onMobFight Action
-- Randomly change forms 
-----------------------------------

function onMobFight(mob)
    local size = target:getPartySize();
	mobScaler(mob,target);
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed 
    local randomTime = math.random(45,180);
    local changeTime = mob:getLocalVar("changeTime");
    
    if (mob:getBattleTime() - changeTime > randomTime) then
        -- Change close to open.
        if (mob:AnimationSub() == 1) then
            mob:AnimationSub(2);
        else -- Change from open to close
            mob:AnimationSub(1);
        end
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, player)
	if (killer:getObjType() == TYPE_PET) then
	    local player = killer:getMaster();
        player:setVar("Faith_Win",1);
	    player:addCurrency('zeni_point',500);
	    player:PrintToPlayer("You obtain 500 Zeni Points.", 0x15);	
    elseif (killer:getObjType() == TYPE_PC) then
        killer:setVar("Faith_Win",1);
	    killer:addCurrency('zeni_point',500);
	    killer:PrintToPlayer("You obtain 500 Zeni Points.", 0x15);		
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, killer, npc)
    local qm3 = GetNPCByID(Jailer_of_Faith_QM);
    qm3:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    local qm3position = math.random(1,5);
    qm3:setPos(Jailer_of_Faith_QM_POS[qm3position][1], Jailer_of_Faith_QM_POS[qm3position][2], Jailer_of_Faith_QM_POS[qm3position][3]);
end;