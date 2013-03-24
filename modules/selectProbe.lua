module(..., package.seeall)

--====================================================================--
-- SCENE: CLAIM INFO
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
	
	local vReload = false
	local infoString = "DEVELOPER NOTE: We may not need to go this deep into probe types. TBD"
	local pageTitleString = "SELECT SHORT RANGE PROBE"
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
	-- Imports
	------------------
	
	local ui = require ( "modules.ui" )
    local images = require ( "modules.images" )
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()

	------------------
	-- Display Objects
	------------------
    local IMAGES = require ( "modules.images" )
	local background = display.newImage( IMAGES.BACKGROUND2 )
	local probeSelect1 = display.newImage( IMAGES.SELECT_PROBE )
	local probeSelect2 = display.newImage( IMAGES.SELECT_PROBE )
	local pageTitle = display.newText( pageTitleString, 0, 0, Tahoma, 40 )
	local infoLabel = display.newText( infoString, 0, 0, 525, 0, Tahoma, 36 ) -- make dynamic

	------------------
	-- Functions
	------------------
	
	local bt01t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.asteroids", "overFromRight" )
		end
	end
	--
	------------------
	-- UI Objects
	------------------
	
	local bt01 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "BACK",
					size = 40,
					font = "Tahoma",
					onEvent = bt01t,
					id = "bt01"
	}
	--
	
	------------------
	-- Listeners
	------------------
	
	local touched = function ( event )
		if event.phase == "ended" then
			if vReload then
				director:changeScene( { label="Scene Reloaded" }, "modules.screen2","moveFromRight" )
			else
				director:changeScene( "modules.asteroids", "crossfade" )
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
		localGroup:insert( infoLabel )
		localGroup:insert( pageTitle )
		localGroup:insert( bt01 )
		localGroup:insert( probeSelect1 )
		localGroup:insert( probeSelect2 )
		------------------
		-- Positions
		------------------

		infoLabel.x = 325
		infoLabel.y = 810
		--
		pageTitle.x = 325
		pageTitle.y = 80		
		-- Back Button
		bt01.x = 325
		bt01.y = 920
		-- Probe Select Image
		probeSelect1.x = 325
		probeSelect1.y = 270
		--
		probeSelect2.x = 325
		probeSelect2.y = 590
			
		
		------------------
		-- Colors
		------------------
		
		pageTitle:setTextColor( 255,255,255 )
		infoLabel:setTextColor( 255,255,255 )
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
