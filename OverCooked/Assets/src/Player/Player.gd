extends CharacterBody3D
# Use state machines

#@onready var input = $PlayerInput
@onready var controlManager = get_parent()
#@onready var characterSelect = get_parent()
const SPEED = 5.0
var canMove: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#func ready():
	#$MultiplayerSynchronizer.set_multiplayer_authority(str(name).to_int())


func _physics_process(delta):
	
	if visible == true:
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta

		# Player Input
		var currentControl = controlManager.characterSelect
		if currentControl == 0:
			var input_dir = Input.get_vector("left", "right", "forward", "backward")
			var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
			if direction:
				$Body/GPUParticles3D.emitting = true
				velocity.x = direction.x * SPEED
				velocity.z = direction.z * SPEED
				# Body Mesh rotation. - Rotates body to where the player is moving
				$Body.rotation.y = lerp_angle($Body.rotation.y, atan2(velocity.x, velocity.z), delta * 10.0)
			else:
				$Body/GPUParticles3D.emitting = false
				velocity.x = move_toward(velocity.x, 0, SPEED)
				velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
