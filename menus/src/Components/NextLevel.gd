extends StaticBody3D

## Select a level for the player to begin
@export var Level: int = 0
var isCol: bool = false

func _process(_delta):
	if isCol == true:
		if Input.is_action_just_pressed("interact"):
			get_parent().get_parent().get_parent().load_level(Level)

func _on_area_3d_body_entered(body):
	if body.is_in_group("FoodTruck"): #and get_parent().get_parent().visible == true:
		isCol = true


func _on_area_3d_body_exited(body):
	if body.is_in_group("FoodTruck"):
		isCol = false
