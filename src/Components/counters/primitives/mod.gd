class_name CounterModifier extends Counter

@export var proccesses : Array[ItemIO]

func action(_source : Node3D) -> void:
	if item_slots[0].get_child(0) == null:
		return
	
	if not item_slots[0].get_child(0) is ItemInstance:
		print("nop")
		return
	
	var item : ItemInstance = item_slots[0].get_child(0)
	print("yup")
	
	for IO : ItemIO in proccesses:
		if item.item.is_equal(IO.input):
			print("yipee")
			item.item = IO.output
			return
