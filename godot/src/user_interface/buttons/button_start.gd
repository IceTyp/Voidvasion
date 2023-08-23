extends Button


func _ready() -> void:
	pressed.connect(Global._on_button_start_pressed)
	show()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("ui_accept"):
		get_viewport().set_input_as_handled()
		pressed.emit()


func _on_pressed() -> void:
	queue_free()
