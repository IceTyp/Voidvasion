extends Button


func _ready() -> void:
	pressed.connect(_on_pressed)
	if OS.get_name() == "Web":
		hide()


func _on_pressed() -> void:
	get_tree().quit()
