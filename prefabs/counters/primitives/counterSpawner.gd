class_name CounterSpawner extends Counter

@export var item_to_spawn : PackedScene
#wether the player can drop onto the counter
@export var is_droppable : bool = true

#@export var item_slots : Array[Node3D]

#returns true if pickup is successful
func pickup(source : Node3D) -> bool:
	#check if item is already on
	#if not, spawn one in
	if item_slots[0].get_child_count() == 0:
		var instance = item_to_spawn.instantiate()
		item_slots[0].add_child(instance)
		return false
		
	#else, let the player pickup the current
	item_slots[0].get_child(0).reparent(source, false)
	return true
	
#returns true if placing item is successful
func drop(source : Node3D) -> bool:
	if !is_droppable:
		return false
		
	if item_slots[0].get_child_count() > 0:
		return false
		
	source.get_child(0).reparent(item_slots[0], false)
	return true
