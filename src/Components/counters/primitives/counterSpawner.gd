class_name CounterSpawner extends Counter

@export var item_to_spawn : Item

func action(_source : Node3D) -> void:
	if(item_slots[0].get_child_count() == 0):
		spawn()
	
func spawn() -> void:
	var obj : ItemInstance = ItemInstance.new()
	obj.transform.origin = item_slots[0].transform.origin
	obj.item = item_to_spawn
	item_slots[0].add_child(obj)
