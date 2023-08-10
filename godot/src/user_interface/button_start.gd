extends Button


func _ready() -> void:
	pressed.connect(Global._on_button_start_pressed)
	scale = Vector2(1, 0)
	show()
	await get_tree().create_timer(0.5).timeout
	create_tween().tween_property(self, "scale", Vector2(1, 1), 0.2)


func _on_pressed() -> void:
	hide()
