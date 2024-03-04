@tool

class_name Recipe extends Resource

@export var recipe_name : StringName
@export var product : BaseItem :
	set(value):
		product = value.duplicate()
	get:
		return product
		
@export var additionals : Array[BaseItem]

#called after an item is modified
#item is checked against all known recipes

#check to see if it matches ingredient signature
func item_meets_criteria(item : BaseItem) -> bool:
	return product == item
