extends Node3D
@onready var characterSelect = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("switch"):
		if characterSelect == 0:
			characterSelect = 1
		elif characterSelect == 1:
			characterSelect = 0
