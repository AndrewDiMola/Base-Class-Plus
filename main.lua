function love.load()

	loadGeneralSettings()
	loadSelectScreen()
	loadFightScreen()
	loadClassScreen()
end

function love.draw()

	if isSelectScreen then drawSelectScreen() end
	if isFightScreen then drawFightScreen() end
	if isClassScreen then drawClassScreen() end
end

function love.update(dt)

	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
		
	if love.mouse.isDown(1) then
		mouseClicked = true
	else
		mouseClicked = false
	end
				
	if isSelectScreen then updateSelectScreen() end
	if isFightScreen then updateFightScreen() end
	if isClassScreen then updateClassScreen() end
end

function love.keypressed(key)
  
end

---------------------------------------
----- love.load utility functions -----
---------------------------------------

function loadGeneralSettings()
	
	-- GENERAL SETTINGS
	gameWidth = love.graphics.getWidth()
	gameHeight = love.graphics.getHeight()
	OptionsRGB = {255,255,255}
	OptionsInFocusRGB = {0,0,0}
	
	-- RETURN OPTION SETTINGS
	returnOption = "RETURN"
	returnOptionFont = love.graphics.newFont(36)
	returnOptionWidth = returnOptionFont:getWidth(returnOption)
	returnOptionHeight = returnOptionFont:getHeight(returnOption)
	returnOptionX = (gameWidth / 2) - (returnOptionWidth / 2)
	returnOptionY = gameHeight - 100	
	isReturnOptionActive = false

end

function loadSelectScreen()

	-- GENERAL SETTINGS
	selectScreenRGB = {131,192,240}
	isSelectScreen = true

	-- TITLE SETTINGS
	gameTitle = "Base Class+"
	gameTitleFont = love.graphics.newFont(48)	
	gameTitleWidth = gameTitleFont:getWidth(gameTitle)
	gameTitleHeight = gameTitleFont:getHeight(gameTitle)
	gameTitleX = (gameWidth / 2) - (gameTitleWidth / 2)
	gameTitleY = 25
	
	-- FIGHT OPTION SETTINGS
	fightOption = "FIGHT!"
	fightOptionFont = love.graphics.newFont(36)
	fightOptionWidth = fightOptionFont:getWidth(fightOption)
	fightOptionHeight = fightOptionFont:getHeight(fightOption)
	fightOptionX = (gameWidth / 2) - (fightOptionWidth / 2)
	fightOptionY = gameHeight / 2
	isFightOptionActive = false
	
	-- CLASS OPTION SETTINGS
	classOption = "LEARN THE CLASSES!"
	classOptionFont = love.graphics.newFont(36)
	classOptionWidth = classOptionFont:getWidth(classOption)
	classOptionHeight = classOptionFont:getHeight(classOption)
	classOptionX = (gameWidth / 2) - (classOptionWidth / 2)
	classOptionY = (gameHeight / 2) + 50
	isClassOptionActive = false
	
	-- MUSIC SETTINGS
	selectScreenMusic = love.audio.newSource("soundtrack/select_screen.mp3", "stream")
	mouseClickMusic = love.audio.newSource("soundtrack/mouse_click.mp3", "static")
	mouseClickMusic:setLooping(false)
	isPlayedMouseClick = false
end

function loadFightScreen()
	
	-- GENERAL SETTINGS
	fightScreenRGB = {255,127,39}
	isFightScreen = false
	
	-- MUSIC SETTINGS
	fightScreenMusic = love.audio.newSource("soundtrack/fight_screen.mp3", "stream")
end

