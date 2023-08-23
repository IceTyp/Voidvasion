extends Label


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	Global.orb_count_changed.connect(update)
	update()


func update() -> void:
	text = str(Global.orb_counter)
	if Global.orb_counter >= Global.MAX_ORB_NUMBER:
		modulate = Color(0.4, 0.4, 0.4, 1)
	else:
		modulate = Color(1, 1, 1, 1)
