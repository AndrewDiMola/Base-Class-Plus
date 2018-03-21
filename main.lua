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

	if game.isKeyBoardActive then
		if selectScreen.isScreenActive then updateSelectScreenKeyPressed(key) end
		if fightScreen.isScreenActive then updateFightScreenKeyPressed(key) end
		if classScreen.isScreenActive then updateClassScreenKeyPressed(key) end
	end

	-- LET THE GAME KNOW THE KEYBOARD IS BEING USED IF THE PLAYER USES ANY DIRECTIONAL ARROWS
	if not game.isKeyBoardActive and (key == "up" or key == "down" or key == "left" or key == "right") then 
		game.isKeyBoardActive = true 
		
		-- DEFAULT FOCUS BY SCREEN
		if selectScreen.isScreenActive then fightOption.isKeyboardFocus = true end
		if fightScreen.isScreenActive then returnFromFightOption.isKeyboardFocus = true end
		if classScreen.isScreenActive then returnFromClassOption.isKeyboardFocus = true end
	end
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
	game.isKeyBoardActive = false
	game.cursorMove = love.audio.newSource("soundtrack/cursor_move.mp3", "static")
	game.cursorMove:setLooping(false)
	game.playSoundEffect = false
	game.optionsRGB = {255,255,255}
	game.hoverRGB = {0,0,0}
	game.keyPressedRGB = {0,0,0}
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
	fightOption.isKeyboardFocus = false
	
	-- CLASS OPTION SETTINGS
	classOption = {}
	classOption.name = "LEARN THE CLASSES!"
	classOption.font = love.graphics.newFont(36)
	classOption.width = classOption.font:getWidth(classOption.name)
	classOption.height = classOption.font:getHeight(classOption.name)
	classOption.X = (game.width / 2) - (classOption.width / 2)
	classOption.Y = (game.height / 2) + 50
	classOption.isMouseOver = false
	classOption.isKeyboardFocus = false
	
	-- COMBINED SELECT SCREEN OPTIONS
	selectScreenOptions = {fightOption, classOption}
end

