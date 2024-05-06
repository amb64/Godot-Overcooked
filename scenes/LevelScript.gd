extends Node3D

var minutes: int = 0
var seconds: int = 0
var msec: int = 0

var HUD: PackedScene = preload("res://src/UXUI/HUD.tscn")
var stats: PackedScene = preload("res://src/UXUI/stats_board_ui.tscn")

## Time is based on seconds
@export var time: float = 0.0
## Select a WorldEnvironment [color=8cf]Environment[/color] for world
@export var postProcess: Environment
@export_subgroup("Data") ## This is just mainly here for debugging
@export var tips: int = 0
@export var stars: int = 1

func _ready():
	get_parent().set_postprocess(postProcess)
	add_child(HUD.instantiate())
	if time != 0:
		set_process(true)
	else:
		set_process(false)

func _process(delta):
	time -= delta # get time based on delta time
	msec = int(fmod(time, 1.0) * 100)
	seconds = int(fmod(time, 60.0))
	minutes = int(fmod(time, 3600.0) / 60)
		
	if minutes == 0:
		if seconds == 0:
			if msec <= 0:
				stop()
				
# stop when timer is 0 
# Could make it so the time is paused
func stop():
	Engine.time_scale = 0.0
	set_process(false)
	add_child(stats.instantiate())
