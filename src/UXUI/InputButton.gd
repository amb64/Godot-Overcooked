extends Button

@export var action:String = ""
var isPressed: bool = false

var file_path_config = "res://config.cfg"
var configFile = ConfigFile.new()

func _ready():
	self.text = InputMap.action_get_events(action)[0].as_text()

func _process(_delta):
	if button_pressed:
		isPressed = true
	
	if isPressed:
		set_process_unhandled_input(true)
		self.text = "..."
	else:
		set_process_unhandled_input(false)
		self.text = InputMap.action_get_events(action)[0].as_text()

func _unhandled_input(event):
	if event is InputEventKey:
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		self.text = event.as_text()
		if action:
			Config.config_file.Keybinds[action] = OS.get_keycode_string(event.keycode)
	isPressed = false
