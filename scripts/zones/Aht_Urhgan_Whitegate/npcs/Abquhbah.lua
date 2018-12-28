-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Abquhbah
-- Standard Info NPC
-- Starts Mercenary Quests
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- player:startEvent(0x00FE);
	player:startEvent(255);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    local points = player:getVar("Mercenary_Points");
	if (points == 22500 and player:hasKeyItem(CAPTAIN_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(CAPTAIN_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, CAPTAIN_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",1250);
		player:killcs();
 	elseif (points < 22500 and player:hasKeyItem(FL_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 22500 to rank up.",0xD);
        player:killcs();		
	elseif (points == 20000 and player:hasKeyItem(FL_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(FL_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, FL_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",1050);
		player:killcs();
 	elseif (points < 20000 and player:hasKeyItem(SL_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 20000 to rank up.",0xD);
        player:killcs();		
	elseif (points == 17500 and player:hasKeyItem(SL_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(SL_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, SL_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",950);
		player:killcs();
 	elseif (points < 17500 and player:hasKeyItem(CS_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 17500 to rank up.",0xD);
        player:killcs();		
	elseif (points == 15000 and player:hasKeyItem(CS_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(CS_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, CS_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",850);
		player:killcs();
 	elseif (points < 15000 and player:hasKeyItem(SM_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 15000 to rank up.",0xD);
        player:killcs();		
	elseif (points == 12500 and player:hasKeyItem(SM_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(SM_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, SM_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",750);
		player:killcs();
 	elseif (points < 12500 and player:hasKeyItem(S_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 12500 to rank up.",0xD);
        player:killcs();		
 	elseif (points == 10000 and player:hasKeyItem(S_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(S_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, S_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",650); 
		player:killcs();
 	elseif (points < 10000 and player:hasKeyItem(C_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 10000 to rank up.",0xD);
        player:killcs();		
 	elseif (points == 7500 and player:hasKeyItem(C_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(C_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, C_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",550); 
		player:killcs();
 	elseif (points < 7500 and player:hasKeyItem(LC_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 7500 to rank up.",0xD);
        player:killcs();		
 	elseif (points == 5000 and player:hasKeyItem(LC_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(LC_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, LC_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",450); 
        player:killcs();		
 	elseif (points < 5000 and player:hasKeyItem(SP_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 5000 to rank up.",0xD);
        player:killcs();		
 	elseif (points == 2500 and player:hasKeyItem(SP_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(SP_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, SP_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",300); 
		player:killcs();
 	elseif (points < 2500 and player:hasKeyItem(PFC_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 2500 to rank up.",0xD);
        player:killcs();		
 	elseif (points == 1000 and player:hasKeyItem(PFC_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Congratulations! You have gain have gained a new Mercenary Rank!  Keep up the good work!",0xD);
	    player:addKeyItem(PFC_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, PFC_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",200); 
		player:killcs();
 	elseif (points < 1000 and player:hasKeyItem(PSC_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Besieged Points.  You need a total of 1000 to rank up.",0xD);
        player:killcs();		
 	elseif (player:hasKeyItem(PSC_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Looks like you haven't done any Besieged...help out the capital and gain some ranks.  Here is your first Wildcat Badge!",0xD);
	    player:addKeyItem(PSC_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED, PSC_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",150);
		player:killcs();
    end 		
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;