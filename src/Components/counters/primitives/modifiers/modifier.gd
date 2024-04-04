extends Counter

const s = preload("res://src/Components/items/enum.gd")
var table : Table = preload("res://src/Components/items/resources/recipies/RecipeTable.tscn").instantiate()

func pickup(source : Node3D) -> bool:
    #change the state here
    if(item_slots[0] != null):	
        var item : ResourceItem = item_slots[0].get_child(0)
        var i : BaseItem = item.resource
    
        if table.is_valid(i):
            print("yipee")
            i.state = States.State.CHOPPED
            print(i.state)
            return false
        else:
            item_slots[0].get_child(0).reparent(source, false)
            return true
    
    return false
func drop(source : Node3D) -> bool:
    var item : ResourceItem = source.get_child(0)
    if(item.resource is BaseItem):
        source.get_child(0).reparent(item_slots[0], false)
        return true
    else:
        return false
