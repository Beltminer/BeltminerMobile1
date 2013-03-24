module(..., package.seeall)

--====================================================================--
-- SCENE: MISSION GAMEPLAY
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

	------------------
	-- Functions
	------------------
	
	local btGoHome = function ( event ) --Missions
		if event.phase == "release" then
			director:changeScene( "modules.home", "overFromRight" )
		end
	end
	--

	------------------
	-- UI Objects
	------------------
	
	local buttonHome = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "HOME",
					size = 40,
					font = "Tahoma",
					onEvent = btGoHome,
					id = "buttonHome"
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
				director:changeScene( { label="missionLaunch"}, "modules.screen2", "crossfade" )
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
		localGroup:insert(buttonHome)

		
		------------------
		-- Positions
		------------------
		--
		prospector.x = 320
		prospector.y = 480
		--
		headerHUD.x = 320
		headerHUD.y = 52.5
		--

		-- Home Button
		buttonHome.x = 325
		buttonHome.y = 910

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
