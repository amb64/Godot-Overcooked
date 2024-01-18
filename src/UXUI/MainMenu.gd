extends Node

func _ready():
	$Menu.visible = true
	$OptionsMenu.visible = false
<<<<<<< Updated upstream:src/UXUI/MainMenu.gd
	#$Lobby.visible = false
=======
>>>>>>> Stashed changes:Overcooked/src/UXUI/MainMenu.gd

func _on_host_button_pressed():
	get_parent().load_world()

func _on_join_button_pressed():
	self.visible = false

func _on_options_button_pressed():
	$Menu.visible = false
	$OptionsMenu.visible = true

func _on_exit_button_pressed():
	get_tree().quit()
