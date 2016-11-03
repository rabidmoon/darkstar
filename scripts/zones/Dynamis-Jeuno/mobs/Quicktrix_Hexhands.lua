-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Trailblix Goatmug
-- Boss Trigger for RDM/NIN
-- ID 17547493
-- Popped with Tome 17
-- Drops Odius Cup
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:addMod(MOD_EVA,30);
mob:addMod(MOD_ACC,50);



end;


function onMobEngaged(mob,target)
local weakener = target:getVar("DynaWeakener");
   if (weakener == 3) then
   mob:setMod(MOD_HPP,-75);
   mob:setMod(MOD_DEFP,-75);
   mob:setMod(MOD_ATTP,-75);
   mob:addMod(MOD_EVA,-30);
   mob:addMOd(MOD_ACC,-30);
if (target:getObjType() == TYPE_PC) then  
target:PrintToPlayer("You have significantly weakened the monster!", 0xD);
end
elseif (weakener == 2) then
   mob:setMod(MOD_HPP,-50);
   mob:setMod(MOD_DEFP,-20);
   mob:setMod(MOD_ATTP,-20);
   mob:addMod(MOD_EVA,-20);
   mob:addMOd(MOD_ACC,-20);
if (target:getObjType() == TYPE_PC) then  
target:PrintToPlayer("You have weakened the monster!", 0xD);
end
elseif (weakener == 1) then
   mob:setMod(MOD_HPP,-20);
   mob:setMod(MOD_DEFP,-10);
   mob:setMod(MOD_ATTP,-10);
   mob:addMod(MOD_EVA,-10);
   mob:addMOd(MOD_ACC,-10);
if (target:getObjType() == TYPE_PC) then	
target:PrintToPlayer("You have weakened the monster ever so slightly", 0xD);
end
elseif (weakener == 0) then
 -- mob:setMod(MOD_ACC,100);
 -- mob:setMod(MOD_EVA,100);
if (target:getObjType() == TYPE_PC) then 
target:PrintToPlayer("You have summoned a Monster.", 0xD); 
end 
end   
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local battletime = mob:getBattleTime();
    local chainspell = mob:getLocalVar("Chainspell");
	local mijin = mob:getLocalVar("Mijin");
	local randcs = math.random(45, 60);
	local randmij = math.random(60, 85);

    if (battletime > chainspell + randcs) then
        mob:useMobAbility(436);
        mob:setLocalVar("Chainspell", battletime);
    elseif (battletime > mijin + randmij) then
        mob:useMobAbility(475);
        mob:setLocalVar("Mijin", battletime);
    end

end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
local qm1 = GetNPCByID(17547510);
killer:setVar("DynaWeakener",0);
qm1:setStatus(STATUS_NORMAL);

end;

function onMobDespawn( mob )
local qm1 = GetNPCByID(17547510);

qm1:setStatus(STATUS_NORMAL);

end