function loadFightScreen()
	
	-- SCREEN SETTINGS
	fightScreen = {}
	fightScreen.backgroundRGB = {63,72,204}
	fightScreen.music = love.audio.newSource("soundtrack/fight_screen.mp3", "stream")
	fightScreen.isScreenActive = false
	
	-- TITLE SETTINGS
	fightScreenTitle = {}
	fightScreenTitle.name = "Choose Your Party"
	fightScreenTitle.font = love.graphics.newFont(48)
	fightScreenTitle.width = fightScreenTitle.font:getWidth(fightScreenTitle.name)
	fightScreenTitle.height = fightScreenTitle.font:getHeight(fightScreenTitle.name)
	fightScreenTitle.X = (game.width / 2) - (fightScreenTitle.width / 2)
	fightScreenTitle.Y = 25
	
	-- BATTLE MAP 1/2
	battleMapSelect = {}
	battleMapSelect.name = "The Viridian Expanse"
	battleMapSelect.map = love.graphics.newImage("images/map_one_select.png")
	battleMapSelect.width = battleMapSelect.map:getWidth() 
	battleMapSelect.height = battleMapSelect.map:getHeight() 
	battleMapSelect.X = (game.width / 2)  - (battleMapSelect.width / 2)
	battleMapSelect.Y = (game.height / 6)
	
	-- BATTLE MAP 2/2
	battleMapFight = {}
	battleMapFight.name = "The Viridian Expanse"
	battleMapFight.map = love.graphics.newImage("images/map_one_fight.png")
	battleMapFight.width = battleMapFight.map:getWidth() 
	battleMapFight.height = battleMapFight.map:getHeight() 
	battleMapFight.X = (game.width / 2)  - (battleMapFight.width / 2)
	battleMapFight.Y = (game.height / 6)
	
	-- RETURN OPTION SETTINGS
	returnFromFightOption = {}
	returnFromFightOption.name = "RETURN"
	returnFromFightOption.font = love.graphics.newFont(36)
	returnFromFightOption.width = returnFromFightOption.font:getWidth(returnFromFightOption.name)
	returnFromFightOption.height = returnFromFightOption.font:getHeight(returnFromFightOption.name)
	returnFromFightOption.X = (game.width / 2) - (returnFromFightOption.width / 2)
	returnFromFightOption.Y = game.height - 100	
	returnFromFightOption.isMouseOver = false
	returnFromFightOption.isKeyboardFocus = false
	
	-- COMBINED FIGHT SCREEN OPTIONS
	fightScreenOptions = {returnFromFightOption}
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
	bruteLabel.header = love.graphics.newImage("images/brute_header.png")
	bruteLabel.portrait = love.graphics.newImage("images/brute_portrait.png")
	bruteLabel.description = love.graphics.newImage("images/brute.png")
	bruteLabel.font = love.graphics.newFont(24)
	bruteLabel.width = bruteLabel.font:getWidth(bruteLabel.name)
	bruteLabel.height = bruteLabel.font:getHeight(bruteLabel.name)
	bruteLabel.X = 50
	bruteLabel.Y = game.height - 50
	bruteLabel.isMouseOver = true
	bruteLabel.isKeyboardFocus = false
	
	-- SPEEDSTER LABEL SETTINGS
	speedsterLabel = {}
	speedsterLabel.name = "Speedster"
	speedsterLabel.header = love.graphics.newImage("images/speedster_header.png")
	speedsterLabel.portrait = love.graphics.newImage("images/speedster_portrait.png")
	speedsterLabel.description = love.graphics.newImage("images/speedster.png")
	speedsterLabel.font = love.graphics.newFont(24)
	speedsterLabel.width = speedsterLabel.font:getWidth(speedsterLabel.name)
	speedsterLabel.height = speedsterLabel.font:getHeight(speedsterLabel.name)
	speedsterLabel.X = 250
	speedsterLabel.Y = game.height - 50
	speedsterLabel.isMouseOver = false
	speedsterLabel.isKeyboardFocus = false
	
	-- ACOLYTE LABEL SETTINGS
	acolyteLabel = {}
	acolyteLabel.name = "Acolyte"
	acolyteLabel.header = love.graphics.newImage("images/acolyte_header.png")
	acolyteLabel.portrait = love.graphics.newImage("images/acolyte_portrait.png")
	acolyteLabel.description = love.graphics.newImage("images/acolyte.png")
	acolyteLabel.font = love.graphics.newFont(24)
	acolyteLabel.width = acolyteLabel.font:getWidth(acolyteLabel.name)
	acolyteLabel.height = acolyteLabel.font:getHeight(acolyteLabel.name)
	acolyteLabel.X = 450
	acolyteLabel.Y = game.height - 50
	acolyteLabel.isMouseOver = false
	acolyteLabel.isKeyboardFocus = false

	-- ZEALOT LABEL SETTINGS
	zealotLabel = {}
	zealotLabel.name = "Zealot"
	zealotLabel.header = love.graphics.newImage("images/zealot_header.png")
	zealotLabel.portrait = love.graphics.newImage("images/zealot_portrait.png")
	zealotLabel.description = love.graphics.newImage("images/zealot.png")
	zealotLabel.font = love.graphics.newFont(24)
	zealotLabel.width = zealotLabel.font:getWidth(zealotLabel.name)
	zealotLabel.height = zealotLabel.font:getHeight(zealotLabel.name)
	zealotLabel.X = 650
	zealotLabel.Y = game.height - 50
	zealotLabel.isMouseOver = false	
	zealotLabel.isKeyboardFocus = false
		
	-- CLASS DESCRIPTION SETTINGS
	activeClassDescription = {}
	activeClassDescription.width = bruteLabel.description:getWidth() 
	activeClassDescription.height = bruteLabel.description:getHeight()
	activeClassDescription.X = (game.width / 2) - (activeClassDescription.width / 2)
	activeClassDescription.Y = game.height / 6
	activeClassDescription.activeClass = bruteLabel		
	
	-- CLASS HEADER SETTINGS
	activeClassHeader = {}
	activeClassHeader.width = bruteLabel.header:getWidth() 
	activeClassHeader.height = bruteLabel.header:getHeight()
	activeClassHeader.X = activeClassDescription.X + 16
	activeClassHeader.Y = activeClassDescription.Y + 16
	activeClassHeader.activeClass = bruteLabel
	
	-- RETURN OPTION SETTINGS
	returnFromClassOption = {}
	returnFromClassOption.name = "RETURN"
	returnFromClassOption.font = love.graphics.newFont(36)
	returnFromClassOption.width = returnFromClassOption.font:getWidth(returnFromClassOption.name)
	returnFromClassOption.height = returnFromClassOption.font:getHeight(returnFromClassOption.name)
	returnFromClassOption.X = (game.width / 2) - (returnFromClassOption.width / 2)
	returnFromClassOption.Y = game.height - 100	
	returnFromClassOption.isMouseOver = false
	returnFromClassOption.isKeyboardFocus = false
	
	-- COMBINED CLASS SCREEN OPTIONS
	classScreenOptions = {returnFromClassOption}
	
	-- COMBINED CLASS SCREEN LABELS
	classScreenLabels = {bruteLabel, speedsterLabel, acolyteLabel, zealotLabel}
	
	-- COMBINED CLASS SCREEN OPTIONS AND LABELS
	classScreenOptionsAndLabels = {returnFromClassOption, bruteLabel, speedsterLabel, acolyteLabel, zealotLabel}
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
	if not returnFromFightOption.isMouseOver then game.playSoundEffect = false end
