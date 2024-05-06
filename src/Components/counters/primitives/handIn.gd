class_name HandInCounter extends Counter

@export var orderer : Orderer

func action(_source : Node3D) -> void:
	if item_slots[0].get_child_count() == 0:
		return
		
	var item : ItemInstance
	if item_slots[0].get_child(0) is ItemInstance:
		item = item_slots[0].get_child(0)
	else:
		return
		
	var success : bool = orderer.complete_order(item)
	
	if success:
		item_slots[0].queue_free()
		print("yipee!!")
