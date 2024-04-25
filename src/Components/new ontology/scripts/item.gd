class_name Item extends Resource

@export var name : String
@export var mesh : Mesh

func is_equal(item : Item) -> bool:
	return name == item.name
