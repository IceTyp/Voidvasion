extends Label


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	Global.orb_count_changed.connect(update)
	Global.game_ended.connect(_on_game_ended)
	update()


func update() -> void:
	text = str(Global.orb_counter)
	if Global.orb_counter >= Global.max_orb_number:
		modulate = Color(0.3, 0.3, 0.3, 1)
	else:
		modulate = Color(1, 1, 1, 1)


func _on_game_ended() -> void:
	create_tween().tween_property(self, "modulate", Color(1, 1, 1, 0), 0.5)
