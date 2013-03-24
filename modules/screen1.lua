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
	-- INITIALIZE
	--====================================================================--
	
	local initVars = function ()
		
		------------------
		-- Inserts
		------------------
		
		localGroup:insert( background )
        localGroup:insert( splashImage )

		
		------------------
		-- Positions
		------------------
		
		--
		splashImage.x = 320
		splashImage.y = 455

		
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
