class_name Orderer extends Node
#each order will have the same amount of time to complete

@export var available_items : Array[Item]
@export var orders : Array[Order]

@export var new_order_counter : float = 0
@export var time_between_orders : float = 1

@export var delete_order_counter : float = 0
@export var time_between_deletion : float = 2

@export var orderText: Label
var orderList : Array[String]

@export var scoreText : Label
var score : int = 0

func generate_order() -> Order:
	var obj : Item = available_items.pick_random()
	var order : Order = Order.new()
	order.item = obj
	orders.push_back(order) 
	print(obj.name)
	orderList.push_back(obj.name)
	return order
	
func delete_order() -> Order:
	var order : Order = orders.front()
	print("Deleting ", order.item.name)
	orders.pop_front()
	orderList.pop_front()
	return order

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	new_order_counter += delta
	delete_order_counter += delta
	
	orderText.text = arrayToString(orderList)
	
	if(new_order_counter > time_between_orders):
		new_order_counter = 0
		generate_order()
		
	if(delete_order_counter > time_between_deletion):
		delete_order_counter = 0
		delete_order()

#returns if completion was successful
func complete_order(item : ItemInstance) -> bool:
	for i in range(0, orders.size()):
		if(item.item.is_equal(orders[i].item)):
			orders.remove_at(i)
			orderList.remove_at(i)
			score += 100
			scoreText.text = str(score)
			delete_order_counter = 0
			return true
			
	return false
	
func arrayToString(arr: Array) -> String:
	var str = ""
	for i in range(arr.size()):
		str += arr[i]
		if i < arr.size() - 1:
			str += "\n"
	return str
