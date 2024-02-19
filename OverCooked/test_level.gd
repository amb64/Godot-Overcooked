extends Node3D

## Used to show how long the game lasts.
var isStarting: bool = true
@export var mins: int = 0
var secs: int = 2
var milisec: int = 60
var tips: int = 0

#@export var PlayerScene: PackedScene
@export var canMove: bool = false
var isGameOver: bool = false

func _process(delta):
	if isStarting:
		# Make sure everyone is loaded in once loaded in fully start
		# Once time is finish load a stat board
		if canMove:
			countdown(delta)
			$Canvas/HUD.visible = true
			$Player.set_physics_process(true)
		if isGameOver:
			$Canvas/StatsBoardUI.visible = true
			$Player.set_physics_process(false)
			$Canvas/HUD.visible = false

		$Canvas/HUD/TipPanel/TipLabel.text = str(tips)

		$Canvas/CoutDownUI/Particle3.emitting = true
		await get_tree().create_timer(1).timeout
		$Canvas/CoutDownUI/Particle2.emitting = true
		await get_tree().create_timer(1).timeout
		$Canvas/CoutDownUI/Particle1.emitting = true
		await get_tree().create_timer(1).timeout
		$Canvas/CoutDownUI/ParticleGo.emitting = true
		canMove = true


func countdown(delta: float):
	if milisec > 0:
		milisec -= delta
	else:
		if secs > 0:
			milisec = 60
			secs -= delta
		else:
			if mins > 0:
				secs = 60
				mins -= 1
	$Canvas/HUD/TimerPanel/TimerLabel.text = str(mins) + ":" + str(secs)
	if milisec == 0:
		if secs == 0:
			if mins == 0:
				canMove = false
				isGameOver = true
