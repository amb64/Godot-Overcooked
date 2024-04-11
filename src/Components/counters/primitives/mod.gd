class_name CounterModifier extends Counter

@export var proccesses : Array[ItemIO]

func action(source : Node3D) -> void:
	if not source is ItemInstance:
		print("nop")
		return
	
	var item : ItemInstance = source
	print("yup")
	
	for IO : ItemIO in proccesses:
		if item.item == IO:
			print("yipee")
