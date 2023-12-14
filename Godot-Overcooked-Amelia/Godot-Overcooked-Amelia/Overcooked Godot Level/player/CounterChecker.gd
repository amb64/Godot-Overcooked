extends Area3D

@export var playerHolder : Node3D
var counterHolder : Node3D
var counterItem : Node3D
var playerItem : Node3D
var overCounter : bool = false
var holdingItem : bool = false
var isMultiCounter : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var isInteracting : bool = Input.is_action_just_pressed("interact")
	#pickup

	if(isInteracting && overCounter && !holdingItem && counter_has_item()):
		pickup()
		pass

	#drop
	elif(isInteracting && overCounter && holdingItem):
		drop()
		pass



func _on_body_entered(body:Node3D):
	if(body.name != "CounterBody"):
		return
	
	overCounter = true
	var counterParent : Node3D = body.get_parent().get_parent()
	counterHolder = counterParent.get_child(0)

	isMultiCounter = counterHolder.name == "MultiItemHolder"

	if(counterHolder.get_child_count() < 1):
		return
	
	var count = counterHolder.get_child_count()
	counterItem = counterHolder.get_child(count-1) #get last item
	(counterItem as Node3D).translate(Vector3(0,-count+1,0))

func _on_body_exited(body:Node3D):
	if(body.name != "CounterBody"):
		return

	overCounter = false
	
func counter_has_item() -> bool:
	return counterHolder.get_child_count() > 0

func pickup():
	counterItem.reparent(playerHolder, false)
	holdingItem = true

func drop():
	if(counter_has_item() && !isMultiCounter):
		return

	var count = counterHolder.get_child_count()
	playerHolder.get_child(0).reparent(counterHolder, false) #if .getchild is somehow null then i will not be happy
	(counterHolder.get_child(count) as Node3D).translate(Vector3(0,count,0))

	holdingItem = false
