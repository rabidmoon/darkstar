---------------------------------------------------
-- Ability: Life Cycle
-- Distributes one fourth of your HP to your luopan.
-- Obtained: Geomancer Level 50
-- Recast Time: 10:00
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
    local hp = player:getHP()/4;
	local pet = player:getPet();
	player:delHP(hp); 
	pet:addHP(hp);
    pet:messageBasic(MSGBASIC_RECOVERS_HP, 0, hp);
end;
