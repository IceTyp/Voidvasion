extends Button


func _ready() -> void:
	pressed.connect(Global._on_button_start_pressed)
	show()


func _on_pressed() -> void:
	hide()
