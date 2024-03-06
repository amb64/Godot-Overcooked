class_name Item extends Resource

enum State{
	INGORE,
	RAW,
	CHOPPED,
	FRIED,
	BOILED,
	COOKED,
	DONEUNCOOKED,
	DONE
}

#states // cooked, chopped, boiled etc

#ingredients // consists of other items
@export var item_name : StringName
@export var ingredients : Array[Item]
@export var state : State
	
#potential for different modifiers
#change the item with some tool.
func modify():
	pass
	
#add some ingredient to the item
#func add(item : Item):
	#if state == State.DONE or state == State.DONEUNCOOKED:
		#if the item is finished, check if item is in the additional set to allow modification
		#additionals : Array[ingredients] = some json magic
		#if item is not in additionals, return
		#pass
	#pass

#every time the item is created, or modified, check it against the json table
#if succeeded set the item to finalized and only allow additionals
func JSON_compare():
	pass
