extends Label


func _process(_delta: float) -> void:
	@warning_ignore("integer_division")
	var elapsed_time: int = Time.get_ticks_msec() / 1000
	@warning_ignore("integer_division")
	text = "%02d:%02d" % [(elapsed_time / 60) % 60, elapsed_time % 60]
