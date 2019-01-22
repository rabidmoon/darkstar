---------------------------------------------------
-- Ability: Ecliptic Attrition
-- Enhances the effects of your luopan. Increases 
-- the rate at which your luopan consumes its HP.
-- Obtained: Geomancer Level 25
-- Recast Time: 5:00
-- Duration: Instant
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");

---------------------------------------------------

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil or not player:getPetID() == 102) then
        return MSGBASIC_REQUIRES_A_PET, 0;
    else
        return 0, 0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet();
    local add = math.floor((player:getMainLvl()/4) * 1.25);
	pet:setLocalVar("dot",add);
	pet:setLocalVar("potboost",125);
end;
