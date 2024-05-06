class_name ItemIO extends Resource

@export var input : Array[Item]
@export var output : Item
#reference to final model here everntually

func does_apply(items : Array[ItemInstance]) -> bool:
	if(items.size() != input.size()):
		return false
	
	for i in range(0, input.size()):		
		var has_matched : bool = false
		for j in range(0, items.size()):
			if input[i].is_equal(items[j].item):
				has_matched = true
				break
				
		if !has_matched:
			return false #if j loop ends without getting a match, the items do no match
		
	return true
