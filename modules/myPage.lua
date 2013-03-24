module(..., package.seeall)

--====================================================================--
-- SCENE: MY PAGE
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
	
	local background = display.newImage( images.MY_PAGE_SCREEN )

	------------------
	-- Functions
	------------------

    -- XXX: The following callbacks just go to a temporary screen that returns

	local btGoInbox = function ( event )
		if event.phase == "release" then
			director:changeScene( { label="myPage"},"modules.screen2", "overFromBottom" )
		end
	end
	--
	local btGoClaimGifts = function ( event )
		if event.phase == "release" then
			director:changeScene( { label="myPage"},"modules.screen2", "crossfade" )
		end
	end
	--
	local btGoAddFriends = function ( event )
		if event.phase == "release" then
			director:changeScene( { label="myPage"},"modules.screen2", "crossfade" )
		end
	end
	--
	local btGoSettings = function ( event )
		if event.phase == "release" then
			director:changeScene( { label="myPage"},"modules.screen2", "crossfade" )
		end
	end
	
	------------------
	-- UI Objects
	------------------

	--Screen buttons
	
	--
    local buttonInbox = ui.newButton{
                    default = images.BIG_BUTTON_UP,
                    over = images.BIG_BUTTON_DOWN,
                    text = "INBOX",
                    size = 50,
                    font = "Tahoma",
                    onEvent = btGoInbox,
                    id = "buttonInbox"
    }
	--
	local buttonClaimGifts = ui.newButton{
					default = images.BIG_BUTTON_UP,
					over = images.BIG_BUTTON_DOWN,
					text = "CLAIM GIFTS",
					size = 50,
					font = "Tahoma",
					onEvent = btGoClaimGifts,
					id = "buttonClaimGifts"
	}
	local buttonAddFriends = ui.newButton{
					default = images.BIG_BUTTON_UP,
					over = images.BIG_BUTTON_DOWN,
					text = "ADD FRIENDS",
					size = 50,
					font = "Tahoma",
					onEvent = btGoAddFriends,
					id = "buttonAddFriends"
	}
	local buttonSettings = ui.newButton{
					default = images.BIG_BUTTON_UP,
					over = images.BIG_BUTTON_DOWN,
					text = "SETTINGS",
					size = 50,
					font = "Tahoma",
					onEvent = btGoSettings,
					id = "buttonSettings"
	}
	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	

	
	--====================================================================--
	-- INITIALIZE
	--====================================================================--
	
	local initVars = function ()
		
		------------------
		-- Inserts
		------------------
		
		localGroup:insert( background )
		localGroup:insert(buttonInbox)
		localGroup:insert(buttonClaimGifts)
		localGroup:insert(buttonAddFriends)
		localGroup:insert(buttonSettings)
        localGroup:insert( hud.new({label="myPage"}) )
		
		------------------
		-- Positions
		------------------

		buttonInbox.x = 325
		buttonInbox.y = 280
			--
		buttonClaimGifts.x = 325
		buttonClaimGifts.y = 435
		--
		buttonAddFriends.x = 325
		buttonAddFriends.y = 590
		--
		buttonSettings.x = 325
		buttonSettings.y = 745
		
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
