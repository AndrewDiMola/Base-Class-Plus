function love.load()

	loadGeneralSettings()
	loadSelectScreen()
	loadFightScreen()
	loadClassScreen()
end

function love.draw()

	if selectScreen.isScreenActive then drawSelectScreen() end
	if fightScreen.isScreenActive then drawFightScreen() end
	if classScreen.isScreenActive then drawClassScreen() end
end

function love.update(dt)

	game.mouseX = love.mouse.getX()
	game.mouseY = love.mouse.getY()
		
	if love.mouse.isDown(1) then
		game.isMouseDown = true
	else
		game.isMouseDown = false
	end
				
	if selectScreen.isScreenActive then updateSelectScreen() end
	if fightScreen.isScreenActive then updateFightScreen() end
	if classScreen.isScreenActive then updateClassScreen() end
end

function love.keypressed(key)
  
end

---------------------------------------
----- love.load utility functions -----
---------------------------------------

function loadGeneralSettings()
	
	-- GAME SETTINGS
	game = {}
	game.width = love.graphics.getWidth()
	game.height = love.graphics.getHeight()
	game.mouseX = 0
	game.mouseY = 0
	game.isMouseDown = false
	game.cursorMove = love.audio.newSource("soundtrack/cursor_move.mp3", "static")
	game.cursorMove:setLooping(false)
	game.playSoundEffect = false
	game.optionsRGB = {255,255,255}
	game.hoverRGB = {0,0,0}

	-- RETURN OPTION SETTINGS
	returnOption = {}
	returnOption.name = "RETURN"
	returnOption.font = love.graphics.newFont(36)
	returnOption.width = returnOption.font:getWidth(returnOption.name)
	returnOption.height = returnOption.font:getHeight(returnOption.name)
	returnOption.X = (game.width / 2) - (returnOption.width / 2)
	returnOption.Y = game.height - 100	
	returnOption.isMouseOver = false
end

function loadSelectScreen()

	-- SCREEN SETTINGS
	selectScreen = {}
	selectScreen.backgroundRGB = {131,192,240}
	selectScreen.music = love.audio.newSource("soundtrack/select_screen.mp3", "stream")
	selectScreen.isScreenActive = true

	-- TITLE SETTINGS
	selectScreenTitle = {}
	selectScreenTitle.name = "Base Class+"
	selectScreenTitle.font = love.graphics.newFont(48)	
	selectScreenTitle.width = selectScreenTitle.font:getWidth(selectScreenTitle.name)
	selectScreenTitle.height = selectScreenTitle.font:getHeight(selectScreenTitle.name)
	selectScreenTitle.X = (game.width / 2) - (selectScreenTitle.width / 2)
	selectScreenTitle.Y = 25
	
	-- FIGHT OPTION SETTINGS
	fightOption = {}
	fightOption.name = "FIGHT!"
	fightOption.font = love.graphics.newFont(36)
	fightOption.width = fightOption.font:getWidth(fightOption.name)
	fightOption.height = fightOption.font:getHeight(fightOption.name)
	fightOption.X = (game.width / 2) - (fightOption.width / 2)
	fightOption.Y = game.height / 2
	fightOption.isMouseOver = false
	
	-- CLASS OPTION SETTINGS
	classOption = {}
	classOption.name = "LEARN THE CLASSES!"
	classOption.font = love.graphics.newFont(36)
	classOption.width = classOption.font:getWidth(classOption.name)
	classOption.height = classOption.font:getHeight(classOption.name)
	classOption.X = (game.width / 2) - (classOption.width / 2)
	classOption.Y = (game.height / 2) + 50
	classOption.isMouseOver = false
	
	-- COMBINED SELECT SCREEN OPTIONS
	selectScreenOptions = {fightOption, classOption}
end

function loadFightScreen()
	
	-- SCREEN SETTINGS
	fightScreen = {}
	fightScreen.backgroundRGB = {255,127,39}
	fightScreen.music = love.audio.newSource("soundtrack/fight_screen.mp3", "stream")
	fightScreen.isScreenActive = false
	
	-- COMBINED FIGHT SCREEN OPTIONS
	fightScreenOptions = {returnOption}
end

