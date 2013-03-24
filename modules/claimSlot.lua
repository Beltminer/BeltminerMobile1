module(..., package.seeall)

--====================================================================--
-- SCENE: CLAIM SLOT
--====================================================================--

--[[

******************
 - INFORMATION
******************

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
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	------------------
	-- Display Objects
	------------------

    local IMAGES = require ( "modules.images" )
	local background = display.newImage( images.BACKGROUND2 )
	local headerHUD = display.newImage( images.GROUND )
	local footerHUD = display.newImage( images.GROUND )
	
	------------------
	-- Functions
	------------------
	
	--Standard Hud Buttons
	local bt01t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.missions", "overFromRight" )
		end
	end
	--
	local bt02t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromLeft" )
		end
	end
	--
	local bt03t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.upgrade", "moveFromTop" )
		end
	end
	--
--	local bt04t = function ( event )
--		if event.phase == "release" then
--			director:changeScene( "modules.claimSlot", "overFromBottom" )
--		end
--	end
--
	local bt05t = function ( event )
		if event.phase == "release" then
			director:changeScene( "modules.myPage", "flip" )
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
			director:changeScene( "modules.asteroids", "fade" )
		end
	end
	-- Special Buttons
--	local bt08t = function ( event )
--		if event.phase == "release" then
--			director:changeScene( "modules.claimSlot", "crossfade" )
--		end
--	end
	--
--	local bt09t = function ( event )
--		if event.phase == "release" then
--			director:changeScene( "modules.claimSlot", "crossfade" )
--		end
--	end
	--
--	local bt10t = function ( event )
--		if event.phase == "release" then
--			director:changeScene( "modules.claimSlot", "crossfade" )
--		end
--	end
	------------------
	-- UI Objects
	------------------
	
	-- STANDARD HUD BUTTONS
	
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
					size = 32,
					font = "Tahoma",
					onEvent = bt02t,
					id = "bt02"
	}
	--
	local bt03 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "STORAGE",
					size = 32,
					font = "Tahoma",
					onEvent = bt03t,
					id = "bt03"
	}
	--
	local bt05 = ui.newButton{
					default = images.BUTTON_HUD_UP,
					over = images.BUTTON_HUD_DOWN,
					text = "MY PAGE",
					size = 32,
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
					text = "ASTEROIDS",
					size = 32,
					font = "Tahoma",
					onEvent = bt07t,
					id = "bt07"
	}
	
	-- SPECIAL BUTTONS
	
	--
	-- CLAIM SLOT BUTTON
	--
--  local bt04 = ui.newButton{
--                  default = images.CLAIM_SLOT_UP,
--                  over = images.CLAIM_SLOT_DOWN,
--                  text = "INBOX",
--                  size = 50,
--                  font = "Tahoma",
--                  onEvent = bt04t, --previously bt04t
--                  id = "bt04"
--  }
	--
--	local bt08 = ui.newButton{
--					default = images.CLAIM_SLOT_UP,
--					over = images.CLAIM_SLOT_DOWN,
--					--text = "CLAIM GIFTS",
--					--size = 50,
--					--font = "Tahoma",
--					onEvent = bt08t, --previously bt04t
--					id = "bt08"
--	}
--	local bt09 = ui.newButton{
--					default = images.CLAIM_SLOT_UP,
--					over = images.CLAIM_SLOT_DOWN,
--					--text = "ADD FRIENDS",
--					--size = 50,
--					--font = "Tahoma",
--					onEvent = bt09t, --previously bt04t
--					id = "bt09"
--	}
--	local bt10 = ui.newButton{
--					default = images.CLAIM_SLOT_UP,
--					over = images.CLAIM_SLOT_DOWN,
--					--text = "SETTINGS",
--					--size = 50,
--					--font = "Tahoma",
--					onEvent = bt10t, --previously bt04t
--					id = "bt10"
--	}		
	
	
	
	
	------------------
	-- Listeners
	------------------
	
	
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
		localGroup:insert( bt01 )
		localGroup:insert( bt02 )
		localGroup:insert( bt03 )
--		localGroup:insert( bt04 )
		localGroup:insert( bt05 )
		localGroup:insert( bt06 )
		localGroup:insert( bt07 )
--		localGroup:insert( bt08 )
--		localGroup:insert( bt09 )
--		localGroup:insert( bt10 )
		
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
		-- Missions Button
		bt01.x = 325
		bt01.y = 910
		-- My Page Button
		bt02.x = 115
		bt02.y = 910
		-- Upgrades Button
		bt03.x = 535
		bt03.y = 910
		-- Claim Button
--		bt04.x = 110
--		bt04.y = 214
		-- Back Button
		bt05.x = 115
		bt05.y = 55
		-- Home Button
		bt06.x = 325
		bt06.y = 55
		-- Next Button
		bt07.x = 535
		bt07.y = 55
--		-- Claim Button
--		bt08.x = 325
--		bt08.y = 214  
--		-- Claim Button
--		bt09.x = 535
--		bt09.y = 214	
		-- Claim Button
--		bt10.x = 110
--		bt10.y = 425  		
		
		------------------
		-- Colors
		------------------
		
		
		
		------------------
		-- Listeners
		------------------
		
				
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