function loadClassScreen()
	
	-- GENERAL SETTINGS
	classScreenRGB = {163,73,164}
	isClassScreen = false
	
	-- TITLE SETTINGS
	classScreenTitle = "The Base Classes"
	classScreenTitleFont = love.graphics.newFont(48)	
	classScreenTitleWidth = classScreenTitleFont:getWidth(classScreenTitle)
	classScreenTitleHeight = classScreenTitleFont:getHeight(classScreenTitle)
	classScreenTitleX = (gameWidth / 2) - (classScreenTitleWidth / 2)
	classScreenTitleY = 25
	
	-- IMAGE SETTINGS
	brute = love.graphics.newImage("images/brute.png") -- Used as reference for base dimensions for drawing other classes
	speedster = love.graphics.newImage("images/speedster.png")
	acolyte = love.graphics.newImage("images/acolyte.png")
	zealot = love.graphics.newImage("images/zealot.png")
	classDescriptionWidth = brute:getWidth()
	classDescriptionHeight = brute:getHeight()
	classDescriptionX = (gameWidth / 2)  - (classDescriptionWidth / 2)
	classDescriptionY = gameHeight / 6
	
	-- BRUTE OPTION SETTINGS
	bruteName = "Brute"
	bruteNameFont = love.graphics.newFont(24)	
	bruteNameWidth = bruteNameFont:getWidth(bruteName)
	bruteNameHeight = bruteNameFont:getHeight(bruteName)
	bruteNameX = 50
	bruteNameY = gameHeight - 50
	isBruteNameActive = false
	
	-- SPEEDSTER OPTION SETTINGS
	speedsterName = "Speedster"
	speedsterNameFont = love.graphics.newFont(24)	
	speedsterNameWidth = speedsterNameFont:getWidth(speedsterName)
	speedsterNameHeight = speedsterNameFont:getHeight(speedsterName)
	speedsterNameX = 250
	speedsterNameY = gameHeight - 50
	isSpeedsterNameActive = false
	
	-- ACOLYTE OPTION SETTINGS
	acolyteName = "Acolyte"
	acolyteNameFont = love.graphics.newFont(24)	
	acolyteNameWidth = acolyteNameFont:getWidth(acolyteName)
	acolyteNameHeight = acolyteNameFont:getHeight(acolyteName)
	acolyteNameX = 450
	acolyteNameY = gameHeight - 50
	isAcolyteNameActive = false

	-- ZEALOT OPTION SETTINGS
	zealotName = "Zealot"
	zealotNameFont = love.graphics.newFont(24)	
	zealotNameWidth = zealotNameFont:getWidth(zealotName)
	zealotNameHeight = zealotNameFont:getHeight(zealotName)
	zealotNameX = 650
	zealotNameY = gameHeight - 50
	isZealotNameActive = false
	
	-- MUSIC SETTINGS
	classScreenMusic = love.audio.newSource("soundtrack/class_screen.mp3", "stream")
end

---------------------------------------
---- love.update utility functions ----
---------------------------------------

