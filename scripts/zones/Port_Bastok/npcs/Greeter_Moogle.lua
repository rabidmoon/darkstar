




function onTrigger(player,npc)
    local zenni = player:getCurrency("zeni_point");
	player:startEvent(0x425,10,zenni,1250,2500,5000,10000,170,0);
end