end

function updateClassScreen()
	
	-- MUSIC UPDATES
	selectScreen.music:stop()
	classScreen.music:play() 
	
	-- OPTION AND LABEL UPDATES
	local classLabel = activeClassDescription.activeClass
	local activeClassIndex = findIndexInTable(classScreenOptionsAndLabels, classLabel)
	table.remove(classScreenOptionsAndLabels,activeClassIndex) -- Don't update the active label, because it is not visible
	updateOptionsAndLabels(classScreenOptionsAndLabels)
	table.insert(classScreenOptionsAndLabels,classLabel) -- Add the removed label back
	
	-- ONLY PLAY THE CURSOR MOVE SOUND EFFECT WHEN HOVERING OVER AN OPTION OR LABEL
	if not returnFromClassOption.isMouseOver and not bruteLabel.isMouseOver and not speedsterLabel.isMouseOver and not acolyteLabel.isMouseOver and not zealotLabel.isMouseOver then game.playSoundEffect = false end
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

	-- CHANGE RGB FOR OPTIONS ON MOUSE HOVER OR KEYBOARD CHANGE 
	drawHoverOrKeyboardRGB(selectScreenOptions)
end

function drawFightScreen()
	
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(game.optionsRGB)
	love.graphics.setBackgroundColor(fightScreen.backgroundRGB)
	
	-- DRAW FIGHT SCREEN TITLE
	love.graphics.setFont(fightScreenTitle.font)
	love.graphics.printf(fightScreenTitle.name,0,fightScreenTitle.Y,game.width,"center")
	
	-- DRAW BATTLE MAP
	love.graphics.draw(battleMapSelect.map,battleMapSelect.X,battleMapSelect.Y)
	
	-- DRAW ACTIVE CLASS HEADER
	love.graphics.draw(activeClassDescription.activeClass.header,activeClassHeader.X,activeClassHeader.Y)
	
	-- DRAW FIGHT SCREEN OPTIONS
	for index,option in pairs (fightScreenOptions) do
		love.graphics.setFont(option.font)
		love.graphics.printf(option.name,0,option.Y,game.width,"center")
	end
	
	-- CHANGE RGB FOR OPTIONS ON MOUSE HOVER OR KEYBOARD CHANGE 
	drawHoverOrKeyboardRGB(fightScreenOptions)
end

function drawClassScreen()
	
	-- GENERAL DRAW SETTINGS
	love.graphics.setColor(game.optionsRGB)
	love.graphics.setBackgroundColor(classScreen.backgroundRGB)
	
	-- DRAW CLASS SCREEN TITLE
	love.graphics.setFont(classScreenTitle.font)
	love.graphics.printf(classScreenTitle.name,0,classScreenTitle.Y,game.width,"center")
	
	-- DRAW ACTIVE CLASS DESCRIPTION
	love.graphics.draw(activeClassDescription.activeClass.description,activeClassDescription.X,activeClassDescription.Y)
	
	-- DRAW CLASS SCREEN LABELS
	for index,option in pairs (classScreenLabels) do
		love.graphics.setFont(option.font)
			if option ~= activeClassDescription.activeClass then
				love.graphics.print(option.name,option.X,option.Y)
			end
	end
	
	-- DRAW CLASS SCREEN OPTIONS
	for index,option in pairs (classScreenOptions) do
		love.graphics.setFont(option.font)
		love.graphics.printf(option.name,0,option.Y,game.width,"center")
	end
	
	-- CHANGE RGB FOR OPTIONS ON MOUSE HOVER OR KEYBOARD CHANGE 
	drawHoverOrKeyboardRGB(classScreenOptionsAndLabels)
end

---------------------------------------
-- love.keypressed utility functions --
---------------------------------------
function updateSelectScreenKeyPressed(key)

	-- ACTUAL KEYBOARD FUNCTIONALITY			
	if key == "up" or key == "down" then
		if fightOption.isKeyboardFocus and not classOption.isKeyboardFocus then
			fightOption.isKeyboardFocus = false
			classOption.isKeyboardFocus = true
		else 
			fightOption.isKeyboardFocus = true
			classOption.isKeyboardFocus = false
		end
	end

	if key == "return" then
		if fightOption.isKeyboardFocus then 
			clearKeyboardFocus()
			selectScreen.isScreenActive = false
			fightScreen.isScreenActive = true 
		end
		if classOption.isKeyboardFocus then 
			clearKeyboardFocus()
			selectScreen.isScreenActive = false
			classScreen.isScreenActive = true
		end
	end
