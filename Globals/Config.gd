extends Node

var file_path_config = "res://config.cfg"
var configFile = ConfigFile.new()

func _ready():
	load_config()

var screenRes: int = 0
var fullscreen: int = 0
var colourBlind: int = 0
var vsync: bool = true
var screenShake:bool = true

var volumeMaster:float = 0.0
var volumeMusic:float = 0.0
var volumeSFX:float = 0.0

var config_file = {
	"Video": {
		"resolution": 0,
		"fullscreen": 0,
		"colorblind": 0,
		"vsync": true,
		"screenshake": true
	},
	"Audio": {
		"master": 0.0,
		"music": 0.0,
		"sfx": 0.0
	},
	"Keybinds": {
		"forward": "W",
		"backward": "S",
		"left": "A",
		"right": "D",
		"interact": "E",
		"escape": "Escape"
	}
}
func load_config():
	var error = configFile.load(file_path_config)
	if error != OK:
		return []
	
	for section in config_file.keys():
		for key in config_file[section].keys():
			config_file[section][key] = configFile.get_value(section, key, config_file[section][key])
	
	screenRes = config_file.Video.resolution
	fullscreen = config_file.Video.fullscreen
	colourBlind = config_file.Video.colorblind
	vsync = config_file.Video.vsync
	screenShake = config_file.Video.screenshake
	
	volumeMaster = config_file.Audio.master
	volumeMusic = config_file.Audio.music
	volumeSFX = config_file.Audio.sfx

	input_remap_keys()
	
	if fullscreen == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	elif fullscreen == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	if vsync:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	
	if screenRes == 0:
		get_viewport().size = Vector2(1280, 720)
	if screenRes == 1:
		get_viewport().size = Vector2(1920, 1080)
	
	AudioServer.set_bus_volume_db(0, volumeMaster)
	AudioServer.set_bus_volume_db(1, volumeMusic)
	AudioServer.set_bus_volume_db(2, volumeSFX)

func save_config():
	config_file.Video.resolution = screenRes
	config_file.Video.fullscreen = fullscreen
	config_file.Video.colorblind = colourBlind
	config_file.Video.vsync = vsync
	config_file.Video.screenshake = screenShake

	config_file.Audio.master = volumeMaster
	config_file.Audio.music = volumeMusic
	config_file.Audio.sfx = volumeSFX

	for section in config_file.keys():
		for key in config_file[section].keys():
			configFile.set_value(section, key, config_file[section][key])
		configFile.save(file_path_config)

# Input map keys
func input_remap_keys():
	# Delete all action inputs
	for action_name in config_file.Keybinds.keys():
		InputMap.action_erase_events(action_name)
	
	# get aconfig file and loop
	for action in config_file.Keybinds.keys():
		# create inputs
		var key_event = InputEventKey.new()
		key_event.keycode = OS.find_keycode_from_string(str(config_file.Keybinds[action]))
		key_event.pressed = true
		if action:
			InputMap.action_add_event(action, key_event)
