-----------------------------------
-- Ability: Full Circle
-- Sends the avatar away.
-- Obtained: Summoner Level 1
-- Recast Time: 10 seconds (shared by all avatars)
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet()
	local pethp = (pet:getHPP()/100);


	local mpcost = player:getVar("FullCircle");
	local returnmp = ((0.50 * mpcost) * pethp) * (1 + ((player:getMerit(MERIT_FULL_CIRCLE )) / 100));
	target:despawnPet();
	player:addMP(returnmp);
	player:messageBasic(MSGBASIC_RECOVERS_MP, 0, returnmp);
	-- add regen
	
end;