extends Node3D

@onready var interaction_area: InteractionArea = $Plate/InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	print("I interacted with something!")
	push_warning()
