extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", inted)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func inted(idk):
	print("works?")
