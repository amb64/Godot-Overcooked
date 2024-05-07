extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.visible = true
	$Button3.visible = false
	#$Label.visible = false

func _on_exit_button_pressed():
	self.visible = false
	owner.get_node("./Menu").visible = true
