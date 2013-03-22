module(..., package.seeall)

--====================================================================--
-- SCENE: SCREEN 1
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
	local headerHUD = display.newImage( images.GROUND )
	local footerHUD = display.newImage( images.GROUND )

	
	------------------
	-- Link
	------------------
	
	local goBlog = function ( event )
		if event.phase == "ended" then
			system.openURL( "http://rauberlabs.blogspot.com/" )
		end
	end
	--
	--title:addEventListener( "touch", goBlog )
	--createdBy:addEventListener( "touch", goBlog )
	--website:addEventListener( "touch", goBlog )
	
	--====================================================================--
	-- BUTTONS
	--====================================================================--
	
	------------------
	-- Functions
	------------------
	
	local bt01t = function ( event )
		if event.phase == "release" then --Missions
			director:changeScene( "modules.missions", "overFromRight" )
		end
	end
	--
	local bt02t = function ( event ) --My Page
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromLeft" )
		end
	end
	--
	local bt03t = function ( event ) --Upgrade
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromTop" )
		end
	end
	--
	local bt04t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.missions", "overFromBottom" )
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
			director:changeScene( "modules.home", "downFlip" ) --previously screen2
		end
	end
	--
	local bt07t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "fade" )
		end
	end
	--
	local bt08t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "crossfade" )
		end
	end
	
	------------------
	-- UI Objects
	------------------
	
	--HUD Buttons
	
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
					size = 56,
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
	
	-- Screen Buttons
	
	--
	local bt08 = ui.newButton{
					default = images.BUTTON_CROSSFADE,
					over = images.BUTTON_CROSSFADE,
					onEvent = bt08t,
					id = "bt08"
	}
	--
	local bt04 = ui.newButton{
					default = images.BUTTON_TAP_START_UP,
					over = images.BUTTON_TAP_START_DOWN,
					onEvent = bt04t, --previously bt04t
					id = "bt04"
	}
	
	--====================================================================--
	-- SLIDE
	--====================================================================--
	
	------------------
	-- Image
	------------------
	
	local btSlide = display.newImage( images.BUTTON_SLIDE )
	
	------------------
	-- Listener
	------------------

	local btSlidet = function ( event )
		if event.phase == "ended" then
			if event.xStart >= event.x then
				director:changeScene( "modules.screen2", "moveFromRight" )
			else
				director:changeScene( "modules.screen2", "moveFromLeft" )
			end
		end
	end
	
	--====================================================================--
	-- POPUP
	--====================================================================--
	
	------------------
	-- Image
	------------------
	
	local btPopUp = display.newImage( images.BUTTON_POPUP )
	
	------------------
	-- On Close
	------------------
	
	local popClosed = function ()
		--
		local fxTime = 200
		--
		transition.to( bt01, { alpha=0, time=fxTime, delay=100 } )
		transition.to( bt02, { alpha=0, time=fxTime, delay=200 } )
		transition.to( bt03, { alpha=0, time=fxTime, delay=300 } )
		transition.to( bt04, { alpha=0, time=fxTime, delay=400 } )
		transition.to( bt05, { alpha=0, time=fxTime, delay=500 } )
		transition.to( bt06, { alpha=0, time=fxTime, delay=600 } )
		transition.to( bt07, { alpha=0, time=fxTime, delay=700 } )
		transition.to( bt08, { alpha=0, time=fxTime, delay=800 } )
		--
		transition.to( bt01, { alpha=1, time=fxTime, delay=fxTime*2+100 } )
		transition.to( bt02, { alpha=1, time=fxTime, delay=fxTime*2+200 } )
		transition.to( bt03, { alpha=1, time=fxTime, delay=fxTime*2+300 } )
		transition.to( bt04, { alpha=1, time=fxTime, delay=fxTime*2+400 } )
		transition.to( bt05, { alpha=1, time=fxTime, delay=fxTime*2+500 } )
		transition.to( bt06, { alpha=1, time=fxTime, delay=fxTime*2+600 } )
		transition.to( bt07, { alpha=1, time=fxTime, delay=fxTime*2+700 } )
		transition.to( bt08, { alpha=1, time=fxTime, delay=fxTime*2+800 } )
		--
	end
	
	------------------
	-- Listener
	------------------
	
	local btPopUpt = function ( event )
		if event.phase == "ended" then
			director:openPopUp( "modules.screen3", popClosed )
		end
	end
	
	--====================================================================--
	-- PARAMETERS
	--====================================================================--
	
	------------------
	-- Image
	------------------
	
	local btParameters = display.newImage( images.BUTTON_PARAMETERS )
	
	------------------
	-- Listener
	------------------
	
	local btParameterst = function ( event )
		if event.phase == "ended" then
			director:changeScene( { label="Sending Parameters", reload=true } , "modules.screen2", "fade", "white" )
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
        localGroup:insert( splashImage )
		localGroup:insert( headerHUD )
		localGroup:insert( footerHUD )
		--localGroup:insert( title )
		--localGroup:insert( createdBy )
		--localGroup:insert( website )
		localGroup:insert( bt01 )
		localGroup:insert( bt02 )
		localGroup:insert( bt03 )
		localGroup:insert( bt04 )
		localGroup:insert( bt05 )
		localGroup:insert( bt06 )
		localGroup:insert( bt07 )
		localGroup:insert( bt08 )
		localGroup:insert( btSlide )
		localGroup:insert( btPopUp )
		localGroup:insert( btParameters )
		
		------------------
		-- Positions
		------------------
		
		--
		splashImage.x = 320
		splashImage.y = 455
		--
		headerHUD.x = 320
		headerHUD.y = 54
		--
		footerHUD.x = 320
		footerHUD.y = 905
		--
		--title.x = 160
		--title.y = 20
		-- Missions Button
		bt01.x = 325
		bt01.y = 910
		-- My Page Button
		bt02.x = 115
		bt02.y = 910
		-- Upgrades Button
		bt03.x = 535
		bt03.y = 910
		-- Tap To Start Button
		bt04.x = 325
		bt04.y = 790
		-- Back Button
		bt05.x = 115
		bt05.y = 55
		-- Home Button
		bt06.x = 325
		bt06.y = 55
		-- Next Button
		bt07.x = 535
		bt07.y = 55
		--
		bt08.x = 240
		bt08.y = 1024  --250
		--
		btSlide.x = 160
		btSlide.y = 1024 --300
		--
		btPopUp.x = 160
		btPopUp.y = 1024 --350
		--
		btParameters.x = 160
		btParameters.y = 1024  --400
		--
		--createdBy.x = 160
		--createdBy.y = 1024  --440
		--
		--website.x = 160
		--website.y = 1024  --460
		
		------------------
		-- Colors
		------------------
		
		--title:setTextColor( 255,255,255 )
		--createdBy:setTextColor( 255,255,255 )
		--website:setTextColor( 255,255,255 )
		
		------------------
		-- Listeners
		------------------
		
		btSlide:addEventListener ( "touch" , btSlidet )
		btPopUp:addEventListener ( "touch" , btPopUpt )
		btParameters:addEventListener ( "touch" , btParameterst )
		
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
