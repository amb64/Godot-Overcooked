extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TimerPanel/Mins.text = "%02d:" % get_parent().minutes
	$TimerPanel/Secs.text = "%02d" % get_parent().seconds

	$TipPanel/TipLabel.text = str(get_parent().tips)
