extends Control
## Used to create a list
@export var list: Array[StringName]
var max_cur: int = 0
## DO NOT TOUCH THIS
@export var current: int = 0
func _ready():
	max_cur = list.size() - 1 # add 0 into into the list

func _process(_delta):
	$Label.text = list[current]
func _on_button_pressed():
	current -= 1
	if current < 0:
		current = max_cur
	$Label.text = list[current]

func _on_button_2_pressed():
	current += 1
	if max_cur < current:
		current = 0 # Restarts
	$Label.text = list[current]
