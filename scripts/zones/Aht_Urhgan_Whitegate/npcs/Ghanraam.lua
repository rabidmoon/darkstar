-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Ghanraam
--  Type: "Nyzul Weapon/Salvage Armor Storer,"
--  @pos 108.773 -6.999 -51.297 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local headitem = 747; -- Orichalcum Ingot
	local bodyitem = 686; -- Imperial Wootz Ingot
	local handitem = 730; -- Bloodwood Lumber
	local legitem = 2289; -- Wamoura Cloth
	local feetitem = 2152; -- Marid Leather
	local gold = 2187; -- Imperial Gold Pieces
	
	local aresbody15 = 14547;	
	local areslegs15 = 15626;	
	local areshands15 = 14962;
	local areshead15 = 16085;
	local aresfeet15 = 15712;
	
	local aresbody25 = 14548;	
	local areslegs25 = 15627;	
	local areshands25 = 14963;
	local areshead25 = 16086;
	local aresfeet25 = 15713;	
	
	local aresbody35 = 14549;	
	local areslegs35 = 15628;	
	local areshands35 = 14964;
	local areshead35 = 16087;
	local aresfeet35 = 15714;

	-- Skadi Full
    local skadibody = 14550;
    local skadilegs = 15629;
    local skadihands = 14965;
    local skadihead = 16088;
    local skadifeet = 15715;	
	
	-- Skadi Parts
	local skadibody15 = 14551;	
	local skadilegs15 = 15630;	
	local skadihands15 = 14966;
	local skadihead15 = 16089;
	local skadifeet15 = 15716;	
	
	local skadibody25 = 14552;	
	local skadilegs25 = 15631;	
	local skadihands25 = 14967;
	local skadihead25 = 16090;
	local skadifeet25 = 15717;	

	local skadibody35 = 14553;	
	local skadilegs35 = 15632;	
	local skadihands35 = 14968;
	local skadihead35 = 16091;
	local skadifeet35 = 15718;
	
	-- Usukane Full
	local usubody = 14554;
	local usulegs = 15633;
	local usuhands = 14969;
	local usuhead = 16092;
	local usufeet = 15719;
	
	-- Usukane Parts
	local usubody15 = 14555;	
	local usulegs15 = 15634;	
	local usuhands15 = 14970;
	local usuhead15 = 16093;
	local usufeet15 = 15720;	

	local usubody25 = 14556;	
	local usulegs25 = 15635;	
	local usuhands25 = 14971;
	local usuhead25 = 16094;
	local usufeet25 = 15721;

	local usubody35 = 14557;	
	local usulegs35 = 15636;	
	local usuhands35 = 14972;
	local usuhead35 = 16095;
	local usufeet35 = 15722;

    -- Marduk Full
	local mardukbody = 14558;	
	local marduklegs = 15637;	
	local mardukhands = 14973;
	local mardukhead = 16096;
	local mardukfeet = 15723;	
	
	-- Marduk Parts
	local mardukbody15 = 14559;	
	local marduklegs15 = 15638;	
	local mardukhands15 = 14974;
	local mardukhead15 = 16097;
	local mardukfeet15 = 15724;	

	local mardukbody25 = 14560;	
	local marduklegs25 = 15639;	
	local mardukhands25 = 14975;
	local mardukhead25 = 16098;
	local mardukfeet25 = 15725;	
	
	local mardukbody35 = 14561;	
	local marduklegs35 = 15640;	
	local mardukhands35 = 14976;
	local mardukhead35 = 16099;
	local mardukfeet35 = 15726;	

    -- Morrigan Full
	local morriganbody = 14562;	
	local morriganlegs = 15641;	
	local morriganhands = 14977;
	local morriganhead = 16100;
	local morriganfeet = 15727;	

    -- Morrigan Parts
	local morriganbody15 = 14563;	
	local morriganlegs15 = 15642;	
	local morriganhands15 = 14978;
	local morriganhead15 = 16101;
	local morriganfeet15 = 15728;

	local morriganbody25 = 14564;	
	local morriganlegs25 = 15643;	
	local morriganhands25 = 14979;
	local morriganhead25 = 16102;
	local morriganfeet25 = 15729;

	local morriganbody35 = 14565;	
	local morriganlegs35 = 15644;	
	local morriganhands35 = 14980;
	local morriganhead35 = 16103;
	local morriganfeet35 = 15730;	

    -- Ares Set
    if (trade:hasItem(areshead15) and trade:hasItem(areshead25) and trade:hasItem(areshead35) and trade:hasItemQty(headitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("AresHead",1);
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);
    elseif (trade:hasItem(aresbody15) and trade:hasItem(aresbody25) and trade:hasItem(aresbody35) and trade:hasItemQty(bodyitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("AresBody",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(areshands15) and trade:hasItem(areshands25) and trade:hasItem(areshands35) and trade:hasItemQty(handitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("AresHands",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(areslegs15) and trade:hasItem(areslegs25) and trade:hasItem(areslegs35) and trade:hasItemQty(legitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("AresLegs",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(aresfeet15) and trade:hasItem(aresfeet25) and trade:hasItem(aresfeet35) and trade:hasItemQty(feetitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("AresFeet",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    end	

    -- Skadi
    if (trade:hasItem(skadihead15) and trade:hasItem(skadihead25) and trade:hasItem(skadihead35) and trade:hasItemQty(headitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("SkadiHead",1);
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);
    elseif (trade:hasItem(skadibody15) and trade:hasItem(skadibody25) and trade:hasItem(skadibody35) and trade:hasItemQty(bodyitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("SkadiBody",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(skadihands15) and trade:hasItem(skadihands25) and trade:hasItem(skadihands35) and trade:hasItemQty(handitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("SkadiHands",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(skadilegs15) and trade:hasItem(skadilegs25) and trade:hasItem(skadilegs35) and trade:hasItemQty(legitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("SkadiLegs",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(skadifeet15) and trade:hasItem(skadifeet25) and trade:hasItem(skadifeet35) and trade:hasItemQty(feetitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("SkadiFeet",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    end	

    -- Usukane
    if (trade:hasItem(usuhead15) and trade:hasItem(usuhead25) and trade:hasItem(usuhead35) and trade:hasItemQty(headitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("UsuHead",1);
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);
    elseif (trade:hasItem(usubody15) and trade:hasItem(usubody25) and trade:hasItem(usubody35) and trade:hasItemQty(bodyitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("UsuBody",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(usuhands15) and trade:hasItem(usuhands25) and trade:hasItem(usuhands35) and trade:hasItemQty(handitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("UsuHands",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(usulegs15) and trade:hasItem(usulegs25) and trade:hasItem(usulegs35) and trade:hasItemQty(legitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("UsuLegs",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(usufeet15) and trade:hasItem(usufeet25) and trade:hasItem(usufeet35) and trade:hasItemQty(feetitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("UsuFeet",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    end
	
    -- Marduk
    if (trade:hasItem(mardukhead15) and trade:hasItem(mardukhead25) and trade:hasItem(mardukhead35) and trade:hasItemQty(headitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MardukHead",1);
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);
    elseif (trade:hasItem(mardukbody15) and trade:hasItem(mardukbody25) and trade:hasItem(mardukbody35) and trade:hasItemQty(bodyitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MardukBody",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(mardukhands15) and trade:hasItem(mardukhands25) and trade:hasItem(mardukhands35) and trade:hasItemQty(handitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MardukHands",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(marduklegs15) and trade:hasItem(marduklegs25) and trade:hasItem(marduklegs35) and trade:hasItemQty(legitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MardukLegs",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(mardukfeet15) and trade:hasItem(mardukfeet25) and trade:hasItem(mardukfeet35) and trade:hasItemQty(feetitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MardukFeet",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    end

    -- Morrigan
    if (trade:hasItem(morriganhead15) and trade:hasItem(morriganhead25) and trade:hasItem(morriganhead35) and trade:hasItemQty(headitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MorriganHead",1);
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);
    elseif (trade:hasItem(morriganbody15) and trade:hasItem(morriganbody25) and trade:hasItem(morriganbody35) and trade:hasItemQty(bodyitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MorriganBody",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(morriganhands15) and trade:hasItem(morriganhands25) and trade:hasItem(morriganhands35) and trade:hasItemQty(handitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MorriganHands",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(morriganlegs15) and trade:hasItem(morriganlegs25) and trade:hasItem(morriganlegs35) and trade:hasItemQty(legitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MorriganLegs",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    elseif (trade:hasItem(morriganfeet15) and trade:hasItem(morriganfeet25) and trade:hasItem(morriganfeet35) and trade:hasItemQty(feetitem,6) and trade:hasItemQty(gold,10)) then
        player:setVar("SalvageArmorWait",os.time());
		player:setVar("MorriganFeet",1);		
        trade:complete();
		player:PrintToPlayer("Ghanraam : We will get to work on this item right away.  Please check back in 1 day." ,0x0D);		
    end		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local currentTime = os.time();
	local armorwait = player:getVar("SalvageArmorWait",os.time());
	local pickup = (currentTime - armorwait)

    if (player:getVar("Ghanraam") ~= 1) then
	    player:startEvent(814);
	    player:setVar("Ghanraam",1);
	elseif (pickup < 3600) then  -- Amor Not Ready CS
	    player:startEvent(826);	

	elseif (pickup > 3600 and armorwait > 0) then  -- Armor Ready Dialog
        player:startEvent(827);	
	elseif (player:getVar("Ghanraam") == 1) then
	    player:startEvent(815);
	end
	-- 814 listing
	-- 815 retreive armor
	-- 816

	-- 826 It's being crafted
	-- 827 Here's your armor
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	-- Ares Full
	local aresbody = 14546;	
	local areslegs = 15625;	
	local areshands = 14961;
	local areshead = 16084;
	local aresfeet = 15711;

	-- Skadi Full
    local skadibody = 14550;
    local skadilegs = 15629;
    local skadihands = 14965;
    local skadihead = 16088;
    local skadifeet = 15715;

	-- Usukane Full
	local usubody = 14554;
	local usulegs = 15633;
	local usuhands = 14969;
	local usuhead = 16092;
	local usufeet = 15719;
	
    -- Marduk Full
	local mardukbody = 14558;	
	local marduklegs = 15637;	
	local mardukhands = 14973;
	local mardukhead = 16096;
	local mardukfeet = 15723;	

    -- Morrigan Full
	local morriganbody = 14562;	
	local morriganlegs = 15641;	
	local morriganhands = 14977;
	local morriganhead = 16100;
	local morriganfeet = 15727;		
	
    -- Ares Set
	if (csid == 827 and player:getVar("AresHead") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(areshead); 
            player:messageSpecial(ITEM_OBTAINED,areshead);
			player:setVar("AresHead",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,areshead)
		end
	elseif (csid == 827 and player:getVar("AresBody") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(aresbody); 
            player:messageSpecial(ITEM_OBTAINED,aresbody);
			player:setVar("AresBody",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,aresbody)
		end		
	elseif (csid == 827 and player:getVar("AresHands") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(areshands); 
            player:messageSpecial(ITEM_OBTAINED,areshands);
			player:setVar("AresHands",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,areshands)
		end
	elseif (csid == 827 and player:getVar("AresLegs") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(areslegs); 
            player:messageSpecial(ITEM_OBTAINED,areslegs);
			player:setVar("AresLegs",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,areslegs)
		end
	elseif (csid == 827 and player:getVar("AresFeet") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(aresfeet); 
            player:messageSpecial(ITEM_OBTAINED,aresfeet);
			player:setVar("AresFeet",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,aresfeet)
		end	
    -- Skadi Set
	elseif (csid == 827 and player:getVar("SkadiHead") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(skadihead); 
            player:messageSpecial(ITEM_OBTAINED,skadihead);
			player:setVar("SkadiHead",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,skadihead)
		end
	elseif (csid == 827 and player:getVar("SkadiBody") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(skadibody); 
            player:messageSpecial(ITEM_OBTAINED,skadibody);
			player:setVar("SkadiBody",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,skadibody)
		end		
	elseif (csid == 827 and player:getVar("SkadiHands") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(skadihands); 
            player:messageSpecial(ITEM_OBTAINED,skadihands);
			player:setVar("SkadiHands",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,skadihands)
		end
	elseif (csid == 827 and player:getVar("SkadiLegs") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(skadilegs); 
            player:messageSpecial(ITEM_OBTAINED,skadilegs);
			player:setVar("SkadiLegs",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,skadilegs)
		end
	elseif (csid == 827 and player:getVar("SkadiFeet") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(skadifeet); 
            player:messageSpecial(ITEM_OBTAINED,skadifeet);
			player:setVar("SkadiFeet",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,skadifeet)
		end	
    -- Usu Set
	elseif (csid == 827 and player:getVar("UsuHead") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(usuhead); 
            player:messageSpecial(ITEM_OBTAINED,usuhead);
			player:setVar("UsuHead",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,usuhead)
		end
	elseif (csid == 827 and player:getVar("UsuBody") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(usubody); 
            player:messageSpecial(ITEM_OBTAINED,usubody);
			player:setVar("UsuBody",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,usubody)
		end		
	elseif (csid == 827 and player:getVar("UsuHands") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(usuhands); 
            player:messageSpecial(ITEM_OBTAINED,usuhands);
			player:setVar("UsuHands",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,usuhands)
		end
	elseif (csid == 827 and player:getVar("UsuLegs") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(usulegs); 
            player:messageSpecial(ITEM_OBTAINED,usulegs);
			player:setVar("UsuLegs",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,usulegs)
		end
	elseif (csid == 827 and player:getVar("UsuFeet") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(usufeet); 
            player:messageSpecial(ITEM_OBTAINED,usufeet);
			player:setVar("UsuFeet",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,usufeet)
		end
    -- Marduk Set
	elseif (csid == 827 and player:getVar("MardukHead") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(mardukhead); 
            player:messageSpecial(ITEM_OBTAINED,mardukhead);
			player:setVar("MardukHead",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,mardukhead)
		end
	elseif (csid == 827 and player:getVar("MardukBody") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(mardukbody); 
            player:messageSpecial(ITEM_OBTAINED,mardukbody);
			player:setVar("MardukBody",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,mardukbody)
		end		
	elseif (csid == 827 and player:getVar("MardukHands") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(mardukhands); 
            player:messageSpecial(ITEM_OBTAINED,mardukhands);
			player:setVar("MardukHands",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,mardukhands)
		end
	elseif (csid == 827 and player:getVar("MardukLegs") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(marduklegs); 
            player:messageSpecial(ITEM_OBTAINED,marduklegs);
			player:setVar("MardukLegs",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,marduklegs)
		end
	elseif (csid == 827 and player:getVar("MardukFeet") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(mardukfeet); 
            player:messageSpecial(ITEM_OBTAINED,mardukfeet);
			player:setVar("MardukFeet",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,mardukfeet)
		end
    -- Morrigan Set
	elseif (csid == 827 and player:getVar("MorriganHead") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(morriganhead); 
            player:messageSpecial(ITEM_OBTAINED,morriganhead);
			player:setVar("MorriganHead",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,morriganhead)
		end
	elseif (csid == 827 and player:getVar("MorriganBody") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(morriganbody); 
            player:messageSpecial(ITEM_OBTAINED,morriganbody);
			player:setVar("MorriganBody",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,morriganbody)
		end		
	elseif (csid == 827 and player:getVar("MorriganHands") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(morriganhands); 
            player:messageSpecial(ITEM_OBTAINED,morriganhands);
			player:setVar("MorriganHands",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,morriganhands)
		end
	elseif (csid == 827 and player:getVar("MorriganLegs") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(morriganlegs); 
            player:messageSpecial(ITEM_OBTAINED,morriganlegs);
			player:setVar("MorriganLegs",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,morriganlegs)
		end
	elseif (csid == 827 and player:getVar("MorriganFeet") == 1) then
	    if (player:getFreeSlotsCount() > 0) then
		    player:addItem(morriganfeet); 
            player:messageSpecial(ITEM_OBTAINED,morriganfeet);
			player:setVar("MorriganFeet",0);
			player:setVar("SalvageArmorWait",0);
        else
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,morriganfeet)
		end
    end		
		
		
		
		
		
end;

