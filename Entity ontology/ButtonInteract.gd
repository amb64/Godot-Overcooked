extends Interactable

@export var box : Node3D
@export var box2 : Node3D
@export var box3 : Node3D

func interact():
	print("Interacted with button")
	box.queue_free()
	box2.queue_free()
	box3.visible = true
