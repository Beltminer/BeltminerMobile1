module(..., package.seeall)

--====================================================================--
-- SCENE: SCREEN 2
--====================================================================--

--[[

 - Version: 1.3
 - Made by Ricardo Rauber Pereira @ 2010
 - Blog: http://rauberlabs.blogspot.com/
 - Mail: ricardorauber@gmail.com

******************
 - INFORMATION
******************

  - Sample scene.

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
	
	local vLabel = "Chapter 6: The Outer Rim"
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
	
	local background = display.newImage( images.STARS )
	local prospector = display.newImage( images.PROSPECTOR )
	local headerHUD = display.newImage(images.GROUND)
	--local title = display.newText( vLabel, 0, 0, Tahoma, 47 )
	--local fuelLabel = display.newText( "FUEL: 6/10", 0, 0, Tahoma, 36 ) -- make dynamic
	--local expLabel = display.newText( "EXP: 32/550", 0, 0, Tahoma, 36 ) -- make dynamic
	--local msgLabel = display.newText( "You get free fuel until level 20. Complete your missions now!", 0, 0, 410, 0, Tahoma, 36 ) -- make dynamic
	--local scientistWoman = display.newImage( "scientistWoman.png" )
	--local headerHUD = display.newImage( "ground.png" )
	--local footerHUD = display.newImage( "ground.png" )
	--local bannerImage = display.newImage( "bannerImage.png" )
	--local greenMeterBar = display.newImage( "greenMeterBar.png" )
	--local blueMeterBar = display.newImage( "blueMeterBar.png" )
	
	------------------
	-- Functions
	------------------
	
	local bt01t = function ( event ) --Missions
		if event.phase == "release" then
			director:changeScene( "modules.screen1", "overFromRight" )
		end
	end
	--

	------------------
	-- UI Objects
	------------------
	
	local bt01 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "HOME",
					size = 40,
					font = "Tahoma",
					onEvent = bt01t,
					id = "bt01"
	}
	--

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
		localGroup:insert( prospector )
		--localGroup:insert( title )
		--localGroup:insert( msgLabel )
		--localGroup:insert( headerHUD )
		--localGroup:insert( footerHUD )
		--localGroup:insert( bannerImage )
		--localGroup:insert( greenMeterBar )
		--localGroup:insert( blueMeterBar )
		--localGroup:insert( fuelLabel )
		--localGroup:insert( expLabel )
		--localGroup:insert( scientistWoman )
		localGroup:insert( bt01 )

		
		------------------
		-- Positions
		------------------
		--
		prospector.x = 320
		prospector.y = 480
		--
		--title.x = 290
		--title.y = 230
		--
		--fuelLabel.x = 110
		--fuelLabel.y = 450
		--
		--expLabel.x = 440
		--expLabel.y = 450
		--
		--msgLabel.x = 410
		--msgLabel.y = 600
		--
		headerHUD.x = 320
		headerHUD.y = 52.5
		--
		--footerHUD.x = 320
		--footerHUD.y = 907.5
		--
		--bannerImage.x = 320
		--bannerImage.y = 340
		--
		--greenMeterBar.x = 160
		--greenMeterBar.y = 490	
		--
		--blueMeterBar.x = 480
		--blueMeterBar.y = 490	
		--
		--scientistWoman.x = 100
		--scientistWoman.y = 600
		--		
		
		-- Home Button
		bt01.x = 325
		bt01.y = 910

		
		------------------
		-- Colors
		------------------
		
		--title:setTextColor( 152,152,152 )
		--fuelLabel:setTextColor( 152,152,152) 
		--expLabel:setTextColor( 152,152,152) 
		--msgLabel:setTextColor(152,152,152)
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
