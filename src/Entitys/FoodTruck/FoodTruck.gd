extends CharacterBody3D

# Recommend only owner of the party able to drive (maybe) Or could be funny if all were able to drive it

const SPEED = 5.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var body

func _ready():
	body = $P
	Global.FoodTruck = self
	position = Global.Game.vanPos
	body.rotation = Global.Game.vanRot

func _physics_process(delta):
	if get_parent().visible == true:
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta

		# Player Input
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if dir:
			$P/Body/GPUParticles3D.emitting = true
			velocity.x = dir.x * SPEED
			velocity.z = dir.z * SPEED

			# Body Mesh rotation. - Rotates body to where the player is moving
			$P.rotation.y = lerp_angle($P.rotation.y, atan2(velocity.x, velocity.z), delta * 1.5)
		else:
			$P/Body/GPUParticles3D.emitting = false
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
