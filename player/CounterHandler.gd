extends Area3D

@export var player_item_holder : Node3D
var player_item : Node3D

var is_over_counter : bool = false
var is_holding_item : bool = false

var counter : Counter

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var is_interacting : bool = Input.is_action_just_pressed("interact")
	
	#pickup on spawner
	if(is_interacting && is_over_counter && !is_holding_item && counter is CounterSpawner):
		pickup()
		pass

	#pickup on regular
	elif(is_interacting && is_over_counter && !is_holding_item && counter_has_item()):
		pickup()
		pass

	#drop
	elif(is_interacting && is_over_counter && is_holding_item && counter_is_free()):
		drop()
		pass

func _on_body_entered(body : Node3D):
	#could be done with godot layers or something for more flexibility
	
	if(body.get_parent().get_parent() is Counter):
		is_over_counter = true
		counter = body.get_parent().get_parent()

func _on_body_exited(_body : Node3D):
	counter = null
	is_over_counter = false
	
func counter_has_item() -> bool:
	return counter.get_item_count() > 0
	
func counter_is_free() -> bool:
	return counter.get_free_slots() > 0

#success is returned by pickup or drop as a boolean
func pickup():
	is_holding_item = counter.pickup(player_item_holder)

func drop():
	is_holding_item = !counter.drop(player_item_holder)
