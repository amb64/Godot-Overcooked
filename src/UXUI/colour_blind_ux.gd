extends CanvasLayer
func _ready():
	$ColorRect.material.set_shader_parameter("type", Config.colourBlind)
func _process(_delta):
	$ColorRect.material.set_shader_parameter("type", Config.colourBlind)
