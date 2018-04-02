Besieged = {

    text = {
        -- General Texts
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6391, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6392, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!

        -- Assault Texts
        TIME_TO_COMPLETE       = 7402, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED         = 7403, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES = 7407, -- Time remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS = 7408, -- Time remaining: <number> [second/seconds] (Earth time).
        FADES_INTO_NOTHINGNESS = 7409, -- The <itemZ fades into nothingness...
        PARTY_FALLEN           = 7410, -- All party members have fallen in battle. Mission failure in <number> [minute/minutes].

        -- The Black Coffin
        BATTLE_HIGH_SEAS      = 7565, -- A battle on the high seas? My warrior's spirit soars in anticipation!
        TIME_IS_NEAR          = 7566, -- My time is near...
        SO_I_FALL             = 7567, -- And so I fall...
        SWIFT_AS_LIGHTNING    = 7568, -- Swift as lightning...!
        HARNESS_THE_WHIRLWIND = 7569, -- Harness the whirlwind...!
        STING_OF_MY_BLADE     = 7570, -- Feel the sting of my blade!
        UNNATURAL_CURS        = 7571, -- Unnatural curs!
        OVERPOWERED_CREW      = 7572, -- You have overpowered my crew...
        TEST_YOUR_BLADES      = 7573, -- I will test your blades. Prepare to join your ancestors...
        FOR_THE_BLACK_COFFIN  = 7574, -- For the Black Coffin!
        FOR_EPHRAMAD          = 7575, -- For Ephramad!
        TROUBLESOME_SQUABS    = 7576  -- Troublesome squabs...
    },
	
	mobpath = {
	        -- Left Side bottom Floor to AC
	        [1] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
			-- Left Side Bottom Floor to the right at main area make a circle around I-10
		    [2] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
				 39, 0, 18, -- Make right towards right side, stairs are on the right to go up
				 40, 0, -18, -- End of hallway can go left or right at this point
				 60, 0, -23,
				 58, 0, -50,
				 33, 0, -52
	        },	    
			-- Right Side bottom floor to AC
		    [3] = {
		        -79, 2, 40,
				-58, 0, 39,
                -32, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding			
	        },
			-- Right Side bottom floor to the right at main area make a circle around I-10
		    [4] = {
		        -79, 2, 40,
                -32, 0, 40,
			     20, 0, 40, -- Main area near AC
				 39, 0, 18, -- Make right towards right side, stairs are on the right to go up
				 40, 0, -18, -- End of hallway can go left or right at this point
				 60, 0, -23,
				 58, 0, -50,
				 33, 0, -52		
	        },
	        -- Left Side Up and down stairs to AC via stairs to hall of binding
	        [5] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
                 9, -6, 55, -- Go Up the Stairs thru the hall
				16, -6, 60, -- Slight left
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Left Side Up and down stairs to the right at main area make a circle around I-10
	        [6] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
                 9, -6, 55, -- Go Up the Stairs thru the hall
                 12, -6, 18,
				 39, 0, 18, -- Make right towards right side, stairs are on the right to go up
				 40, 0, -18, -- End of hallway can go left or right at this point
				 60, 0, -23,
				 58, 0, -50,
				 33, 0, -52						 
				 
	        },	
	        -- Left Side on 1st floor thru main tunnel all the way to back near zone	
	        [7] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC			
			     74, 0, 46, -- Back near Whitegate Zone on left
	        },
	        -- Left Side on 1st floor thru main tunnel all the way to back near zone	
	        [8] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC			
			     86, 0, 37, -- Back near Whitegate Zone on right
	        },	
      
            -- List of Quadrants to go back to the Astral Candy	  
	        -- Quadrant 1
	        [9] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 2			
	        [10] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 3			
	        [11] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 4				
	        [12] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 5				
	        [13] = {
                39, 0, 40,
                39, 0, 56,
	            40, 0, 99,
	            62, 0, 119,
	            85, 2, 120,
	        },		
		
	},
	

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
	
	npcs = {
	
	    [1] = {
		    npc_start = 16974275,
			npc_end = 16974314,
		},
		-- NPC Helpers to fight
	    [2] = {
		    npc_start = 16974140,
			npc_end = 16974195,
		},		
		
	},
	
	acnms = {
	
	    [1] = {
		-- Lamia in Arrapago
		    acnms_start = 16998835,
			acnms_end = 16998837,
		},
		-- Arrapago Helpers
	    [2] = {
		    arhelper_start = 16999068,
			arhelper_end = 16999080,
		},
        -- Mirrors middle left right
        [3] = {
            armirror_start = 16998838, 
            armirror_end = 16998840,			
		},

	},

    mirrors = {
	    -- helps seige helpers randomly choose a mirror
	    [1] = 16998838, -- Mirror 1
	    [2] = 16998839, -- Mirror 2
	    [3] = 16998840, -- Mirror 3
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