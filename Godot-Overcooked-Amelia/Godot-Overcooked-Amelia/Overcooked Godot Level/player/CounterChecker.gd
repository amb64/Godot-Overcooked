extends Area3D

@export var playerHolder : Node3D
var counterHolder : Node3D
var counterItem : Node3D
var playerItem : Node3D
var overCounter : bool = false
var holdingItem : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var isInteracting : bool = Input.is_action_just_pressed("interact")
	#pickup
	if(isInteracting && overCounter && !holdingItem):
		counterItem.reparent(playerHolder, false)
		holdingItem = true
		pass

	#drop
	elif(isInteracting && overCounter && holdingItem):
		counterItem.reparent(counterHolder, false)
		holdingItem = false
		pass



func _on_body_entered(body:Node3D):
	if(body.name != "CounterBody"):
		return
	
	print("entered")
	overCounter = true
	var counterParent : Node3D = body.get_parent()
	counterHolder = counterParent.get_child(0)

	if(counterHolder.get_child_count() < 1):
		return
	
	print("i swear to fuck")
	counterItem = counterHolder.get_child(0)

func _on_body_exited(body:Node3D):
	if(body.name != "CounterBody"):
		return

	print("exited")
	overCounter = false
	
