extends Area3D

@export var player_item_holder : Node3D
var player_item : Node3D

var is_over_counter : bool = false
var is_holding_item : bool = false

var counter : Counter

func _ready():
	print(player_item_holder.name)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_interacting : bool = Input.is_action_just_pressed("interact")

	if(is_interacting && is_over_counter && !is_holding_item && counter_has_item()):
		pickup()
		pass

	#drop
	elif(is_interacting && is_over_counter && is_holding_item && counter_is_free()):
		drop()
		pass

func _on_body_entered(body:Node3D):
	#could be done with godot layers or something for more flexibility
	if(body.name != "CounterBody"):
		return
	
	is_over_counter = true
	counter = body.get_parent().get_parent()

func _on_body_exited(body:Node3D):
	is_over_counter = false
	
func counter_has_item() -> bool:
	return counter.get_item_count() > 0
	
func counter_is_free() -> bool:
	return counter.get_free_slots() > 0

func pickup():
	counter.pickup(player_item_holder)
	
	is_holding_item = true

func drop():
	counter.drop(player_item_holder)

	is_holding_item = false
