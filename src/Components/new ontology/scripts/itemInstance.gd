@tool

class_name ItemInstance extends MeshInstance3D

#setget may not be necessary, items need not be changed during runtime
@export var item : Item :
	set(value):
		item = value
		mesh = item.mesh
		
	get:
		return item
