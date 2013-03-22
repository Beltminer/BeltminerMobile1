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
	
	--local vLabel = "MY PAGE"
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
	local headerHUD = display.newImage( images.GROUND )
	local footerHUD = display.newImage( images.GROUND )
		
	------------------
	-- Functions
	------------------
	
	local bt01t = function ( event ) -- Missions
		if event.phase == "release" then
			director:changeScene( "modules.missions", "overFromRight" )
		end
	end
	--
	local bt02t = function ( event ) -- My Page
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
			director:changeScene( "modules.screen2", "overFromBottom" )
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
	--
	local bt09t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "crossfade" )
		end
	end
	--
	local bt10t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.screen2", "crossfade" )
		end
	end
	
	------------------
	-- UI Objects
	------------------

    -- FIXME: OK, this copy and paste shit has got to go. This needs to be in its own module.

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
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 36,
					font = "Tahoma",
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
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 36,
					font = "Tahoma",
					onEvent = bt08t, --previously bt04t
					id = "bt08"
	}
	local bt09 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 36,
					font = "Tahoma",
					onEvent = bt09t, --previously bt04t
					id = "bt09"
	}
	local bt10 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "UPGRADE",
					size = 36,
					font = "Tahoma",
					onEvent = bt10t, --previously bt04t
					id = "bt10"
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
		localGroup:insert( headerHUD )
		localGroup:insert( footerHUD )
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
		localGroup:insert( bt01 )
		localGroup:insert( bt02 )
		localGroup:insert( bt03 )
		localGroup:insert( bt04 )
		localGroup:insert( bt05 )
		localGroup:insert( bt06 )
		localGroup:insert( bt07 )
		localGroup:insert( bt08 )
		localGroup:insert( bt09 )
		localGroup:insert( bt10 )
		
		------------------
		-- Positions
		------------------
		--
		--title.x = 325
		--title.y = 160
		--
		headerHUD.x = 320
		headerHUD.y = 52.5
		--
		footerHUD.x = 320
		footerHUD.y = 907.5
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
		-- Missions Button
		bt01.x = 325
		bt01.y = 910
		-- My Page Button
		bt02.x = 115
		bt02.y = 910
		-- Upgrade HUD Button
		bt03.x = 535
		bt03.y = 910
		-- Upgrade Button
		bt04.x = 515
		bt04.y = 255
		-- Back Button
		bt05.x = 115
		bt05.y = 55
		-- Home Button
		bt06.x = 325
		bt06.y = 55
		-- Next Button
		bt07.x = 535
		bt07.y = 55
		-- Upgrade Button
		bt08.x = 515
		bt08.y = 410  
		-- Upgrade Button
		bt09.x = 515
		bt09.y = 575	
		-- Upgrade Button
		bt10.x = 515
		bt10.y = 745  		
		
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
