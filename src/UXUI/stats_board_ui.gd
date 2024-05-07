extends Control

var maxStars: int = 3
var starOffset: int = 330
var starArr: Array = [] ##  How many stars should be displayed

# Star textures
@export var fullStar: Texture = preload("res://assets/UXUI/Icons/StarFull.png")
#@export var halfStar: Texture
@export var emptyStar: Texture = preload("res://assets/UXUI/Icons/StarEmpty.png")

func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	for i in range(maxStars):
		var star = Sprite2D.new()
		star.texture = fullStar
		starArr.append(star)
		$Panel.add_child(star)
					
					# Set the star's position
		var xPos = i * starOffset
		star.scale = Vector2(0.5, 0.5)
		star.set_position(Vector2(xPos + 260.0, 150.0))
	update_stars(get_parent().stars)

	$TipAmount.text = str(get_parent().tips)

func _on_button_pressed():
	Engine.time_scale = 1.0
	# convert level stringname to string then int
	Global.Game.editLevelConfig(int(str(get_parent().name)), get_parent().stars)
	get_parent().get_parent().load_world()

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
