extends StaticBody3D

## Select a level for the player to begin
@export var Level: int = 0
var isCol: bool = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and isCol == true:
		get_node("./../../../WorldTour").visible = false
		get_parent().get_parent().get_parent().load_level(Level)

	if isCol:
		$CollisionShape3D.disabled = false
	else:
		$CollisionShape3D.disabled = true

func _on_area_3d_body_entered(body):
	if body.is_in_group("Player") and get_parent().get_parent().visible == true:
		isCol = true
	else:
		isCol = false
