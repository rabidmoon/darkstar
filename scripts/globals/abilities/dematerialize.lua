---------------------------------------------------
-- Ability: Dematerialize
-- Prevents your luopan from receiving damage.
-- Obtained: Geomancer Level 25
-- Recast Time: 10:00
-- Duration: 1:00
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
    player:addStatusEffect(EFFECT_DEMATERIALIZE,1,3,60);
end;
