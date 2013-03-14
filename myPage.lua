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
	
	local ui = require ( "ui" )
	
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
	
	local background = display.newImage( "MyPageScreen.png" )
	--local title = display.newText( vLabel, 0, 0, Tahoma, 47 )
	--local msgLabel = display.newText( "You get free fuel until level 20. Complete your missions now!", 0, 0, 410, 0, Tahoma, 36 ) -- make dynamic
	local headerHUD = display.newImage( "ground.png" )
	local footerHUD = display.newImage( "ground.png" )
		
	------------------
	-- Functions
	------------------
	
	local bt01t = function ( event )
		if event.phase == "release" then
			director:changeScene( "missions", "overFromRight" )
		end
	end
	--
	local bt02t = function ( event )
		if event.phase == "release" then
			director:changeScene( "myPage", "moveFromLeft" )
		end
	end
	--
	local bt03t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "moveFromTop" )
		end
	end
	--
	local bt04t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "overFromBottom" )
		end
	end
	--
	local bt05t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "flip" )
		end
	end
	--
	local bt06t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen1", "downFlip" ) --previously screen2
		end
	end
	--
	local bt07t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "fade" )
		end
	end
	--
	local bt08t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "crossfade" )
		end
	end
	--
	local bt09t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "crossfade" )
		end
	end
	--
	local bt10t = function ( event )
		if event.phase == "release" then
			director:changeScene( "screen2", "crossfade" )
		end
	end
	
	------------------
	-- UI Objects
	------------------
	
	local bt01 = ui.newButton{
					default = "BtnHUDUp.png",
					over = "BtnHUDDown.png",
					text = "MISSIONS",
					size = 40,
					font = "Tahoma",
					onEvent = bt01t,
					id = "bt01"
	}
	--
	local bt02 = ui.newButton{
					default = "BtnHUDUp.png",
					over = "BtnHUDDown.png",
					text = "MY PAGE",
					size = 40,
					font = "Tahoma",
					onEvent = bt02t,
					id = "bt02"
	}
	--
	local bt03 = ui.newButton{
					default = "BtnHUDUp.png",
					over = "BtnHUDDown.png",
					text = "UPGRADE",
					size = 40,
					font = "Tahoma",
					onEvent = bt03t,
					id = "bt03"
	}
	--
	local bt04 = ui.newButton{
					default = "bigBtnUp.png",
					over = "bigBtnDown.png",
					text = "INBOX",
					size = 50,
					font = "Tahoma",
					onEvent = bt04t, --previously bt04t
					id = "bt04"
	}
	--
	local bt05 = ui.newButton{
					default = "BtnHUDUp.png",
					over = "BtnHUDDown.png",
					text = "BACK",
					size = 40,
					font = "Tahoma",
					onEvent = bt05t,
					id = "bt05"
	}
	--
	local bt06 = ui.newButton{
					default = "BtnHUDUp.png",
					over = "BtnHUDDown.png",
					text = "HOME",
					size = 60,
					font = "Tahoma",
					onEvent = bt06t,
					id = "bt06"
	}
	--
	local bt07 = ui.newButton{
					default = "BtnHUDUp.png",
					over = "BtnHUDDown.png",
					text = "NEXT",
					size = 40,
					font = "Tahoma",
					onEvent = bt07t,
					id = "bt07"
	}
	--
	local bt08 = ui.newButton{
					default = "bigBtnUp.png",
					over = "bigBtnDown.png",
					text = "CLAIM GIFTS",
					size = 50,
					font = "Tahoma",
					onEvent = bt08t, --previously bt04t
					id = "bt08"
	}
	local bt09 = ui.newButton{
					default = "bigBtnUp.png",
					over = "bigBtnDown.png",
					text = "ADD FRIENDS",
					size = 50,
					font = "Tahoma",
					onEvent = bt09t, --previously bt04t
					id = "bt09"
	}
	local bt10 = ui.newButton{
					default = "bigBtnUp.png",
					over = "bigBtnDown.png",
					text = "SETTINGS",
					size = 50,
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
				director:changeScene( { label="Scene Reloaded" }, "screen2","moveFromRight" )
			else
				director:changeScene( "screen1", "crossfade" )
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
		--localGroup:insert( title )
		localGroup:insert( headerHUD )
		localGroup:insert( footerHUD )
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
		bt04.y = 280
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
		bt08.x = 325
		bt08.y = 435  
		--
		bt09.x = 325
		bt09.y = 590  	
		--
		bt10.x = 325
		bt10.y = 745  		
		
		------------------
		-- Colors
		------------------
		
		--title:setTextColor( 152,152,152 )
		
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
