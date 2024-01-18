extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.visible = true
	$Video.visible = false
	$Audio.visible = false
	$Controls.visible = false
	$BackButton.visible = false
	
	# Video
	$Video/VBoxContainer/ResolutionOptionButton.selected = Config.screenRes
	$Video/VBoxContainer/FullScreenOptionsButton.selected = Config.fullscreen
	$Video/VBoxContainer/ColourBlindOptionButton.selected = Config.colourBlind
	$Video/VBoxContainer/VsyncCheckBox.button_pressed = Config.vsync
	$Video/VBoxContainer/ScreenShakeCheckBox.button_pressed = Config.screenShake
	
	# Audio
	$Audio/VBoxContainer/MasterSlider.value = Config.volumeMaster
	$Audio/VBoxContainer/MusicSlider.value = Config.volumeMusic
	$Audio/VBoxContainer/SFXSlider.value = Config.volumeSFX

func _on_video_button_pressed():
	$Menu.visible = false
	$Video.visible = true
	$BackButton.visible = true

func _on_audio_button_pressed():
	$Menu.visible = false
	$Audio.visible = true
	$BackButton.visible = true

func _on_controls_button_pressed():
	$Menu.visible = false
	$Controls.visible = true
	$BackButton.visible = true

func _on_exit_button_pressed():
	Config.save_config()
	self.visible = false
	owner.get_node("./Menu").visible = true


func _on_back_button_pressed():
	$Video.visible = false
	$Audio.visible = false
	$Controls.visible = false
	$BackButton.visible = false
	$Menu.visible = true

# Video
func _on_resolution_option_button_item_selected(index):
	Config.screenRes = index

func _on_full_screen_options_button_item_selected(index):
	Config.fullscreen = index

func _on_colour_blind_option_button_item_selected(index):
	Config.colourBlind = index

func _on_vsync_check_box_pressed():
	Config.vsync = !Config.vsync

func _on_screen_shake_check_box_pressed():
	Config.screenShake = !Config.screenShake

# Audio
func _on_master_slider_value_changed(value):
	Config.volumeMaster = value

func _on_music_slider_value_changed(value):
	Config.volumeMusic = value

func _on_sfx_slider_value_changed(value):
	Config.volumeSFX = value
