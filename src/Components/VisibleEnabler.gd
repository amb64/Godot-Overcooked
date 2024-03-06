extends VisibleOnScreenEnabler3D
# Can Only work in Forward+
func _ready():
	self.screen_entered.connect(_show())
	self.screen_exited.connect(_hide())
func _show():
	get_parent().visible = true
func _hide():
	get_parent().visible = false
