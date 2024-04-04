extends Node

## Drag and drop here. Must be [color=8cf]MainMenu.tscn[/color] file.
@export var MainMenu: PackedScene # Spawn MainMenu
## Drag and drop here. Must be [color=8cf]WorldTour.tscn[/color] file.
@export var Tour: PackedScene # Spawn World tour
## Drag and drop here. Must be a [color=8cf]Level scene[/color] tscn file.
## Must include a packed scene based on int for next level node or it'll crash.
@export var levels: Array[PackedScene]

# Loads in world tour scene
func load_world():
	add_child(Tour.instantiate())
	get_node("MainMenu").queue_free()

# Loads in a level scene
func load_level(numb: int):
	var x = levels[numb].instantiate()
	x.name = "Level" # Helpful for removing after use
	add_child(x)
	get_node("WorldTour").visible = false

# Return back to world tour
func returnTour():
	get_node("WorldTour").visible = true
	get_node("Level").queue_free() # delete level scene

# Return to main menu
func returnMenu():
	for n in get_children(true):
		n.queue_free()
	add_child(MainMenu.instantiate())