function loadClassScreen()
	
	-- SCREEN SETTINGS
	classScreen = {}
	classScreen.backgroundRGB = {163,73,164}
	classScreen.music = love.audio.newSource("soundtrack/class_screen.mp3", "stream")
	classScreen.isScreenActive = false
	
	-- TITLE SETTINGS
	classScreenTitle = {}
	classScreenTitle.name = "The Base Classes"
	classScreenTitle.font = love.graphics.newFont(48)
	classScreenTitle.width = classScreenTitle.font:getWidth(classScreenTitle.name)
	classScreenTitle.height = classScreenTitle.font:getHeight(classScreenTitle.name)
	classScreenTitle.X = (game.width / 2) - (classScreenTitle.width / 2)
	classScreenTitle.Y = 25
	
	-- BRUTE LABEL SETTINGS
	bruteLabel = {}
	bruteLabel.name = "Brute"
	bruteLabel.description = love.graphics.newImage("images/brute.png")
	bruteLabel.font = love.graphics.newFont(24)
	bruteLabel.width = bruteLabel.font:getWidth(bruteLabel.name)
	bruteLabel.height = bruteLabel.font:getHeight(bruteLabel.name)
	bruteLabel.X = 50
	bruteLabel.Y = game.height - 50
	bruteLabel.isMouseOver = true
	
	-- SPEEDSTER LABEL SETTINGS
	speedsterLabel = {}
	speedsterLabel.name = "Speedster"
	speedsterLabel.description = love.graphics.newImage("images/speedster.png")
	speedsterLabel.font = love.graphics.newFont(24)
	speedsterLabel.width = speedsterLabel.font:getWidth(speedsterLabel.name)
	speedsterLabel.height = speedsterLabel.font:getHeight(speedsterLabel.name)
	speedsterLabel.X = 250
	speedsterLabel.Y = game.height - 50
	speedsterLabel.isMouseOver = false
	
	-- ACOLYTE LABEL SETTINGS
	acolyteLabel = {}
	acolyteLabel.name = "Acolyte"
	acolyteLabel.description = love.graphics.newImage("images/acolyte.png")
	acolyteLabel.font = love.graphics.newFont(24)
	acolyteLabel.width = acolyteLabel.font:getWidth(acolyteLabel.name)
	acolyteLabel.height = acolyteLabel.font:getHeight(acolyteLabel.name)
	acolyteLabel.X = 450
	acolyteLabel.Y = game.height - 50
	acolyteLabel.isMouseOver = false

	-- ZEALOT LABEL SETTINGS
	zealotLabel = {}
	zealotLabel.name = "Zealot"
	zealotLabel.description = love.graphics.newImage("images/zealot.png")
	zealotLabel.font = love.graphics.newFont(24)
	zealotLabel.width = zealotLabel.font:getWidth(zealotLabel.name)
	zealotLabel.height = zealotLabel.font:getHeight(zealotLabel.name)
	zealotLabel.X = 650
	zealotLabel.Y = game.height - 50
	zealotLabel.isMouseOver = false
		
	-- CLASS DESCRIPTION SETTINGS
	activeClassDescription = {}
	activeClassDescription.width = bruteLabel.width -- For now, width based on brute.width
	activeClassDescription.height = bruteLabel.height -- For now, height based on brute.height
	activeClassDescription.X = (game.width / 2)  - (activeClassDescription.width / 2)
	activeClassDescription.Y = (game.height / 6)
	
	-- COMBINED CLASS SCREEN OPTIONS
	classScreenOptions = {returnOption}
	
	-- COMBINED CLASS SCREEN LABELS
	classScreenLabels = {bruteLabel, speedsterLabel, acolyteLabel, zealotLabel}
	
	-- COMBINED CLASS SCREEN OPTIONS AND LABELS
	classScreenOptionsAndLabels = {returnOption, bruteLabel, speedsterLabel, acolyteLabel, zealotLabel}
end

---------------------------------------
---- love.update utility functions ----
---------------------------------------

function updateSelectScreen()

	-- MUSIC UPDATES
	fightScreen.music:stop()
	classScreen.music:stop()
	selectScreen.music:play() 
		
	-- OPTION UPDATES
	updateOptionsAndLabels(selectScreenOptions)
	
	-- ONLY PLAY THE CURSOR MOVE SOUND EFFECT WHEN HOVERING OVER AN OPTION
	if not fightOption.isMouseOver and not classOption.isMouseOver then game.playSoundEffect = false end
end

function updateFightScreen()
	
	-- MUSIC UPDATES
	selectScreen.music:stop()
	fightScreen.music:play() 
	
	-- OPTION UPDATES
	updateOptionsAndLabels(fightScreenOptions)
	
	-- ONLY PLAY THE CURSOR MOVE SOUND EFFECT WHEN HOVERING OVER AN OPTION
	if not returnOption.isMouseOver then game.playSoundEffect = false end
end

function updateClassScreen()
	
	-- MUSIC UPDATES
	selectScreen.music:stop()
	classScreen.music:play() 
	
	-- OPTION AND LABEL UPDATES
	updateOptionsAndLabels(classScreenOptionsAndLabels)
	
	-- ONLY PLAY THE CURSOR MOVE SOUND EFFECT WHEN HOVERING OVER AN OPTION OR LABEL
	if not returnOption.isMouseOver and not bruteLabel.isMouseOver and not speedsterLabel.isMouseOver and not acolyteLabel.isMouseOver and not zealotLabel.isMouseOver then game.playSoundEffect = false end
