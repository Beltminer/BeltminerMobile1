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
	-- Params
	------------------
	
	------------------
	-- Imports
	------------------
	
	local ui = require ( "modules.ui" )
    local images = require ( "modules.images" )
	
	------------------
	-- Label
	------------------
	
	--local vLabel = "MY PAGE"
	local vReload = false
	--
	if type( params ) == "table" then
		--
		if type( params.label ) == "string" then
			vLabel = params.label
		end
		--
		if type( params.reload ) == "boolean" then
			vReload = params.reload
		end
		--
	end
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	------------------
	-- Display Objects
	------------------
	
	local background = display.newImage( images.BACKGROUND2 )
	--local title = display.newText( vLabel, 0, 0, Tahoma, 47 )
	--local msgLabel = display.newText( "You get free fuel until level 20. Complete your missions now!", 0, 0, 410, 0, Tahoma, 36 ) -- make dynamic
	local headerHUD = display.newImage( images.GROUND )
	local footerHUD = display.newImage( images.GROUND )
	local claimTitle = display.newText( "YOUR CLAIMS", 0, 0, Tahoma, 40 )
	local probeTitle = display.newText( "LAUNCH PROBES", 0, 0, Tahoma, 40 )	
	------------------
	-- Functions
	------------------
	
	--Standard Hud Buttons
	local bt01t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.missions", "overFromRight" )
		end
	end
	--
	local bt02t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromLeft" )
		end
	end
	--
	local bt03t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromTop" )
		end
	end
	--
	local bt04t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.claimInfo", "overFromRight" )
		end
	end
	--
	local bt05t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.myPage", "flip" )
		end
	end
	--
	local bt06t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen1", "downFlip" ) --previously screen2
		end
	end
	--
	local bt07t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.asteroids", "fade" )
		end
	end
	-- Special Buttons
	local bt08t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.claimInfo", "overFromRight" )
		end
	end
	--
	local bt09t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.stakeClaim", "overFromRight" )
		end
	end
	--
	local bt10t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.requiresSignatory", "overFromRight" )
		end
	end
		--
	local bt11t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.requiresDeed", "overFromRight" )
		end
	end
	--
	local bt12t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.requiresDeed", "overFromRight" )
		end
	end
	------------------
	-- UI Objects
	------------------
	
	-- STANDARD HUD BUTTONS
	
	local bt01 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "MISSIONS",
					size = 40,
					font = "Tahoma",
					onEvent = bt01t,
					id = "bt01"
	}
	--
	local bt02 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 40,
					font = "Tahoma",
					onEvent = bt02t,
					id = "bt02"
	}
	--
	local bt03 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "STORAGE",
					size = 40,
					font = "Tahoma",
					onEvent = bt03t,
					id = "bt03"
	}
	--
	local bt05 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "MY PAGE",
					size = 40,
					font = "Tahoma",
					onEvent = bt05t,
					id = "bt05"
	}
	--
	local bt06 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "HOME",
					size = 60,
					font = "Tahoma",
					onEvent = bt06t,
					id = "bt06"
	}
	--
	local bt07 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "ASTEROIDS",
					size = 40,
					font = "Tahoma",
					onEvent = bt07t,
					id = "bt07"
	}
	
	-- SPECIAL BUTTONS
	
	--
	-- CLAIM SLOT BUTTON
	--
    local bt04 = ui.newButton{
                    default = images.CLAIM_SLOT_UP,
                    over = images.CLAIM_SLOT_DOWN,
--                    text = "INBOX",
--                    size = 50,
--                    font = "Tahoma",
                    onEvent = bt04t, --previously bt04t
                    id = "bt04"
    }
	--
	local bt08 = ui.newButton{
					default = images.CLAIM_SLOT_UP,
					over = images.CLAIM_SLOT_DOWN,
					--text = "CLAIM GIFTS",
					--size = 50,
					--font = "Tahoma",
					onEvent = bt08t, --previously bt04t
					id = "bt08"
	}
	local bt09 = ui.newButton{
					default = images.STAKE_CLAIM_UP,
					over = images.STAKE_CLAIM_DOWN,
					--text = "ADD FRIENDS",
					--size = 50,
					--font = "Tahoma",
					onEvent = bt09t, --previously bt04t
					id = "bt09"
	}
	local bt10 = ui.newButton{
					default = images.REQUIRES_SIGNATORY_UP,
					over = images.REQUIRES_SIGNATORY_DOWN,
					--text = "SETTINGS",
					--size = 50,
					--font = "Tahoma",
					onEvent = bt10t, --previously bt04t
					id = "bt10"
	}
	local bt11 = ui.newButton{
					default = images.REQUIRES_DEED_UP,
					over = images.REQUIRES_DEED_DOWN,
					--text = "ADD FRIENDS",
					--size = 50,
					--font = "Tahoma",
					onEvent = bt11t, --previously bt04t
					id = "bt11"
	}
	local bt12 = ui.newButton{
					default = images.REQUIRES_DEED_UP,
					over = images.REQUIRES_DEED_DOWN,
					--text = "SETTINGS",
					--size = 50,
					--font = "Tahoma",
					onEvent = bt12t, --previously bt04t
					id = "bt12"
	}
	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	------------------
	-- Listeners
	------------------
	
	local touched = function ( event )
		if event.phase == "ended" then
			if vReload then
				director:changeScene( { label="Scene Reloaded" }, "modules.screen2","moveFromRight" )
			else
				director:changeScene( "modules.screen1", "crossfade" )
			end
		end
	end
	
	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	local initVars = function ()
		
		------------------
		-- Inserts
		------------------
		
		localGroup:insert( background )
		--localGroup:insert( title )
		localGroup:insert( headerHUD )
		localGroup:insert( footerHUD )
		localGroup:insert( bt01 )
		localGroup:insert( bt02 )
		localGroup:insert( bt03 )
		localGroup:insert( bt04 )
		localGroup:insert( bt05 )
		localGroup:insert( bt06 )
		localGroup:insert( bt07 )
		localGroup:insert( bt08 )
		localGroup:insert( bt09 )
		localGroup:insert( bt10 )
		localGroup:insert( bt11 )
		localGroup:insert( bt12 )
		localGroup:insert( claimTitle )	
		localGroup:insert( probeTitle )		
		------------------
		-- Positions
		------------------
		--
		--title.x = 325
		--title.y = 160
		--
		headerHUD.x = 320
		headerHUD.y = 52.5
		--
		footerHUD.x = 320
		footerHUD.y = 907.5
		-- Missions Button
		bt01.x = 325
		bt01.y = 910
		-- My Page Button
		bt02.x = 115
		bt02.y = 910
		-- Upgrades Button
		bt03.x = 535
		bt03.y = 910
		-- Claim Button
		bt04.x = 110
		bt04.y = 300
		-- Back Button
		bt05.x = 115
		bt05.y = 55
		-- Home Button
		bt06.x = 325
		bt06.y = 55
		-- Next Button
		bt07.x = 535
		bt07.y = 55
		-- Claim Button
		bt08.x = 325
		bt08.y = 300 
		-- Claim Button
		bt09.x = 535
		bt09.y = 300	
		-- Claim Button
		bt10.x = 110
		bt10.y = 510  		
		-- Claim Button
		bt11.x = 325
		bt11.y = 510	
		-- Claim Button
		bt12.x = 535
		bt12.y = 510  	
		--
		claimTitle.x = 155
		claimTitle.y = 155	
		--		
		--
		probeTitle.x = 185
		probeTitle.y = 650	
		--
		------------------
		-- Colors
		------------------
		
		--title:setTextColor( 152,152,152 )
		
		------------------
		-- Listeners
		------------------
		
		background:addEventListener( "touch" , touched )
		
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
