extends Control

var isPaused: bool = false

func _ready():
	$Menu.visible = false
	$Background.visible = false
	$OptionsMenu.visible = false

func _process(_delta):
	if Input.is_action_just_released("escape"):
		isPaused = !isPaused
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		if isPaused:
			isPaused = true
			$Menu.visible = true
			$Background.visible = true
			
		else:
			DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
			isPaused = false
			$Menu.visible = false
			$Background.visible = false

# Return back to game
func _on_return_button_pressed():
	isPaused = false
	$Menu.visible = false
	$Background.visible = false

# Settings
func _on_options_button_pressed():
	$Menu.visible = false
	$OptionsMenu.visible = true

# Return back to main menu
func _on_exit_button_pressed():
	get_parent().get_parent().returnMenu()
