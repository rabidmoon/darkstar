Besieged = {


    mobs = {
        -- Undead Wave
        [1] = {
		    mobs_start = 16974026,
            mobs_end = 16974126,
        },
        -- The Black Coffin - Wave 2
        [2] = {
		    -- npc_start = 16974135,
			npc_start = 16974143,
			npc_end = 16974145,
			-- npc_end = 16974197,
        }
    },
	
	
	acnms = {
	
		-- Arrapago Helpers
	    [1] = {
		    hahelper_start = 17031742,
			hahelper_end = 17031753,
		},
        -- Mirrors middle left right
        [2] = {
            hamirror_start = 17043847, 
            hamirror_end = 17043849,			
		},
        [3] = {
            acnms_start = 17031565, 
            acnms_end = 17031567,			
		},		

	},
	
	halvunghelpers = {
	    [1] = 17031742, -- Helper 1
	    [2] = 17031743, -- Helper 2
	    [3] = 17031744, -- Helper 3
	    [4] = 17031745, -- Helper 4
	    [5] = 17031746, -- Helper 5
	    [6] = 17031747, -- Helper 6
	    [7] = 17031748, -- Helper 7
	    [8] = 17031749, -- Helper 8
	    [9] = 17031750, -- Helper 9
	    [10] = 17031751, -- Helper 10
	    [11] = 17031752, -- Helper 11
	    [12] = 17031753, -- Helper 12
	    -- [13] = 17044072, -- Helper 13			
	},	

    mirrors = {
	    -- helps seige helpers randomly choose a mirror
	    [1] = 17031568, -- Mirror 1
	    [2] = 17031569, -- Mirror 2
	    [3] = 17031570, -- Mirror 3
    },
	
	nmmobs = {
	    -- helper mobs
        [1] = {
            NM_HELPER_1 = 17031759,
            NM_HELPER_2 = 17031760,
            NM_HELPER_3 = 17031761,	
            NM_HELPER_4 = 17031762,
            NM_HELPER_5 = 17031763,
            NM_HELPER_6 = 17031764,		
        },
	},
}

return Besieged