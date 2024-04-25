extends Node

var Levels = {}

var vanPos: Vector3 = Vector3(-14.0, 1.0, 4.0)
var vanRot: Vector3 = Vector3(0.0, 0.0, 0.0)

## Drag and drop here. Must be [color=8cf]MainMenu.tscn[/color] file.
@export var MainMenu: PackedScene # Spawn MainMenu
## Drag and drop here. Must be [color=8cf]WorldTour.tscn[/color] file.
@export var Tour: PackedScene # Spawn World tour
## Drag and drop here. Must be a [color=8cf]Level scene[/color] tscn file.
## Must include a packed scene based on int for next level node or it'll crash.
@export var levels: Array[PackedScene]

func _ready():
	Global.Game = self
	loadLevelConfig()

# Loads in world tour scene
func load_world():
	add_child(Tour.instantiate())
	get_node("MainMenu").queue_free()

# Loads in a level scene
func load_level(numb: int):
	var x = levels[numb].instantiate()
	x.name = "Level" # Helpful for removing after use
	add_child(x)
	get_node("WorldTour").queue_free()

# Return back to world tour
func returnTour():
	add_child(Tour.instantiate())
	get_node("Level").queue_free() # delete level scene

# Return to main menu
func returnMenu():
	for n in get_children(true):
		n.queue_free()
	add_child(MainMenu.instantiate())

# Level settings
func loadLevelConfig():
	var unlocked: bool = true
	for i in levels.size() - 1:
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
	unLockLevelConfig(Level + 1)


# postprocess mechanic
#func get_postprocess(env: Environment):
	#if env != $WorldEnvironment.environment:
		#$WorldEnvironment.environment = env
