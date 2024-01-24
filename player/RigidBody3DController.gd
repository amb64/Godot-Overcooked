extends RigidBody3D

@export var director : Node3D

@export var SPEED : float = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir : Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	#getting director in the same direction as the movement
	if direction:
		var difference : float = director.rotation.y - Vector2(input_dir.x, -input_dir.y).angle() #radians
		director.rotate(Vector3.DOWN,difference - PI /2)

	if(linear_velocity.length() < 5):
		#apply_force(direction * SPEED * delta) #more slippery
		position += direction * SPEED * delta   #more rigid
