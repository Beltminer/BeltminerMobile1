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
    local strings = require ( "modules.strings" )
	
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
    -- Strings
    ------------------

    local fuelString = strings.FUEL.."6/10"
    local xpString = strings.EXPERIENCE.."32/550"
    local msgString = "You get free fuel until level 20. Complete your missions now!"

	------------------
	-- Display Objects
	------------------

	local background = display.newImage( images.MISSIONS_SCREEN  )
	local title = display.newText( vLabel, 0, 0, Tahoma, 47 )
	local fuelLabel = display.newText( fuelString, 0, 0, Tahoma, 36 ) -- make dynamic
	local expLabel = display.newText( xpString, 0, 0, Tahoma, 36 ) -- make dynamic
	local msgLabel = display.newText( msgString, 0, 0, 410, 0, Tahoma, 36 ) -- make dynamic
	local scientistWoman = display.newImage( images.SCIENTIST_WOMAN )
	local headerHUD = display.newImage( images.GROUND )
	local footerHUD = display.newImage( images.GROUND )
	local bannerImage = display.newImage( images.BANNER_IMAGE )
	local greenMeterBar = display.newImage( images.GREEN_METER_BAR )
	local blueMeterBar = display.newImage( images.BLUE_METER_BAR )
	
	------------------
	-- Functions
	------------------
	
	local bt01t = function ( event ) --Missions
		if event.phase == "release" then
			director:changeScene( "modules.missions", "overFromRight" )
		end
	end
	--
	local bt02t = function ( event ) --My Page
		if event.phase == "release" then
			director:changeScene( "modules.myPage", "moveFromLeft" )
		end
	end
	--
	local bt03t = function ( event ) -- Upgrade
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromTop" )
		end
	end
	--
	local bt04t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.missionLaunch", "overFromBottom" )
		end
	end
	--
	local bt05t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "flip" )
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
                    text = "MY PAGE",
                    size = 40,
                    font = "Tahoma",
                    onEvent = bt02t,
                    id = "bt02"
    }
    --
    local bt03 = ui.newButton{
                    default = images.BUTTON_HUD_UP,
                    over = images.BUTTON_HUD_DOWN,
                    text = "UPGRADE",
                    size = 40,
                    font = "Tahoma",
                    onEvent = bt03t,
                    id = "bt03"
	}
	--
	local bt04 = ui.newButton{
					default = images.LAUNCH_MISSION_UP,
					over = images.LAUNCH_MISSION_DOWN,
					onEvent = bt04t, --previously bt04t
					id = "bt04"
	}
	--
	local bt05 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "BACK",
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
					text = "NEXT",
					size = 40,
					font = "Tahoma",
					onEvent = bt07t,
					id = "bt07"
	}
	--
	local bt08 = ui.newButton{
					default = images.BUTTON_CROSSFADE,
					over = images.BUTTON_CROSSFADE,
					onEvent = bt08t,
					id = "bt08"
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
		localGroup:insert( title )
		localGroup:insert( msgLabel )
		localGroup:insert( headerHUD )
		localGroup:insert( footerHUD )
		localGroup:insert( bannerImage )
		localGroup:insert( greenMeterBar )
		localGroup:insert( blueMeterBar )
		localGroup:insert( fuelLabel )
		localGroup:insert( expLabel )
		localGroup:insert( scientistWoman )
		localGroup:insert( bt01 )
		localGroup:insert( bt02 )
		localGroup:insert( bt03 )
		localGroup:insert( bt04 )
		localGroup:insert( bt05 )
		localGroup:insert( bt06 )
		localGroup:insert( bt07 )
		localGroup:insert( bt08 )
		
		------------------
		-- Positions
		------------------
		--
		title.x = 290
		title.y = 230
		--
		fuelLabel.x = 110
		fuelLabel.y = 450
		--
		expLabel.x = 440
		expLabel.y = 450
		--
		msgLabel.x = 410
		msgLabel.y = 600
		--
		headerHUD.x = 320
		headerHUD.y = 52.5
		--
		footerHUD.x = 320
		footerHUD.y = 907.5
		--
		bannerImage.x = 320
		bannerImage.y = 340
		--
		greenMeterBar.x = 160
		greenMeterBar.y = 490	
		--
		blueMeterBar.x = 480
		blueMeterBar.y = 490	
		--
		scientistWoman.x = 100
		scientistWoman.y = 600
		--		
		
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
		bt04.x = 160
		bt04.y = 750
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
		
		------------------
		-- Colors
		------------------
		
		title:setTextColor( 152,152,152 )
		fuelLabel:setTextColor( 152,152,152) 
		expLabel:setTextColor( 152,152,152) 
		msgLabel:setTextColor(152,152,152)
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
