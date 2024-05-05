class_name CounterModifier extends Counter

@export var proccesses : Array[ItemIO]
@export var output_slot : int = 0

func action(_source : Node3D) -> void:
	if item_slots[0].get_child(0) == null:
		return
	
	if not item_slots[0].get_child(0) is ItemInstance:
		print("nop")
		return
	
	var items : Array[ItemInstance]
	#init items
	for i in range(0, item_slots.size()):
		var item = item_slots[i].get_child(0) #error keeps happening here, no clue why, but causes no problems
		if item != null && item is ItemInstance:
			items.append(item_slots[i].get_child(0))
	
	print("yup")
	
	for IO : ItemIO in proccesses:
		if IO.does_apply(items):
			#remove all items that arent on the output slot
			for i in range(0,item_slots.size()):
				if(i == output_slot):
					continue
					
				item_slots[i].get_child(0).queue_free()
			
			print("yipee")
			item_slots[output_slot].get_child(0).item = IO.output
			return
