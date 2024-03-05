extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.visible = true
	$Video.visible = false
	$Audio.visible = false
	$Controls.visible = false
	$Button3.visible = false
	$BackButton.visible = false
	
	# Video
	$Video/Resolution.current = Config.screenRes
	$Video/Screen.current = Config.fullscreen
	$Video/ColourBlind.current = Config.colourBlind
	$Video/VsyncCheckBox.button_pressed = Config.vsync
	$Video/ScreenShakeCheckBox.button_pressed = Config.screenShake
	
	# Audio
	$Audio/MasterSlider.value = Config.volumeMaster
	$Audio/MusicSlider.value = Config.volumeMusic
	$Audio/SFXSlider.value = Config.volumeSFX
	$Audio/MasterPer.text = str(Config.volumeMaster + 50) + "%"
	$Audio/MusicPer.text = str(Config.volumeMusic + 50) + "%"
	$Audio/SFXPer.text = str(Config.volumeSFX + 50) + "%"

func _on_video_button_pressed():
	$Menu.visible = false
	$Video.visible = true
	$Button3.visible = true
	$BackButton.visible = true

func _on_audio_button_pressed():
	$Menu.visible = false
	$Audio.visible = true
	$Button3.visible = true
	$BackButton.visible = true

func _on_controls_button_pressed():
	$Menu.visible = false
	$Controls.visible = true
	$Button3.visible = true
	$BackButton.visible = true

func _on_exit_button_pressed():
	Config.screenRes = $Video/Resolution.current
	Config.fullscreen = $Video/Screen.current
	Config.colourBlind = $Video/ColourBlind.current
	Config.save_config()
	self.visible = false
	owner.get_node("./Menu").visible = true

func _on_back_button_pressed():
	$Video.visible = false
	$Audio.visible = false
	$Controls.visible = false
	$Button3.visible = false
	$BackButton.visible = false
	$Menu.visible = true

# Video
func _on_vsync_check_box_pressed():
	Config.vsync = !Config.vsync

func _on_screen_shake_check_box_pressed():
	Config.screenShake = !Config.screenShake

# Audio
func _on_master_slider_value_changed(value):
	Config.volumeMaster = value
	$Audio/MasterPer.text = str(Config.volumeMaster + 50) + "%"

func _on_music_slider_value_changed(value):
	Config.volumeMusic = value
	$Audio/MusicPer.text = str(Config.volumeMusic + 50) + "%"

func _on_sfx_slider_value_changed(value):
	Config.volumeSFX = value
	$Audio/SFXPer.text = str(Config.volumeSFX + 50) + "%"
