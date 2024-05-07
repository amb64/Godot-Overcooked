extends Node

func _ready():
	$Menu.visible = true
	$OptionsMenu.visible = false

func _on_host_button_pressed():
	get_parent().load_world()
	queue_free()
	
func _on_tutorial_button_press():
	$Menu.visible = false
	$HelpScreen.visible = true

func _on_join_button_pressed():
	pass

func _on_options_button_pressed():
	$Menu.visible = false
	$OptionsMenu.visible = true

func _on_exit_button_pressed():
	get_tree().quit()
