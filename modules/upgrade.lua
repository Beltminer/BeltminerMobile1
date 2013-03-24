module(..., package.seeall)

--====================================================================--
-- SCENE: UPGRADE
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
	
	local background = display.newImage( images.UPGRADE_SCREEN )
	local upgradeBackground01 = display.newImage( images.UPGRADE_BACKGROUND )
	local upgradeBackground02 = display.newImage( images.UPGRADE_BACKGROUND )
	local upgradeBackground03 = display.newImage( images.UPGRADE_BACKGROUND )
	local upgradeBackground04 = display.newImage( images.UPGRADE_BACKGROUND )
	local greenMeterBar01 = display.newImage( images.GREEN_METER_BAR )
	local greenMeterBar02 = display.newImage( images.GREEN_METER_BAR )
	local greenMeterBar03 = display.newImage( images.GREEN_METER_BAR )
	local greenMeterBar04 = display.newImage( images.GREEN_METER_BAR )
	local prospectorUpgrade = display.newImage( images.SENSOR_UPGRADE )
	local sensorUpgrade = display.newImage( images.SENSOR_UPGRADE )
	local cargoUpgrade = display.newImage( images.SENSOR_UPGRADE )
	local fuelUpgrade = display.newImage( images.SENSOR_UPGRADE )
	local upgradeTitle01 = display.newText( "Prospector Mk II" , 0, 0, Tahoma, 30 )
	local upgradeCurrent01 = display.newText( "Armor: 15 Range: 32" , 0, 0, Tahoma, 24 )
	local upgradeStatus01 = display.newText( "6/10" , 0, 0, Tahoma, 36 )
	local upgradeTitle02 = display.newText( "Prospector Mk II" , 0, 0, Tahoma, 30 )
	local upgradeCurrent02 = display.newText( "Armor: 15 Range: 32" , 0, 0, Tahoma, 24 )
	local upgradeStatus02 = display.newText( "6/10" , 0, 0, Tahoma, 36 )
	local upgradeTitle03 = display.newText( "Prospector Mk II" , 0, 0, Tahoma, 30 )
	local upgradeCurrent03 = display.newText( "Armor: 15 Range: 32" , 0, 0, Tahoma, 24 )
	local upgradeStatus03 = display.newText( "6/10" , 0, 0, Tahoma, 36 )
	local upgradeTitle04 = display.newText( "Prospector Mk II" , 0, 0, Tahoma, 30 )
	local upgradeCurrent04 = display.newText( "Armor: 15 Range: 32" , 0, 0, Tahoma, 24 )
	local upgradeStatus04 = display.newText( "6/10" , 0, 0, Tahoma, 36 )

	------------------
	-- Functions
	------------------
	
	local btGoScreen2 = function ( event )
		if event.phase == "release" then
			director:changeScene( { label="upgrade"},"modules.screen2", "crossfade" )
		end
    end
	
	------------------
	-- UI Objects
	------------------

	--
	local buttonUpgrade1 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 40,
					font = "Tahoma",
					onEvent = btGoScreen2,
					id = "buttonUpgrade1"
	}
	--
	local buttonUpgrade2 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 40,
					font = "Tahoma",
					onEvent = btGoScreen2,
					id = "buttonUpgrade2"
	}
	local buttonUpgrade3 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 40,
					font = "Tahoma",
					onEvent = btGoScreen2,
					id = "buttonUpgrade3"
	}
	local buttonUpgrade4 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 40,
					font = "Tahoma",
					onEvent = btGoScreen2,
					id = "buttonUpgrade4"
	}

	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	local initVars = function ()
		
		------------------
		-- Inserts
		------------------
		
		localGroup:insert( background )
		localGroup:insert( upgradeBackground01 )
		localGroup:insert( upgradeBackground02 )
		localGroup:insert( upgradeBackground03 )
		localGroup:insert( upgradeBackground04 )
		localGroup:insert( greenMeterBar01 )
		localGroup:insert( greenMeterBar02 )
		localGroup:insert( greenMeterBar03 )
		localGroup:insert( greenMeterBar04 )
		localGroup:insert( prospectorUpgrade )
		localGroup:insert( sensorUpgrade )
		localGroup:insert( cargoUpgrade )
		localGroup:insert( fuelUpgrade )
		localGroup:insert( upgradeTitle01 )
		localGroup:insert( upgradeCurrent01 )
		localGroup:insert( upgradeStatus01 )
		localGroup:insert( upgradeTitle02 )
		localGroup:insert( upgradeCurrent02 )
		localGroup:insert( upgradeStatus02 )
		localGroup:insert( upgradeTitle03 )
		localGroup:insert( upgradeCurrent03 )
		localGroup:insert( upgradeStatus03 )
		localGroup:insert( upgradeTitle04 )
		localGroup:insert( upgradeCurrent04 )
		localGroup:insert( upgradeStatus04 )
		localGroup:insert(buttonUpgrade1)
		localGroup:insert(buttonUpgrade2)
		localGroup:insert(buttonUpgrade3)
		localGroup:insert(buttonUpgrade4)
        localGroup:insert( hud.new({label="upgrade"}) )
		
		------------------
		-- Positions
		------------------
		--
		upgradeBackground01.x = 320
		upgradeBackground01.y = 275
		--
		--
		upgradeBackground02.x = 320
		upgradeBackground02.y = 435
		--		
		--
		upgradeBackground03.x = 320
		upgradeBackground03.y = 600
		--
		--
		upgradeBackground04.x = 320
		upgradeBackground04.y = 765
		--	
		greenMeterBar01.x = 470
		greenMeterBar01.y = 315
		--
		greenMeterBar02.x = 470
		greenMeterBar02.y = 470
		--
		greenMeterBar03.x = 470
		greenMeterBar03.y = 640
		--
		greenMeterBar04.x = 470
		greenMeterBar04.y = 805
		--
		prospectorUpgrade.x = 95
		prospectorUpgrade.y = 275
		--
		sensorUpgrade.x = 95
		sensorUpgrade.y = 425
		--
		cargoUpgrade.x = 95
		cargoUpgrade.y = 600
		--
		fuelUpgrade.x = 95
		fuelUpgrade.y = 765
		--
		upgradeTitle01.x = 280
		upgradeTitle01.y = 240
		--
		upgradeCurrent01.x = 280
		upgradeCurrent01.y = 270
		--
		upgradeStatus01.x = 210
		upgradeStatus01.y = 325
		--
		upgradeTitle02.x = 280
		upgradeTitle02.y = 390
		--
		upgradeCurrent02.x = 280
		upgradeCurrent02.y = 420
		--
		upgradeStatus02.x = 210
		upgradeStatus02.y = 480
		--
		upgradeTitle03.x = 280
		upgradeTitle03.y = 560
		--
		upgradeCurrent03.x = 280
		upgradeCurrent03.y = 590
		--
		upgradeStatus03.x = 210
		upgradeStatus03.y = 650
		--
		upgradeTitle04.x = 280
		upgradeTitle04.y = 730
		--
		upgradeCurrent04.x = 280
		upgradeCurrent04.y = 760
		--
		upgradeStatus04.x = 210
		upgradeStatus04.y = 805
		-- Upgrade Button
		buttonUpgrade1.x = 515
		buttonUpgrade1.y = 255
		-- Upgrade Button
		buttonUpgrade2.x = 515
		buttonUpgrade2.y = 410
		-- Upgrade Button
		buttonUpgrade3.x = 515
		buttonUpgrade3.y = 575
		-- Upgrade Button
		buttonUpgrade4.x = 515
		buttonUpgrade4.y = 745
		
		------------------
		-- Colors
		------------------
		
		upgradeTitle01:setTextColor( 152,152,152 )
		upgradeCurrent01:setTextColor( 152,152,152 )
		upgradeStatus01:setTextColor( 152,152,152 )
		upgradeTitle02:setTextColor( 152,152,152 )
		upgradeCurrent02:setTextColor( 152,152,152 )
		upgradeStatus02:setTextColor( 152,152,152 )
		upgradeTitle03:setTextColor( 152,152,152 )
		upgradeCurrent03:setTextColor( 152,152,152 )
		upgradeStatus03:setTextColor( 152,152,152 )
		upgradeTitle04:setTextColor( 152,152,152 )
		upgradeCurrent04:setTextColor( 152,152,152 )
		upgradeStatus04:setTextColor( 152,152,152 )
		
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
