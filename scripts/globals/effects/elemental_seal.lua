-----------------------------------
--
-- 	EFFECT_ELEMENTAL_SEAL
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_MACC,256);
   target:addMod(MOD_MAGIC_DAMAGE,20);
   target:addMod(MOD_CONSERVE_MP,40);


-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_MACC,256);
	target:delMod(MOD_MAGIC_DAMAGE,20);
	target:delMod(MOD_CONSERVE_MP,40);
end;