end

function updateFightScreenKeyPressed(key)
		
	-- ACTUAL KEYBOARD FUNCTIONALITY
	if key == "up" or key == "down" then
		returnFromFightOption.isKeyboardFocus = not returnFromFightOption.isKeyboardFocus
	end

	if key == "return" then
		if returnFromFightOption.isKeyboardFocus then 
			clearKeyboardFocus()
			fightScreen.isScreenActive = false
			selectScreen.isScreenActive = true
		end
	end
end

function updateClassScreenKeyPressed(key)
	
	-- ACTUAL KEYBOARD FUNCTIONALITY
	if key == "up" or key == "down" then
		returnFromClassOption.isKeyboardFocus = not returnFromClassOption.isKeyboardFocus
	end

	if key == "return" then
		if returnFromClassOption.isKeyboardFocus then
			clearKeyboardFocus()		
			classScreen.isScreenActive = false
			selectScreen.isScreenActive = true
		end
	end
end

---------------------------------------
--- miscellaneous utility functions ---
---------------------------------------
function findIndexInTable(tab,val)
	for index,value in pairs(tab) do
		if value == val then
			return index
		end
	end
end

function isMouseInRectangle(object) -- Takes in a rectangular object (option or label) represented as a table and then returns true if the mouse's position is within that object
	if game.mouseX >= object.X and game.mouseX <= (object.X + object.width) and game.mouseY >= object.Y and game.mouseY <= (object.Y + object.height) then 
		return true
	else
		return false
	end
end

function clearKeyboardFocus() -- Resets all .isKeyboardFocus values to false
	
	-- SELECT SCREEN OPTIONS
	for index,object in pairs(selectScreenOptions) do
		object.isKeyboardFocus = false
	end
	
	-- FIGHT SCREEN OPTIONS
	for index,object in pairs(fightScreenOptions) do
		object.isKeyboardFocus = false
	end
	
	-- CLASS SCREEN OPTIONS AND LABELS
	for index,object in pairs(classScreenOptionsAndLabels) do
		object.isKeyboardFocus = false
	end
end

function drawHoverOrKeyboardRGB(objects) -- Takes in a list of objects (options and labels) represented as tables and then draws those objects with a custom onHover RGB
	for index,object in pairs (objects) do
		if object.isMouseOver or object.isKeyboardFocus then
			love.graphics.setFont(object.font)	
			love.graphics.setColor(game.hoverRGB)
				if object == fightOption or object == classOption or object == returnFromFightOption or object == returnFromClassOption then 
					love.graphics.printf(object.name,0,object.Y,game.width,"center")
				else
					if object ~= activeClassDescription.activeClass then 
						love.graphics.print(object.name,object.X,object.Y)
					end
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
			-- TAKE AWAY KEYBOARD FUNCTIONALITY IF USING THE MOUSE
			game.isKeyBoardActive = false
			clearKeyboardFocus()
		
			-- PLAY A SOUND EFFECT IF HOVERING OVER AN OBJECT
			if not game.playSoundEffect then
				game.cursorMove:play() 
				game.cursorMove:rewind() 
				game.playSoundEffect = true
			end
			
			-- ACTUAL MOUSE FUNCTIONALITY
			if game.isMouseDown then
				game.playSoundEffect = false
				
				if object == fightOption then -- Go to Fight screen
					selectScreen.isScreenActive = false 
					fightScreen.isScreenActive = true 
				end
				
				if object == classOption then -- Go to Class screen
					selectScreen.isScreenActive = false 
					classScreen.isScreenActive = true 
					activeClassDescription.activeClass = bruteLabel
				end
				
				if object == returnFromFightOption and fightScreen.isScreenActive == true then -- Return from the Fight screen
					fightScreen.isScreenActive = false
					selectScreen.isScreenActive = true
				end
				
				if object == returnFromClassOption and classScreen.isScreenActive == true then -- Return from the Class screen
					classScreen.isScreenActive = false
					selectScreen.isScreenActive = true
				end
				
				if object == bruteLabel then activeClassDescription.activeClass = object end
				if object == speedsterLabel then activeClassDescription.activeClass = object end
				if object == acolyteLabel then activeClassDescription.activeClass = object end
				if object == zealotLabel then activeClassDescription.activeClass = object end
			end
			
			object.isMouseOver = true
		else
			object.isMouseOver = false
		end
	end
end