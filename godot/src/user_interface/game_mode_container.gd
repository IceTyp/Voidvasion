extends VBoxContainer

signal game_mode_selected(game_mode)


func _ready() -> void:
	game_mode_selected.connect(Global.load_game_mode)
	for key in Global.game_modes:
		var button := Button.new()
		button.text = key
		button.pressed.connect(_on_button_game_mode_pressed.bind(key))
		add_child(button)


func _on_button_game_mode_pressed(id: String) -> void:
	game_mode_selected.emit(id)