end

---------------------------------------
----- love.draw utility functions -----
---------------------------------------
function drawSelectScreen()
				
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(game.optionsRGB)
	love.graphics.setBackgroundColor(selectScreen.backgroundRGB)
	
	-- DRAW SELECT SCREEN TITLE
	love.graphics.setFont(selectScreenTitle.font)
	love.graphics.printf(selectScreenTitle.name, 0, selectScreenTitle.Y, game.width, "center")
		
	-- DRAW SELECT SCREEN OPTIONS
	for index,option in pairs (selectScreenOptions) do
		love.graphics.setFont(option.font)
		love.graphics.printf(option.name,0,option.Y,game.width,"center")
	end
	
	-- CHANGE RGB FOR OPTIONS ON MOUSE HOVER 
	drawHoverRGB(selectScreenOptions)
end

function drawFightScreen()
	
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(game.optionsRGB)
	love.graphics.setBackgroundColor(fightScreen.backgroundRGB)
	
	-- DRAW FIGHT SCREEN OPTIONS
	for index,option in pairs (fightScreenOptions) do
		love.graphics.setFont(option.font)
		love.graphics.printf(option.name,0,option.Y,game.width,"center")
	end
	
	-- CHANGE RGB FOR OPTIONS ON MOUSE HOVER 
	drawHoverRGB(fightScreenOptions)
end

function drawClassScreen()
	
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(game.optionsRGB)
	love.graphics.setBackgroundColor(classScreen.backgroundRGB)
	
	-- DRAW CLASS SCREEN TITLE
	love.graphics.setFont(classScreenTitle.font)
	love.graphics.printf(classScreenTitle.name,0,classScreenTitle.Y,game.width,"center")

	-- DRAW CLASS SCREEN OPTIONS
	for index,option in pairs (classScreenOptions) do
		love.graphics.setFont(option.font)
		love.graphics.printf(option.name,0,option.Y,game.width,"center")
	end
	
	-- DRAW CLASS SCREEN LABELS
	for index,option in pairs (classScreenLabels) do
		love.graphics.setFont(option.font)
		love.graphics.print(option.name,option.X,option.Y)
	end
	
	-- CHANGE RGB FOR OPTIONS AND LABELS ON MOUSE HOVER 
	drawHoverRGB(classScreenOptionsAndLabels)
end

---------------------------------------
--- miscellaneous utility functions ---
---------------------------------------
function isMouseInRectangle(object) -- Takes in a rectangular object (option or label) represented as a table and then returns true if the mouse's position is within that object
	if game.mouseX >= object.X and game.mouseX <= (object.X + object.width) and game.mouseY >= object.Y and game.mouseY <= (object.Y + object.height) then 
		return true
	else
		return false
	end
end

function drawHoverRGB(objects) -- Takes in a list of objects (options and labels) represented as tables and then draws those objects with a custom onHover RGB
	for index,object in pairs (objects) do
		if object.isMouseOver then
			love.graphics.setFont(object.font)	
			love.graphics.setColor(game.hoverRGB)
				if object == fightOption or object == classOption or object == returnOption then 
					love.graphics.printf(object.name,0,object.Y,game.width,"center")
				else
					love.graphics.print(object.name,object.X,object.Y)
				end
		else
			love.graphics.setColor(game.optionsRGB)
		end
	end
end

function updateOptionsAndLabels(objects) -- Takes in a list of objects (options and labels) represented as tables and then updates their table data
 	for index,object in pairs (objects) do 
		local isMouseOver = isMouseInRectangle(object)
		
		if isMouseOver then
			if not game.playSoundEffect then
				game.cursorMove:play()
				game.playSoundEffect = true
			end
			
			if game.isMouseDown then
				game.playSoundEffect = false
				
				if object == fightOption then 
					selectScreen.isScreenActive = false 
					fightScreen.isScreenActive = true 
				end
				
				if object == classOption then 
					selectScreen.isScreenActive = false 
					classScreen.isScreenActive = true 
				end
				
				if object == returnOption and fightScreen.isScreenActive == true then -- Return from the Fight screen
					fightScreen.isScreenActive = false
					selectScreen.isScreenActive = true
				end
				
				if object == returnOption and classScreen.isScreenActive == true then -- Return from the Class screen
					classScreen.isScreenActive = false
					selectScreen.isScreenActive = true
				end
			end
			
			object.isMouseOver = true
		else
			object.isMouseOver = false
		end
	end
end