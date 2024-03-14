extends Counter

const s = preload("res://src/Components/items/enum.gd")
var table : Table = preload("res://src/Components/items/resources/recipies/RecipeTable.tscn").instantiate()

func pickup(source : Node3D) -> bool:
	return false
	
func drop(source : Node3D) -> bool:
	var item : ResourceItem = source.get_child(0)
	if(!item.resource is BaseItem):
		return false
		
	var i : BaseItem = item.resource
	
	if table.is_valid(i):
		print("yipee")
		i.state = States.State.CHOPPED
		print(i.state)
	return false
