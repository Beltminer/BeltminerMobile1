module(..., package.seeall)

--====================================================================--
-- SCENE: HOME SCREEN
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
	
	local background = display.newImage( images.HOME_SCREEN )
	local splashImage = display.newImage ( images.HOME_PAGE_SPLASH )

	--====================================================================--
	-- BUTTONS
	--====================================================================--

	local btGoMissions = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.missions", "overFromBottom" )
		end
	end
    --
    local buttonTapToStart = ui.newButton{
        default = images.BUTTON_TAP_START_UP,
        over = images.BUTTON_TAP_START_DOWN,
        onEvent = btGoMissions,
        id = "buttonTapToStart"
    }


	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	local initVars = function ()
		
		------------------
		-- Inserts
		------------------
		
		localGroup:insert( background )
		localGroup:insert( splashImage )
		localGroup:insert(buttonTapToStart)
        localGroup:insert( hud.new() )

		------------------
		-- Positions
		------------------
		
		--
		splashImage.x = 320
		splashImage.y = 455
		--
		-- Tap To Start Button
		buttonTapToStart.x = 325
		buttonTapToStart.y = 790
		--
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
