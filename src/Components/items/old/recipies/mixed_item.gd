class_name MixedItem extends BaseItem

@export var ingredients : Array[BaseItem]

func is_equal(item) -> bool:
	if(!item is MixedItem):
		return false
		
	for i in range(ingredients.size()):
		for j in range(i, item.ingredients.size()):
			if !ingredients[i].is_equal(item.ingredients[j]):
				return false
		
	return item_name == item.item_name && state == item.state
