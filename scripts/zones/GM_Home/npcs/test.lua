-----------------------------------
-- Area: GM Home
--  NPC: Trader
-- Type: Debug NPC for testing trades.
-----------------------------------
package.loaded["scripts/zones/GM_Home/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/GM_Home/TextIDs");
require("scripts/globals/augments");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- First get the users rank for the item
	local pointsa = 10;
	local pointsb = 50;
	local pointsc = 100;
	local stoneaqty = 0;
	local stonebqty = 0;
	local stonecqty = 0;
	local rpvar = "TEST";
	local rankvar = "TEST2";
	local rank = 0;
	

	

	for k, armor in pairs(allarmor) do 
        if (trade:hasItemQty(armor,1)) then
		    -- First lets check what the type is going to be
		    for headtype, armortype in pairs(headcheck) do
			    if (headtype == armor) then
				    head = armor;
				end
			end
	    -- find out the type of item being traded.  ex if trade has Item Snow then path = woeArmorA       
		    local path = woeArmorA;
			calcRank(player, trade, rankvar, rpvar, armor)
				-- Get the sone quantity and multiply
	        for t, stones in pairs(duskorb) do
		        if (stones == 4096) then
			        stoneaqty = trade:getItemQty(4096)
			    end
			    if (stones == 8964) then
			        stonebqty = trade:getItemQty(8964)
			    end
			    if (stones == 8965) then
			        stonecqty = trade:getItemQty(8965)
			    end
			end	
			local rp = player:getVar(rpvar);

	        local totalpoints = (stoneaqty * pointsa) + (stonebqty * pointsb) + (stonecqty * pointsc);	
            local playerrp = totalpoints + rp;	
            for s=1, #totalrp, 1 do
                if (totalrp[s] > playerrp) then
                    local over = playerrp - totalrp[s-1];
					player:setVar(rankvar,s-1);
                    break;
                elseif (totalrp[s] == playerrp) then
                    local over = playerrp - totalrp[s];
					player:setVar(rankvar,s);
					printf("Rank is %u",s);

                    break;					
               end
            end
			local rank = player:getVar(rankvar);
            printf("Local Rank is: %u",rank);			
            for nb = 1, #woeArmorA[rank], 2 do
                if(armor == path[rank][nb]) then
                    local a1 = path[rank][nb+1][1];
                    local v1 = path[rank][nb+1][2];
                    local a2 = path[rank][nb+1][3];
                    local v2 = path[rank][nb+1][4];
                    local a3 = path[rank][nb+1][5];
                    local v3 = path[rank][nb+1][6];
                    local a4 = path[rank][nb+1][7];
                    local v4 = path[rank][nb+1][8];
                    local a5 = path[rank][nb+1][9];
      					
                    player:addItem(armor,1,a1,v1,a2,v2,a3,v3,a4,v4,a5);
                end
            end
		end
	end

	-- print(totalpoints);

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    printf("Good to go");
    -- player:startEvent(127);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;