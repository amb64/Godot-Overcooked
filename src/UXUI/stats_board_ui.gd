extends Control

var maxStars: int = 3
var starOffset: int = 320
var starArr: Array = [] ##  How many stars should be displayed

# Star textures
@export var fullStar: Texture = preload("res://assets/UXUI/Icons/StarFull.png")
#@export var halfStar: Texture
@export var emptyStar: Texture = preload("res://assets/UXUI/Icons/StarEmpty.png")

func _ready():
	for i in range(maxStars):
		var star = Sprite2D.new()
		star.texture = fullStar
		starArr.append(star)
		$Panel.add_child(star)
					
					# Set the star's position
		var heartWidth = star.texture.get_size().x
		var xPos = i * (heartWidth + starOffset)
		star.scale = Vector2(5.0, 5.0)
		star.set_position(Vector2(xPos + 200.0, 150.0))
	update_stars(get_parent().stars)

	$TipAmount.text = str(get_parent().tips)

func _on_button_pressed():
	Engine.time_scale = 1.0
	Global.Game.editLevelConfig(get_parent().Level, get_parent().stars)
	get_parent().get_parent().returnTour()

# stars GUI mechanic
func update_stars(newStar: int):
	# Loop through the star array and update each star
	for i in range(maxStars):
		var star = starArr[i]
		# Display if the star is full, half or empty
		if i < newStar:
			# Full
			star.texture = fullStar
		else:
			# Empty
			star.texture = emptyStar
