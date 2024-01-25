class_name CounterDeleter extends Counter

#returns true if pickup is successful
func pickup(_source : Node3D) -> bool:
	return false
	
#returns true if placing item is successful
func drop(source : Node3D) -> bool:
	#cant throw away certain items
	if source.get_child(0).name == "Plate":
		return false
	
	source.get_child(0).queue_free()
	return true

#workaround for if there are no slots allocated
#overrides these to think theres always a free spot
func get_free_slots() -> int:
	return 1
	
func get_item_count() -> int:
	return 0
