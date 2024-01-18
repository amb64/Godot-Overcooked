extends Control

func _on_button_pressed():
	get_node("./../../../WorldTour").visible = true
	get_node("./../FoodLevels").visible = false
