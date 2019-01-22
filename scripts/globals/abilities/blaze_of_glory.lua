---------------------------------------------------
-- Ability: Blaze of Glory
-- Increases the effects of your next applicable 
-- geomancy spell. Consumes half of that luopan's HP.
-- Obtained: Geomancer Level 60
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

        return 0, 0;

end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:addStatusEffect(EFFECT_BLAZE_OF_GLORY,1,3,60);
end;
