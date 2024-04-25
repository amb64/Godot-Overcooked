extends Node3D

var maxStars: int = 3
var starOffset: int = 20
var starArr: Array = [] ##  How many stars should be displayed

# Star textures
@export var fullStar: Texture = preload("res://assets/UXUI/Icons/StarFull.png")
#@export var halfStar: Texture
@export var emptyStar: Texture = preload("res://assets/UXUI/Icons/StarEmpty.png")

## Select a level number
@export var Level: int = 0
var starAmount: int = 0
var isUnLocked: bool = true
var isCol: bool = false

func _ready():
	# Level Info
	var dict = Global.Game.Levels # Get the Database info from Game node
	# Checks if the database is greater than level AKA if theres too many next levels and not a lot of data then it wont get data 
	if dict.size() > Level:
		$SubViewport/Panel/Panel/CenterContainer/LockIcon2.visible = false
		$SubViewport/Panel/Label.visible = true
		for key in dict[Level].keys():
			for point in dict[Level][key]:
				if point == int(): # Checks if its an int value
					starAmount = dict[Level][key][point] # get star amount
				else: # if its not an int then set as bool value
					isUnLocked = dict[Level][key][point] # get if the level is locked
		
		# GUI mechanic
		if isUnLocked == true:
			$SubViewport/Panel/Panel/CenterContainer/LockIcon.visible = false
			# Create the heart array
			for i in range(maxStars):
				var star = Sprite2D.new()
				star.texture = fullStar
				starArr.append(star)
				$SubViewport/Panel/Panel/CenterContainer.add_child(star)
				
				# Set the star's position
				var heartWidth = star.texture.get_size().x
				var xPos = i * (heartWidth + starOffset)
				star.set_position(Vector2(xPos + 119.0, 128.0))
			# Initialize stars
			update_stars(starAmount)
		else:
			$SubViewport/Panel/Panel/CenterContainer/LockIcon.visible = true
	else:
		$SubViewport/Panel/Panel/CenterContainer/LockIcon2.visible = true
		$SubViewport/Panel/Label.visible = false

# Process input stuff
func _process(_delta):
	if isCol and isUnLocked == true:
		if Input.is_action_just_pressed("interact"):
			Global.Game.vanPos = Global.FoodTruck.position
			Global.Game.vanRot = Global.FoodTruck.body.rotation
			Global.Game.load_level(Level)
			

# Collision stuff
func _on_area_3d_body_entered(body):
	if body.is_in_group("FoodTruck"):
		isCol = true

func _on_area_3d_body_exited(body):
	if body.is_in_group("FoodTruck"):
		isCol = false

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
