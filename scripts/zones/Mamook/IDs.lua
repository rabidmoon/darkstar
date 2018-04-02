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
		    mahelper_start = 17044060,
			mahelper_end = 17044072,
		},
        -- Mirrors middle left right
        [2] = {
            mamirror_start = 17043847, 
            mamirror_end = 17043849,			
		},
        [3] = {
            acnms_start = 17043872, 
            acnms_end = 17043874,			
		},		

	},
	
	mamookhelpers = {
	    [1] = 17044060, -- Helper 1
	    [2] = 17044061, -- Helper 2
	    [3] = 17044062, -- Helper 3
	    [4] = 17044063, -- Helper 4
	    [5] = 17044064, -- Helper 5
	    [6] = 17044065, -- Helper 6
	    [7] = 17044066, -- Helper 7
	    [8] = 17044067, -- Helper 8
	    [9] = 17044068, -- Helper 9
	    [10] = 17044069, -- Helper 10
	    [11] = 17044070, -- Helper 11
	    [12] = 17044071, -- Helper 12
	    [13] = 17044072, -- Helper 13			
	},	

    mirrors = {
	    -- helps seige helpers randomly choose a mirror
	    [1] = 17043847, -- Mirror 1
	    [2] = 17043848, -- Mirror 2
	    [3] = 17043849, -- Mirror 3
    },
	
	nmmobs = {
	    -- helper mobs
        [1] = {
            NM_HELPER_1 = 16999086,
            NM_HELPER_2 = 16999087,
            NM_HELPER_3 = 16999088,	
            NM_HELPER_4 = 16999089,
            NM_HELPER_5 = 16999090,
            NM_HELPER_6 = 16999091,
            NM_HELPER_7 = 16999092,
            NM_HELPER_8 = 16999093,			
        },
	},
}

return Besieged