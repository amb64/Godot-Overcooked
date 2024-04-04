class_name Counter
extends Node3D


@export var item_slots : Array[Node3D]

#returns true if pickup is successful
func pickup(source : Node3D) -> bool:
	#reparent last placed  to source
	for n in range(item_slots.size()-1, -1, -1):
		var slot : Node3D = item_slots[n]
		if slot.get_child_count() == 0:
			continue

		slot.get_child(0).reparent(source, false)
		return true
			
	return false
	
#returns true if placing item is successful
func drop(source : Node3D) -> bool:
	#reparent item from source to next available slot
	for slot : Node3D in item_slots:
		if slot.get_child_count() > 0:
			continue

		cleanup()
		source.get_child(0).reparent(slot, false)
		return true
			
	return false

func action(source : Node3D) -> void:
	print("action")
	return

#calls on successful pickup
func cleanup() -> void:
	return

func get_free_slots() -> int:
	var slots : int = item_slots.size()
	for i in range(item_slots.size()):
		if is_slot_occupied(i):
			slots -= 1
	return slots
	
func get_item_count() -> int:
	var slots : int = 0
	for i in range(item_slots.size()):
		if is_slot_occupied(i):
			slots += 1
	return slots

func is_slot_occupied(index : int) -> bool:
	if(item_slots.size()) == 0:
		return true
		
	return item_slots[index].get_child_count() > 0

