--
-- Created by IntelliJ IDEA.
-- User: byrt
-- Date: 3/23/13
-- Time: 9:57 PM
-- To change this template use File | Settings | File Templates.
--
module(..., package.seeall)

--[[
******************
 - This module consolidates the frame around the app with the 6 buttons that are common
 across all of the subsequent screens. Each screen should import this module so the button
 frame is included.
******************
--]]


new = function ( params )

    local mCallingModule = "home"
    if type( params ) == "table" then
        if type(params.label) == "string" then
            mCallingModule = params.label
        end
    end

    local ui = require ( "modules.ui" )
    local images = require ( "modules.images" )

    local localGroup = display.newGroup()

    ------------------
    -- Display Objects
    ------------------
    local headerHUD = display.newImage(images.GROUND)
    local footerHUD = display.newImage(images.GROUND)


    ------------------
    -- Button callbacks
    ------------------

    local btGoMyPage = function ( event )
        if event.phase == "release" then
            director:changeScene( "modules.myPage", "flip" )
        end
    end
    --
    local btGoHome = function ( event )
        if event.phase == "release" then
            director:changeScene( "modules.home", "downFlip" ) --previously screen2
        end
    end
    --
    local btGoAsteroids = function ( event ) --Upgrade
        if event.phase == "release" then
            director:changeScene( "modules.asteroids", "moveFromTop" )
        end
    end

    --
    local btGoUpgrades = function ( event ) --My Page
        if event.phase == "release" then
            director:changeScene( "modules.upgrade", "moveFromLeft" )
        end
    end
    --
    local btGoMissions = function ( event )
        if event.phase == "release" then --Missions
            director:changeScene( "modules.missions", "overFromRight" )
        end
    end
    --
    local btGoStorage = function ( event )
        if event.phase == "release" then --Storage
            director:changeScene( { label=mCallingModule}, "modules.storage", "overFromRight" )
        end
    end
    --
	--========================--
    --HUD Buttons
	--========================--
    local buttonMyPage = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "MY PAGE",
        size = 40,
        font = "Tahoma",
        onEvent = btGoMyPage,
        id = "buttonMyPage"
    }
    --
    local buttonHome = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "HOME",
        size = 56,
        font = "Tahoma",
        onEvent = btGoHome,
        id = "buttonHome"
    }
    --
    local buttonAsteroids = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "ASTEROIDS",
        size = 40,
        font = "Tahoma",
        onEvent = btGoAsteroids,
        id = "buttonAsteroids"
    }
    --
    local buttonUpgrades = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "UPGRADE",
        size = 40,
        font = "Tahoma",
        onEvent = btGoUpgrades,
        id = "buttonUpgrades"
    }
    --
    local buttonMissions = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "MISSIONS",
        size = 40,
        font = "Tahoma",
        onEvent = btGoMissions,
        id = "buttonMissions"
    }
    --
    local buttonStorage = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "STORAGE",
        size = 40,
        font = "Tahoma",
        onEvent = btGoStorage,
        id = "buttonStorage"
    }
    --

    --====================================================================--
    -- INITIALIZE
    --====================================================================--

    local initVars = function ()

    ------------------
    -- Inserts
    ------------------

        localGroup:insert( headerHUD )
        localGroup:insert( footerHUD )
        localGroup:insert(buttonMyPage)
        localGroup:insert(buttonHome)
        localGroup:insert(buttonAsteroids)
        localGroup:insert(buttonUpgrades)
        localGroup:insert(buttonMissions)
        localGroup:insert(buttonStorage)

        ------------------
        -- Positions
        ------------------

        --
        headerHUD.x = 320
        headerHUD.y = 54
        --
        footerHUD.x = 320
        footerHUD.y = 905


        -- Back Button
        buttonMyPage.x = 115
        buttonMyPage.y = 55
        -- Home Button
        buttonHome.x = 325
        buttonHome.y = 55
        -- Asteroids Button
        buttonAsteroids.x = 535
        buttonAsteroids.y = 55


        -- Upgrade Button
        buttonUpgrades.x = 115
        buttonUpgrades.y = 910
        -- Missions Button
        buttonMissions.x = 325
        buttonMissions.y = 910
        -- Storage Button
        buttonStorage.x = 535
        buttonStorage.y = 910
        --


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