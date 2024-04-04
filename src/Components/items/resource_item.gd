@tool

class_name ResourceItem extends Node

@export var resource : BaseItem :
	set(value):
		resource = value.duplicate()
	get:
		return resource
