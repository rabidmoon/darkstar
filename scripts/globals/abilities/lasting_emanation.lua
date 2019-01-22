---------------------------------------------------
-- Ability: Lasting Emination
-- Reduces the amount of HP your luopan consumes.
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
    local add = math.floor((player:getMainLvl()/4) * 0.61);
	pet:setLocalVar("dot",add);
end;
