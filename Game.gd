extends Node

# The dynamic dictornary that stores level info
var Levels = {}

var vanPos: Vector3 = Vector3(-14.8, 0.6, 5.0)
var vanRot: Vector3 = Vector3(0.0, 0.0, 0.0)
var MainMenu: PackedScene = preload("res://src/UXUI/MainMenu.tscn") # Spawn MainMenu
var Tour: PackedScene = preload("res://scenes/WorldTour.tscn") # Spawn World tour

## Drag and drop here. 
## Must be a [color=8cf]Level scene[/color] tscn file.
## Must include a packed scene based on int for next level node or it'll crash.
@export var levels: Array[PackedScene]

func _ready():
	Global.Game = self
	loadLevelConfig()

# Loads in world tour scene
func load_world():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	for n in get_children(true):
		if n.name != $WorldEnvironment.name:
			if n.name != $BackgroundMusic.name:
				if n.name != $ColourBlindUX.name:
					n.queue_free()
	set_postprocess(preload("res://resources/postprocess/WorldTour.tres"))
	add_child(Tour.instantiate())

# Loads in a level scene
func load_level(numb: int):
	if Levels.size() > numb:
		var x = levels[numb].instantiate()
		x.name = str(numb) # Helpful for IDing the level
		add_child(x)
		get_node("WorldTour").queue_free()

# Return to main menu
func returnMenu():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	set_postprocess(preload("res://resources/postprocess/MainMenu.tres"))
	for n in get_children(true):
		if n.name != $WorldEnvironment.name:
			if n.name != $BackgroundMusic.name:
				if n.name != $ColourBlindUX.name:
					n.queue_free()
	add_child(MainMenu.instantiate())

# Level settings
func loadLevelConfig():
	var unlocked: bool = true
	for i in levels.size():
		if i == 0:
			unlocked = true
		else:
			unlocked = false
		Levels[Levels.size()] = {
			i: {
				0: 0,
				1: unlocked
			}
		}

# Also used after the game ends to unlock the next level
func unLockLevelConfig(Level: int):
	if Levels.size() > Level: # prevents overunlocking non levels that dont exist
		for key in Levels[Level].keys():
			for point in Levels[Level][key]:
				if point != int(): # Checks if its a bool value
					Levels[Level][key][point] = true # set the level to be unlocked

# Used for after the game ends to give how many stars
func editLevelConfig(Level: int, stars: int):
	for key in Levels[Level].keys():
		for point in Levels[Level][key]:
			if point == int(): # Checks if its an int value
				Levels[Level][key][point] = stars # set star amount
				
	# Must get atleast 1 star inorder to progress
	if stars > 0:
		unLockLevelConfig(Level + 1)


# postprocess mechanic
func set_postprocess(env: Environment):
	if env != $WorldEnvironment:
		$WorldEnvironment.environment = env

# background music mechanic
func set_backgroundMusic(audio: AudioStreamWAV):
	if audio != $BackgroundMusic:
		$BackgroundMusic.stream = audio
