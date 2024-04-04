extends Counter

const s = preload("res://src/Components/items/enum.gd")
@export var list : Array[Recipe] #by default, whitelist
@export var result_state : s.State
@export var is_blacklist : bool
var processed : bool = false

#func pickup(source : Node3D) -> bool:
    ##change the state here
    #if(item_slots[0] != null):	
        #var item : ResourceItem = item_slots[0].get_child(0)
        #var i : BaseItem = item.resource
    #
        #if is_valid(i) && !processed:
            #print("yipee")
            #i.state = result_state
            #print(i.state)
            #processed = true
            #return false
        #else:
            #working = false
            #processed = false
            #item_slots[0].get_child(0).reparent(source, false)
            #return true
    #
    #return false
    #
#func drop(source : Node3D) -> bool:
    #var item : ResourceItem = source.get_child(0)
    #if(item.resource is BaseItem):
        #source.get_child(0).reparent(item_slots[0], false)
        #working = true
        #return true
    #else:
        #return false
        
func is_valid(item : BaseItem) -> bool:
    if list.size() == 0 && is_blacklist:
        return true
        
    for rec in list:
        if rec.item_meets_criteria(item):
            return !is_blacklist

    return false

        
func action(source : Node3D) -> void:
    if(item_slots[0].get_child_count() == 0):
        return
    if(!item_slots[0].get_child(0) is ResourceItem):
        return
    
    var item : ResourceItem = item_slots[0].get_child(0)
    var i : BaseItem = item.resource
    
    if is_valid(i) && !processed:
        print("yipee")
        i.state = result_state
        print(i.state)
        processed = true

func cleanup() -> void:
    print("cleaned")
    processed = false
