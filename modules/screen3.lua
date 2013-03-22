module(..., package.seeall)

--====================================================================--
-- POP UP: SCREEN 3
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

new = function ()
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	------------------
	-- Display Objects
	------------------
    local IMAGES = require ( "modules.images" )
	
	local w, h = display.contentWidth, display.contentHeight
	local background = display.newImage( IMAGES.BACKGROUND3 )
	background.xScale = 0.8
	background.yScale = 0.8
	background.alpha = 0.95
	local title = display.newText( "TOUCH TO GO BACK", 0, 0, Tahoma, 40 )
	
	------------------
	-- Listeners
	------------------
	
	local touched = function ( event )
		if event.phase == "ended" then
			director:closePopUp()
		end
	end
	
	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	local function initVars ()
		
		------------------
		-- Inserts
		------------------
		
		localGroup:insert( background )
		localGroup:insert( title )
		
		------------------
		-- Positions
		------------------
		
		title.x = 325
		title.y = 240
		
		------------------
		-- Colors
		------------------
		
		title:setTextColor( 255,255,255 )
		
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
