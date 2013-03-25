module(..., package.seeall)

--====================================================================--
-- SCENE: MISSION LAUNCH SCREEN
--====================================================================--

new = function ( params )


    -- includes (for other files)
    --print ("[1]includes")
    local ui = require ( "modules.ui" )
    local images = require ( "modules.images" )
    
    -- global vars
    --print("[2]global vars")
    _W = display.contentWidth; --Returns Screen Width
    _H = display.contentHeight; --Returns Screen Height
    autoScaleOn = true
    autoScaleOff = false
    maxSmallStars = 10  -- total number of small stars
    
    -- local vars
    --print("[3]local vars")
    local tPrevious = system.getTimer() -- get now
    local updateStars = true    -- while true, update the stars

    -- Label
    --print("[4]labels")
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
    
    -- Display Groups
    --print("[5]display groups")
    local localGroup = display.newGroup()

    -- Display Objects
    local background = display.newImage( images.STARS,autoScaleOn )
    local randomStar
    local starsSmall = {}   -- tables to hold star display objects
    --local starsMed = {}
    --local starsLarge = {}
    local footerHUD = display.newImage( "assets/ground.png",autoScaleOn) -- draw the HUD BG image
    local prospector = display.newImage( images.PROSPECTOR )

    -- Functions
    --print ("[6]functions")
    function prepStarsSmall()
        -- populate the screen with # small stars
        for thisSmallStar = 1,maxSmallStars do -- repeat for each small star
            starsSmall[thisSmallStar] = display.newImage("assets/star01.png")   -- assign a bitmap
            starsSmall[thisSmallStar].x = math.random(0,_W) -- set a random X pos
            starsSmall[thisSmallStar].y = math.random(0,_H) -- set a random Y pos
            starsSmall[thisSmallStar].movementSpeed = .075 -- set the movement speed
        end
    end
    
    function updateSmallStars(event) -- move the small stars
        --print("updateSmallStars called")
        local tDelta = event.time - tPrevious
        tPrevious = event.time
        if updateStars then     -- if true, update the stars
            for thisSmallStar = 1,maxSmallStars do -- repeat for each small star
                starsSmall[thisSmallStar].y = starsSmall[thisSmallStar].y + ( starsSmall[thisSmallStar].movementSpeed * tDelta )
                if starsSmall[thisSmallStar].y >= _H then 
                    starsSmall[thisSmallStar].y = 0
                end
            end
       end
    end
    
    local touchHomeButton = function ( event ) --Missions
        if event.phase == "release" then
            print("home button pressed")
            -- garbage collection TO DO
            updateStars = false -- stop updating the stars
            director:changeScene( "modules.screen2", "overFromRight" )
        end
    end
    
    local touchJumpButton = function ( event )
        if event.phase == "release" then -- if a button release is detected
            print("jump boost button pressed")
            
        end
    end

    -- UI Objects
    --print("[7]ui objects")
    local btHome = ui.newButton{
        default = images.BUTTON_HUD_UP,
        over = images.BUTTON_HUD_DOWN,
        text = "HOME",
        size = 40,
        font = "Tahoma",
        onEvent = touchHomeButton,
        id = "idHomeButton"
    }

    local btJumpBoost = ui.newButton{
        default = "assets/jumpboost.png",
        over = "assets/jumpboost.png",
        onEvent = touchJumpButton,
        id = "idJumpBoost"
    }

    -- Listeners
    --print("[8]listeners")
    local touched = function ( event )
        if event.phase == "ended" then
            if vReload then
                    director:changeScene( { label="Scene Reloaded" }, "modules.screen2","moveFromRight" )
            else
                    director:changeScene( "modules.screen1", "crossfade" )
            end
        end
    end
    
    -- INITIALIZE
    local initVars = function ()
	--print("initVars started")	
        ------------------
        -- Inserts
        ------------------

        localGroup:insert( background )
        for thisSmallStar = 1,maxSmallStars do -- repeat for each small star
            localGroup:insert( starsSmall[thisSmallStar] )
        end
        localGroup:insert( prospector )
        localGroup:insert( footerHUD)
        localGroup:insert( btHome )
        localGroup:insert( btJumpBoost)

	------------------
        -- Positions
        ------------------
        --
        prospector.x = 320
        prospector.y = 480
        --
        footerHUD.x = 320
        footerHUD.y = 907  		
        -- Home Button
        btHome.x = 100
        btHome.y = 910
        -- jump boost button
        btJumpBoost.x = 425
        btJumpBoost.y = 900

        ------------------
        -- Listeners
        ------------------
        --background:addEventListener( "touch" , touched ) -- dont need this
	--print("initVars ended")	
    end

    -- MAIN STARTS HERE
    --print("[9]main starts")
    prepStarsSmall()        -- prep the small stars
    initVars()              -- init variables
    Runtime:addEventListener( "enterFrame", updateSmallStars );
    
    -- MUST return a display.newGroup()
    return localGroup
	
end
