class_name Orderer extends Node
#each order will have the same amount of time to complete

@export var available_items : Array[Item]
@export var orders : Array[Order]

@export var new_order_counter : float = 0
@export var time_between_orders : float = 1

@export var delete_order_counter : float = 0
@export var time_between_deletion : float = 2

func generate_order() -> Order:
	var obj : Item = available_items.pick_random()
	var order : Order = Order.new()
	order.item = obj
	orders.push_back(order) 
	print(obj.name)
	return order
	
func delete_order() -> Order:
	var order : Order = orders.front()
	print("Deleting ", order.item.name)
	orders.pop_front()
	return order

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	new_order_counter += delta
	delete_order_counter += delta
	if(new_order_counter > time_between_orders):
		new_order_counter = 0
		generate_order()
		
	if(delete_order_counter > time_between_deletion):
		delete_order_counter = 0
		delete_order()

	
