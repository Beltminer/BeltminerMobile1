module(..., package.seeall)

--====================================================================--
-- SCENE: ASTEROIDS
--====================================================================--

--[[

******************
 - INFORMATION
******************

--]]

new = function ( params )

	------------------
	-- Imports
	------------------
	
	local ui = require ( "modules.ui" )
    local images = require ( "modules.images" )
    local hud = require ( "modules.buttonFrame" )
	

	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	------------------
	-- Display Objects
	------------------
	
--	local background = display.newImage( images.MY_PAGE_SCREEN ) 
    local claimTitle = display.newText( "YOUR CLAIMS", 0, 0, Tahoma, 40 )
    local probeTitle = display.newText( "LAUNCH PROBES", 0, 0, Tahoma, 40 )

    ------------------
	-- Functions
	------------------
	
	--
	local btGoClaimInfo = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.claimInfo", "overFromBottom" )
		end
	end
	--
	--
	local btGoScreen2 = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "downFlip" )
		end
	end

    local btGoClaimSlot = function ( event )
        if event.phase == "release" then
            director:changeScene( "modules.claimSlot", "crossfade" )
        end
    end
	--
	local btGoStakeClaim = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.stakeClaim", "overFromBottom" )
		end
	end
	--
	local btRequireSignatory = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.requiresSignatory", "overFromRight" )
		end
	end
		--
	local btRequiresDeed = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.requiresDeed", "overFromRight" )
		end
	end
	--
	------------------
	-- UI Objects
	------------------

	-- SPECIAL BUTTONS
	
	--
	-- CLAIM SLOT BUTTON
	--
    local buttonClaimSlot1 = ui.newButton{
                    default = images.CLAIM_SLOT_UP,
                    over = images.CLAIM_SLOT_DOWN,
                    onEvent = btGoClaimInfo,
                    id = "buttonClaimSlot1"
    }
	--
	local buttonClaimSlot2 = ui.newButton{
					default = images.CLAIM_SLOT_UP,
					over = images.CLAIM_SLOT_DOWN,
					onEvent = btGoClaimInfo,
					id = "buttonClaimSlot2"
	}
	local buttonStakeClaim = ui.newButton{
					default = images.STAKE_CLAIM_UP,
					over = images.STAKE_CLAIM_DOWN,
					onEvent = btGoStakeClaim,
					id = "buttonStakeClaim"
	}
	local buttonRequiresSignatory = ui.newButton{
					default = images.REQUIRES_SIGNATORY_UP,
					over = images.REQUIRES_SIGNATORY_DOWN,
					onEvent = btRequireSignatory,
					id = "buttonRequiresSignatory"
	}
	local buttonRequiresDeed1 = ui.newButton{
					default = images.REQUIRES_DEED_UP,
					over = images.REQUIRES_DEED_DOWN,
					onEvent = btRequiresDeed,
					id = "buttonRequiresDeed1"
	}
	local buttonRequiresDeed2 = ui.newButton{
					default = images.REQUIRES_DEED_UP,
					over = images.REQUIRES_DEED_DOWN,
					onEvent = btRequiresDeed,
					id = "buttonRequiresDeed2"
    }

    local middleGridGroup = display.newGroup()

	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	local initVars = function ()
		
		------------------
		-- Inserts
		------------------
		
--		localGroup:insert( background )
        middleGridGroup:insert(buttonClaimSlot1)
        middleGridGroup:insert(buttonClaimSlot2)
        middleGridGroup:insert(buttonStakeClaim)
        middleGridGroup:insert(buttonRequiresSignatory)
        middleGridGroup:insert(buttonRequiresDeed1)
        middleGridGroup:insert(buttonRequiresDeed2)
        localGroup:insert(middleGridGroup)
        localGroup:insert( claimTitle )
        localGroup:insert( probeTitle )
        localGroup:insert( hud.new({label="asteroids"}) )
		------------------
		-- Positions
		------------------

		--
        middleGridGroup.x = 0
        middleGridGroup.y = 100

		-- Claim Button
		buttonClaimSlot1.x = 110
		buttonClaimSlot1.y = 214
		-- Claim Button
		buttonClaimSlot2.x = 325
		buttonClaimSlot2.y = 214
		-- Claim Button
		buttonStakeClaim.x = 535
		buttonStakeClaim.y = 214
		-- Claim Button
		buttonRequiresSignatory.x = 110
		buttonRequiresSignatory.y = 425
		-- Claim Button
		buttonRequiresDeed1.x = 325
		buttonRequiresDeed1.y = 425
		-- Claim Button
		buttonRequiresDeed2.x = 535
		buttonRequiresDeed2.y = 425
        
        claimTitle.x = 155
        claimTitle.y = 155
        --		
        --
        probeTitle.x = 185
        probeTitle.y = 650

	end
	
	------------------
	-- Initiate variables
	------------------
	
	initVars()
	
	------------------
	-- MUST return a display.newGroup()
	------------------
	
	return localGroup
	
end
