-----------------------------------
-- Ability: Activate
-- Calls forth your automaton.
-- Obtained: Puppetmaster Level 1
-- Recast Time: 0:20:00 (0:16:40 with full merits)
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

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
    local pet = player:getPet();
	local proxyMob = pet:getTargetsWithinArea(9.5, 16);

	for i,monsters in ipairs(proxyMob) do
	    if (monsters:getObjType() == TYPE_MOB) then
            player:petAttack(monsters);		    
		end
	end	
	
	-- pet:useMobAbility(10);
end;