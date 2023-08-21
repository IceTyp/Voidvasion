extends VBoxContainer

signal difficulty_selected(difficulty)


func _ready() -> void:
	difficulty_selected.connect(Global.load_map)
	
	for key in Global.difficulties:
		var button := Button.new()
		button.text = key
		button.pressed.connect(_on_button_difficulty_pressed.bind(key))
		add_child(button)
	ButtonUpdater.update_buttons(self)


func _on_button_difficulty_pressed(id: String) -> void:
	difficulty_selected.emit(id)
