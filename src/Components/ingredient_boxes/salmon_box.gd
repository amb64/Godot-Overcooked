extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn():
	var item = load("res://prefabs/raw_ingredients/salmon.tscn").instantiate()
	add_child(item)
	return item