function updateSelectScreen()

	-- MUSIC UPDATES
	fightScreenMusic:stop()
	classScreenMusic:stop()
	selectScreenMusic:play() 
		
	-- FIGHT OPTION UPDATES
	if mouseX >= fightOptionX and mouseX <= (fightOptionX + fightOptionWidth) and mouseY >= fightOptionY and mouseY <= (fightOptionY + fightOptionHeight) then
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
			isPlayedMouseClick = false
			isSelectScreen = false 
			isFightScreen = true
		end
			
		isFightOptionActive = true
	else 
		isFightOptionActive = false
	end

	-- CLASS OPTION UPDATES
	if mouseX >= classOptionX and mouseX <= (classOptionX + classOptionWidth) and mouseY >= classOptionY and mouseY <= (classOptionY + classOptionHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
			isPlayedMouseClick = false
			isSelectScreen = false 
			isClassScreen = true
		end
		
		isClassOptionActive = true
	else
		isClassOptionActive = false
	end
	
	if not isFightOptionActive and not isClassOptionActive then isPlayedMouseClick = false end
end

function updateFightScreen()
	
	-- MUSIC UPDATES
	selectScreenMusic:stop()
	fightScreenMusic:play() 
	
	-- RETURN OPTION UPDATES
	if mouseX >= returnOptionX and mouseX <= (returnOptionX + returnOptionWidth) and mouseY >= returnOptionY and mouseY <= (returnOptionY + returnOptionHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
			isFightScreen = false 
			isSelectScreen = true
		end
		
		isReturnOptionActive = true
	else 
		isReturnOptionActive = false
	end
	
	if not isReturnOptionActive then isPlayedMouseClick = false end
end

function updateClassScreen()
	
	-- MUSIC UPDATES
	selectScreenMusic:stop()
	classScreenMusic:play() 
	
	-- RETURN OPTION UPDATES
	if mouseX >= returnOptionX and mouseX <= (returnOptionX + returnOptionWidth) and mouseY >= returnOptionY and mouseY <= (returnOptionY + returnOptionHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
			isClassScreen = false 
			isSelectScreen = true
		end
		
		isReturnOptionActive = true
	else 
		isReturnOptionActive = false
	end
	
	-- BRUTE OPTION UPDATES
	if mouseX >= bruteNameX and mouseX <= (bruteNameX + bruteNameWidth) and mouseY >= bruteNameY and mouseY <= (bruteNameY + bruteNameHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
		isPlayedMouseClick = false		
		-- TODO
		end
		
		isBruteNameActive = true
	else 
		isBruteNameActive = false
	end
	
	-- SPEEDSTER OPTION UPDATES
	if mouseX >= speedsterNameX and mouseX <= (speedsterNameX + speedsterNameWidth) and mouseY >= speedsterNameY and mouseY <= (speedsterNameY + speedsterNameHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
		isPlayedMouseClick = false
		-- TODO
		end
		
		isSpeedsterNameActive = true
	else 
		isSpeedsterNameActive = false
	end
	
	-- ACOLYTE OPTION UPDATES
	if mouseX >= acolyteNameX and mouseX <= (acolyteNameX + acolyteNameWidth) and mouseY >= acolyteNameY and mouseY <= (acolyteNameY + acolyteNameHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
		isPlayedMouseClick = false
		-- TODO
		end
		
		isAcolyteNameActive = true
	else 
		isAcolyteNameActive = false
	end
	
	-- ZEALOT OPTION UPDATES
	if mouseX >= zealotNameX and mouseX <= (zealotNameX + zealotNameWidth) and mouseY >= zealotNameY and mouseY <= (zealotNameY + zealotNameHeight) then 
		if not isPlayedMouseClick then
			mouseClickMusic:play()
			isPlayedMouseClick = true
		end
		
		if mouseClicked then 
		isPlayedMouseClick = false
		
		-- TODO
		end
		
		isZealotNameActive = true
	else 
		isZealotNameActive = false
	end
	
	if not isReturnOptionActive and not isBruteNameActive and not isSpeedsterNameActive and not isAcolyteNameActive and not isZealotNameActive then isPlayedMouseClick = false end
end

---------------------------------------
----- love.draw utility functions -----
---------------------------------------
function drawSelectScreen()
				
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(OptionsRGB)
	love.graphics.setBackgroundColor(selectScreenRGB)
	
	-- DRAW SELECT SCREEN TITLE
	love.graphics.setFont(gameTitleFont)
	love.graphics.printf(gameTitle,0,gameTitleY,gameWidth,"center")
		
	-- DRAW FIGHT OPTION
	love.graphics.setFont(fightOptionFont)
	love.graphics.printf(fightOption,0,fightOptionY,gameWidth,"center")

	-- DRAW CLASS OPTION
	love.graphics.setFont(classOptionFont)
	love.graphics.printf(classOption,0,classOptionY,gameWidth,"center")
	
	-- OPTION HIGHLIGHTING
	if isFightOptionActive then	
		love.graphics.setFont(fightOptionFont)	
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.printf(fightOption,0,fightOptionY,gameWidth,"center")
	else 
		love.graphics.setColor(OptionsRGB) 
	end
	
	if isClassOptionActive then					
		love.graphics.setFont(classOptionFont)
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.printf(classOption,0,classOptionY,gameWidth,"center")
	else 
		love.graphics.setColor(OptionsRGB)
	end	
end

function drawFightScreen()
	
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(OptionsRGB)
	love.graphics.setBackgroundColor(fightScreenRGB)
	
	-- DRAW RETURN OPTION
	love.graphics.setFont(returnOptionFont)
	love.graphics.printf(returnOption,0,returnOptionY,gameWidth,"center")
	
	-- OPTION HIGHLIGHTING
	if isReturnOptionActive then		
		love.graphics.setFont(returnOptionFont)
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.printf(returnOption,0,returnOptionY,gameWidth,"center")
	else 
		love.graphics.setColor(OptionsRGB) 
	end
end

function drawClassScreen()
	
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(OptionsRGB)
	love.graphics.setBackgroundColor(classScreenRGB)
	
	-- DRAW CLASS SCREEN TITLE
	love.graphics.setFont(classScreenTitleFont)
	love.graphics.printf(classScreenTitle,0,classScreenTitleY,gameWidth,"center")
	
	-- DRAW BRUTE OPTION
	love.graphics.setFont(bruteNameFont)
	love.graphics.print(bruteName,bruteNameX,bruteNameY)
	
	-- DRAW SPEEDSTER OPTION
	love.graphics.setFont(speedsterNameFont)
	love.graphics.print(speedsterName,speedsterNameX,speedsterNameY)
	
	-- DRAW ACOLYTE OPTION
	love.graphics.setFont(acolyteNameFont)
	love.graphics.print(acolyteName,acolyteNameX,acolyteNameY)
	
	-- DRAW ZEALOT OPTION
	love.graphics.setFont(zealotNameFont)
	love.graphics.print(zealotName,zealotNameX,zealotNameY)
	
	-- DRAW RETURN OPTION
	love.graphics.setFont(returnOptionFont)
	love.graphics.printf(returnOption,0,returnOptionY,gameWidth,"center")
	
	-- DRAW CHARACTER DESCRIPTIONS
	if isBruteNameActive then love.graphics.draw(brute, classDescriptionX, classDescriptionY) end
	if isSpeedsterNameActive then love.graphics.draw(speedster, classDescriptionX, classDescriptionY) end
	if isAcolyteNameActive then love.graphics.draw(acolyte, classDescriptionX, classDescriptionY) end
	if isZealotNameActive then love.graphics.draw(zealot, classDescriptionX, classDescriptionY) end

	-- OPTION HIGHLIGHTING
	if isReturnOptionActive then	
		love.graphics.setFont(returnOptionFont)	
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.printf(returnOption,0,returnOptionY,gameWidth,"center")
	else 
		love.graphics.setColor(OptionsRGB) 
	end
	
	if isBruteNameActive then		
		love.graphics.setFont(bruteNameFont)
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.print(bruteName,bruteNameX,bruteNameY)
	else 
		love.graphics.setColor(OptionsRGB) 
	end
	
	if isSpeedsterNameActive then		
		love.graphics.setFont(speedsterNameFont)
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.print(speedsterName,speedsterNameX,speedsterNameY)
	else 
		love.graphics.setColor(OptionsRGB) 
	end
	
	if isAcolyteNameActive then		
		love.graphics.setFont(acolyteNameFont)
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.print(acolyteName,acolyteNameX,acolyteNameY)
	else 
		love.graphics.setColor(OptionsRGB) 
	end
	
	if isZealotNameActive then		
		love.graphics.setFont(zealotNameFont)
		love.graphics.setColor(OptionsInFocusRGB)
		love.graphics.print(zealotName,zealotNameX,zealotNameY)
	else 
		love.graphics.setColor(OptionsRGB) 
	end
end
