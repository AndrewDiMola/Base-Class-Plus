function love.load()
	
	-- GENERAL SETTINGS
	gameWidth = love.graphics.getWidth()
	gameHeight = love.graphics.getHeight()
	
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

function loadSelectScreen()

	isSelectScreen = true
	isPlayedSoundEffect = false
	selectScreenRGB = {131,192,240}
	selectScreenOptionsRGB = {255,255,255}
	selectScreenOptionsInFocusRGB = {0,0,0}
	selectScreenTitleFont = love.graphics.newFont(48)	
	selectScreenOptionFont = love.graphics.newFont(36)
	selectScreenMusic = love.audio.newSource("soundtrack/select_screen.mp3", "stream")
	mouseClickMusic = love.audio.newSource("soundtrack/mouse_click.mp3", "static")
	mouseClickMusic:setLooping(false)

	-- TITLE SETTINGS
	gameTitle = "Base Class+"
	gameTitleWidth = selectScreenTitleFont:getWidth(gameTitle)
	gameTitleHeight = selectScreenTitleFont:getHeight(gameTitle)
	gameTitleX = (gameWidth / 2) - (gameTitleWidth / 2)
	gameTitleY = 50
	
	-- OPTION SETTINGS
	fightOption = "FIGHT!"
	isFightOptionActive = false
	fightOptionWidth = selectScreenOptionFont:getWidth(fightOption)
	fightOptionHeight = selectScreenOptionFont:getHeight(fightOption)
	fightOptionX = (gameWidth / 2) - (fightOptionWidth / 2)
	fightOptionY = gameHeight / 2
	
	isClassOptionActive = false
	classOption = "LEARN THE CLASSES!"
	classOptionWidth = selectScreenOptionFont:getWidth(classOption)
	classOptionHeight = selectScreenOptionFont:getHeight(classOption)
	classOptionX = (gameWidth / 2)  - (classOptionWidth / 2)
	classOptionY = (gameHeight / 2) + 50
end

function loadFightScreen()
	
	isFightScreen = false
	fightScreenRGB = {255,127,39}
	fightScreenMusic = love.audio.newSource("soundtrack/fight_screen.mp3", "stream")
end

function loadClassScreen()
	
	isClassScreen = false
	classScreenRGB = {163,73,164}
	classScreenMusic = love.audio.newSource("soundtrack/class_screen.mp3", "stream")
end

---------------------------------------
---- love.update utility functions ----
---------------------------------------

function updateSelectScreen()

	selectScreenMusic:play() 
		
	if mouseX >= fightOptionX and mouseX <= (fightOptionX + fightOptionWidth) and mouseY >= fightOptionY and mouseY <= (fightOptionY + fightOptionHeight) then
		if not isPlayedSoundEffect then
			mouseClickMusic:play()
			isPlayedSoundEffect = true
		end
		
		if mouseClicked then 
			isSelectScreen = false 
			isFightScreen = true
		end
			
		isFightOptionActive = true
	else 
		isFightOptionActive = false
	end

	if mouseX >= classOptionX and mouseX <= (classOptionX + classOptionWidth) and mouseY >= classOptionY and mouseY <= (classOptionY + classOptionHeight) then 
		if not isPlayedSoundEffect then
			mouseClickMusic:play()
			isPlayedSoundEffect = true
		end
		
		if mouseClicked then 
			isSelectScreen = false 
			isClassScreen = true
		end
		
		isClassOptionActive = true
	else
		isClassOptionActive = false
	end
	
	if not isFightOptionActive and not isClassOptionActive then isPlayedSoundEffect = false end
end

function updateFightScreen()
	
	selectScreenMusic:stop()
	fightScreenMusic:play() 
end

function updateClassScreen()
	
	selectScreenMusic:stop()
	classScreenMusic:play() 
end

---------------------------------------
----- love.draw utility functions -----
---------------------------------------
function drawSelectScreen()
				
	love.graphics.setColor(selectScreenOptionsRGB)
	love.graphics.setBackgroundColor(selectScreenRGB)
	
	love.graphics.setFont(selectScreenTitleFont)
	love.graphics.printf(gameTitle,0,gameTitleY,gameWidth,"center")
	
	love.graphics.setFont(selectScreenOptionFont)
	love.graphics.printf(fightOption,0,fightOptionY,gameWidth,"center")
	love.graphics.printf(classOption,0,classOptionY,gameWidth,"center")
	
	if isFightOptionActive then		
		love.graphics.setColor(selectScreenOptionsInFocusRGB)
		love.graphics.printf(fightOption,0,fightOptionY,gameWidth,"center")
		
		if mouseClicked then drawFightScreen() end
	else 
		love.graphics.setColor(selectScreenOptionsRGB) 
	end
	
	if isClassOptionActive then					
		love.graphics.setColor(selectScreenOptionsInFocusRGB)
		love.graphics.printf(classOption,0,classOptionY,gameWidth,"center")
		
		if mouseClicked then drawClassScreen() end
	else 
		love.graphics.setColor(selectScreenOptionsRGB)
	end	
end

function drawFightScreen()
	
	love.graphics.setBackgroundColor(fightScreenRGB)
end

function drawClassScreen()
	
	love.graphics.setBackgroundColor(classScreenRGB)
end