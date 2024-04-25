extends Node3D

## Please select the ID num of the level for this to work
@export var Level: int = 0
## Time is based on seconds
@export var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
# //////////////////////////
@export var tips: int = 0
@export var stars: int = 3
var HUD: PackedScene = preload("res://src/UXUI/HUD.tscn")
var stats: PackedScene = preload("res://src/UXUI/stats_board_ui.tscn")
func _ready():
	add_child(HUD.instantiate())

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
