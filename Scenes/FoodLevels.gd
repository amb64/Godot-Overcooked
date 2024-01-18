extends Node3D

@export var Level: int = 0

func _ready():
	self.visible = false

func _process(delta):
	if self.visible:
		$Player.visible = true
	else:
		$Player.visible = false
	
	if Level == 0:
		get_child(1).isStarting = true
		$TestLevel.visible = true
	elif Level == 1:
		$TestLevel2.visible = true
	elif Level == 2:
		$TestLevel3.visible = true
	else:
		$TestLevel2.visible = false
		$TestLevel.visible = false
		$TestLevel3.visible = false
