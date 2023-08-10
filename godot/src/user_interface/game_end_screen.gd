extends Control

signal new_game_requested


func _ready() -> void:
	hide()
	Global.game_ended.connect(_on_game_ended)
	new_game_requested.connect(Global.show_main_menu)


func _on_game_ended() -> void:
	modulate = Color(1, 1, 1, 0)
	show()
	create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)


func _on_button_try_again_pressed() -> void:
	new_game_requested.emit()


func _on_button_copy_pressed() -> void:
	pass # TODO


func _on_button_quit_pressed() -> void:
	get_tree().quit()
