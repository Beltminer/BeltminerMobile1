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
	local pageTitleString = "TERRA NOVA STORAGE"
	local infoString = "Look at all the crap you've accumulated!"	
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
    local hud = require ( "modules.buttonFrame" )
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
	local storeItem = display.newImage( IMAGES.STORE_ITEM )
	local storeItem1 = display.newImage( IMAGES.STORE_ITEM )
	local storeItem2 = display.newImage( IMAGES.STORE_ITEM )
	local storeItem3 = display.newImage( IMAGES.STORE_ITEM )
	------------------
	-- Functions
	------------------
	
	local bt02t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "overFromRight" )
		end
	end
	--
	local bt03t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "overFromRight" )
		end
	end
	--
	local bt04t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "overFromRight" )
		end
	end
	--
	local bt05t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "overFromRight" )
		end
	end	
	------------------
	-- UI Objects
	------------------
		local bt02 = ui.newButton{
					default = images.BUTTON_NARROW_UP,
					over = images.BUTTON_NARROW_DOWN,
					text = "TRADE",
					size = 40,
					font = "Tahoma",
					onEvent = bt02t,
					id = "bt02"
	}
	--
		local bt03 = ui.newButton{
					default = images.BUTTON_NARROW_UP,
					over = images.BUTTON_NARROW_DOWN,
					text = "TRADE",
					size = 40,
					font = "Tahoma",
					onEvent = bt03t,
					id = "bt03"
	}
	--
		local bt04 = ui.newButton{
					default = images.BUTTON_NARROW_UP,
					over = images.BUTTON_NARROW_DOWN,
					text = "TRADE",
					size = 40,
					font = "Tahoma",
					onEvent = bt04t,
					id = "bt04"
	}
	--
		local bt05 = ui.newButton{
					default = images.BUTTON_NARROW_UP,
					over = images.BUTTON_NARROW_DOWN,
					text = "TRADE",
					size = 40,
					font = "Tahoma",
					onEvent = bt05t,
					id = "bt05"
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
		localGroup:insert( storeItem )
		localGroup:insert( storeItem1 )
		localGroup:insert( storeItem2 )
		localGroup:insert( storeItem3 )
        localGroup:insert( hud.new({label="storage"}) )		
		------------------
		-- Positions
		------------------

		pageTitle.x = 325
		pageTitle.y = 150	

		infoLabel.x = 355
		infoLabel.y = 800		

		bt02.x = 570
		bt02.y = 435
		-- Trade Button
		bt03.x = 570
		bt03.y = 295
		-- Trade Button
		bt04.x = 570
		bt04.y = 575
		-- Trade Button
		bt05.x = 570
		bt05.y = 715

		-- Store Item
		storeItem.x = 325
		storeItem.y = 260		

		-- Store Item
		storeItem1.x = 325
		storeItem1.y = 400	

		-- Store Item
		storeItem2.x = 325
		storeItem2.y = 540	

		-- Store Item
		storeItem3.x = 325
		storeItem3.y = 680			
				
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
