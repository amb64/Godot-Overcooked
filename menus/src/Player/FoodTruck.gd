extends CharacterBody3D

# Recommend only owner of the party able to drive (maybe) Or could be funny if all were able to drive it

const SPEED = 5.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if get_parent().visible == true:
		$CollisionShape3D.disabled = false
		$Camera.current = true
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta

		# Player Input
		var input_dir = Input.get_vector("left", "right", "forward", "backward")
		var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if dir:
			$Body/GPUParticles3D.emitting = true
			velocity.x = dir.x * SPEED
			velocity.z = dir.z * SPEED

			# Body Mesh rotation. - Rotates body to where the player is moving
			$Body.rotation.y = lerp_angle($Body.rotation.y, atan2(velocity.x, velocity.z), delta * 1.5)
		else:
			$Body/GPUParticles3D.emitting = false
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
	else:
		$CollisionShape3D.disabled = true
		$Camera.current = false
