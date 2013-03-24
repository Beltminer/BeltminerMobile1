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
	local pageTitleString = "REQUIRES A DEED"
	local infoString = "Without a Deed issued from Terra Nova, you can't stake a claim. Go complete some more missions and show us what you got. If yer in an all-fire hurry, just go buy one."	
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
	local pageTitle = display.newText( pageTitleString, 0, 0, Tahoma, 40 )
	local infoLabel = display.newText( infoString, 0, 0, 525, 0, Tahoma, 36 ) -- make dynamic
	local deed = display.newImage( IMAGES.DEED )
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
		localGroup:insert( deed )	
		------------------
		-- Positions
		------------------

		infoLabel.x = 325
		infoLabel.y = 600
		
		pageTitle.x = 325
		pageTitle.y = 110		

		-- Back Button
		bt01.x = 325
		bt01.y = 800
		
		-- Deed Image
		deed.x = 325
		deed.y = 300			
		
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
