require "CiderDebugger";-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Debug the smart way with Cider!
--start coding and press the debug button

local ui = require("ui")    -- include ui.lua funtions

local scrollGroup = display.newGroup()  -- create a display group for the content that scrolls up/down

-- create the main button touch events
local touchMainButton = function ( event )
    if event.phase == "release" then -- if a button release is detected
        if event.id == "idBack" then
            print("back button pressed")
        elseif event.id == "idHome"  then           
            print("home button pressed")
        elseif event.id == "idNext" then           
            print("next button pressed")
        elseif event.id == "idMyPg"  then          
            print("my page button pressed")
        elseif event.id == "idMissions"  then          
            print("missions button pressed")
        elseif event.id == "idUpgrade" then        
            print("upgrade button pressed") 
        end
    end
end

-- create the scroll button touch events
local touchScrollButton = function ( event )
    if event.phase == "release" then -- if a button release is detected
        if event.id == "idFaq"  then          
            print("FAQ button pressed")
        elseif event.id == "idAddFriend"  then          
            print("Add friend button pressed")
        elseif event.id == "idTapToStart" then         
            print("Tap To Start button pressed")
        elseif event.id == "idMarket"  then         
            print("Market button pressed")
        elseif event.id == "idStorage"  then         
            print("Storage button pressed")
        elseif event.id == "idSRP" then         
            print("Special resoure pack button pressed")
        elseif event.id == "idInvite"  then        
            print("Invite Friends button pressed")
        end
    end
end

-- home screen vars
autoScaleOn = true
autoScaleOff = false

-- load the art (use local to avoid mem leaks)
local background = display.newImage( "BeltMinerMainScreen.png",autoScaleOn) -- draw the background image
--background.x = 320
--background.y = 480
--background.scale(background,20,20)



-- create the buttons
-- faq button
local btFaq = ui.newButton{
    default = "bigBtnUp.png",
    over = "bigBtnDown.png",
    text = "FAQ",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idFaq"
}
-- add friend button
local btAddFriend = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "Add Friend",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idAddFriend"
}
-- tap to start button
local btTapToStart = ui.newButton{
    default = "bigBtnUp.png",
    over = "bigBtnDown.png",
    text = "Tap to Start [My Page]",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idTapToStart"
}
-- market button
local btMarket = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "Market",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idMarket"
}
-- storage button
local btStorage = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "Storage",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idStorage"
}
-- special resource pack button
local btSRP = ui.newButton{
    default = "bigBtnUp.png",
    over = "bigBtnDown.png",
    text = "Special Resource Packs!",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idSRP"
}
-- invite friends button
local btInvite = ui.newButton{
    default = "bigBtnUp.png",
    over = "bigBtnDown.png",
    text = "Invite Friends",
    size = 40,
    font = "Tahoma",
    onEvent = touchScrollButton,
    id = "idInvite"
}

-- load the header/footer background
local bgHeader = display.newImage( "ground.png",autoScaleOn) -- draw the background image
-- load the header/footer background
local bgFooter = display.newImage( "ground.png",autoScaleOn) -- draw the background image

-- back button
local btBack = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "Back",
    size = 40,
    font = "Tahoma",
    onEvent = touchMainButton,
    id = "idBack"
}
-- home button
local btHome = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "HOME",
    size = 60,
    font = "Tahoma",
    onEvent = touchMainButton,
    id = "idHome"
}
-- next button
local btNext = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "NEXT",
    size = 40,
    font = "Tahoma",
    onEvent = touchMainButton,
    id = "idNext"
}
-- my page button
local btMyPg = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "MY PAGE",
    size = 40,
    font = "Tahoma",
    onEvent = touchMainButton,
    id = "idMyPg"
}
-- missions button
local btMissions = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "MISSIONS",
    size = 40,
    font = "Tahoma",
    onEvent = touchMainButton,
    id = "idMissions"
}
-- upgrade button
local btUpgrade = ui.newButton{
    default = "BtnHUDUp.png",
    over = "BtnHUDDown.png",
    text = "UPGRADE",
    size = 40,
    font = "Tahoma",
    onEvent = touchMainButton,
    id = "idUpgrade"
}

-- daily rookie header
local headerDailyRookie = display.newText( "Today's Rookie", 0, 0, Tahoma, 36 )
-- daily rookie image
local imgDailyRookie = display.newImage( "scientistWoman.png",autoScaleOff ) 
-- daily rookie text
local txtDailyRookie = display.newText( "John Doe Miner lvl 06 Friends: 0/5", 0, 0, 210, 0, Tahoma, 36 )
-- message
local txtMessage = display.newText( "Whatever Text we want", 0, 0, Tahoma, 36 )

-- add the scrolling content to the scrolling group
scrollGroup:insert(background)
scrollGroup:insert(btFaq)
scrollGroup:insert(headerDailyRookie)
scrollGroup:insert(imgDailyRookie)
scrollGroup:insert(txtDailyRookie)
scrollGroup:insert(btAddFriend)
scrollGroup:insert(btTapToStart)
scrollGroup:insert(btMarket)
scrollGroup:insert(btStorage)
scrollGroup:insert(btSRP)
scrollGroup:insert(btInvite)
scrollGroup:insert(txtMessage)

-- set the positions for the buttons
-- Back Button
btBack.x = 115
btBack.y = 55
-- Home Button
btHome.x = 325
btHome.y = 55
-- Next Button
btNext.x = 535
btNext.y = 55
-- My Page Button
btMyPg.x = 115
btMyPg.y = 910
-- Missions Button
btMissions.x = 325
btMissions.y = 910
-- Upgrades Button
btUpgrade.x = 535
btUpgrade.y = 910
-- FAQ Button
btFaq.x = 325
btFaq.y = 285
-- Today's rookie header
headerDailyRookie.x = 325
headerDailyRookie.y = 390
-- Today's rookie image
imgDailyRookie.x = 80
imgDailyRookie.y = 500
-- Today's rookie text
txtDailyRookie.x = 290
txtDailyRookie.y = 520
-- Add friend Button
btAddFriend.x = 535
btAddFriend.y = 490
-- Tap to Start Button
btTapToStart.x = 325
btTapToStart.y = 660
-- Market Button
btMarket.x = 170
btMarket.y = 780
-- Storage Button
btStorage.x = 480
btStorage.y = 780
-- Special resource pack Button
btSRP.x = 325
btSRP.y = 900
-- Invite Friends
btInvite.x = 325
btInvite.y = 1050
-- text message
txtMessage.x = 325
txtMessage.y = 1160
-- button header
bgHeader.x = 320
bgHeader.y = 53
-- button footer
bgFooter.x = 320
bgFooter.y = 907

-- scroll group min/max y
scrollGroupMinY = -380
scrollGroupMaxY = 0

-- the scroll function
local function dragBG(event)
    --print("dragBG event: "..event.phase)
    if event.phase == "began" then
        moveY = event.y - scrollGroup.y
        --print ("began-moveY "..moveY.." eventY "..event.y.." scrollGroup.y "..scrollGroup.y)
    elseif event.phase == "moved" then
        newPosY = event.y - moveY
        --print ("newPosY"..newPosY)
        if newPosY > scrollGroupMinY and newPosY <= scrollGroupMaxY then
            scrollGroup.y = event.y - moveY
            --print ("scrollGroup.y "..scrollGroup.y)
       end
    end
end

background:addEventListener("touch",dragBG)


