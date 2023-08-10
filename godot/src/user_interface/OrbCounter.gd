extends Label


func _ready() -> void:
	Global.orb_count_changed.connect(update)
	update()


func update() -> void:
	text = str(Global.orb_counter)
	if Global.orb_counter >= Global.max_orb_number:
		modulate = Color(0.3, 0.3, 0.3, 1)
	else:
		modulate = Color(1, 1, 1, 1)
