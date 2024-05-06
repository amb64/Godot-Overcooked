class_name Table extends Node

@export var Recipes : Array[Recipe]

func is_valid(recipe : BaseItem) -> bool:
	for rec in Recipes:
		if recipe.is_equal(rec.product):
			return true
	return false
