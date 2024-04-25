extends Counter

const s = preload("res://src/Components/items/enum.gd")
@export var recipe : Recipe

func pickup(_source : Node3D) -> bool:
	return false
	
func drop(source : Node3D) -> bool:
	var item : ResourceItem = source.get_child(0)
	var i : BaseItem = item.resource
	
	if recipe.item_meets_criteria(i):
		print("yipee")
		
	return false
