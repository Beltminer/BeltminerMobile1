module(..., package.seeall)

--====================================================================--
-- SCENE: MISSIONS
--====================================================================--

--[[

******************
 - INFORMATION
******************

  - Sample scene.

--]]

new = function ( params )

	------------------
	-- Imports
	------------------
	
	local ui = require ( "modules.ui" )
    local images = require ( "modules.images" )
    local strings = require ( "modules.strings" )
    local hud = require ( "modules.buttonFrame" )
	
	------------------
	-- Label
	------------------
	
	local vLabel = "Chapter 6: The Outer Rim"

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
	
	--
	local btGoLaunchMission = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.missionLaunch", "overFromBottom" )
		end
	end

	------------------
	-- UI Objects
	------------------

  	--
	local btLaunchMission = ui.newButton{
					default = images.LAUNCH_MISSION_UP,
					over = images.LAUNCH_MISSION_DOWN,
					onEvent = btGoLaunchMission,
					id = "btLaunchMission"
	}


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
		localGroup:insert(btLaunchMission)
        localGroup:insert( hud.new({label="missions"}) )

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
		
		-- Launch Button
		btLaunchMission.x = 325
		btLaunchMission.y = 760

		------------------
		-- Colors
		------------------
		
		title:setTextColor( 152,152,152 )
		fuelLabel:setTextColor( 152,152,152) 
		expLabel:setTextColor( 152,152,152) 
		msgLabel:setTextColor(152,152,152)

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
