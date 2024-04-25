class_name BaseItem extends Resource

const s  = preload("res://src/Components/items/enum.gd")

#ingredients // consists of other items
@export var item_name : StringName
@export var state : s.State

func is_equal(item) -> bool:
	if(item is MixedItem):
		return false
		
	return item_name == item.item_name && state == item.state
