extends Control

signal new_game_requested

@onready var button_new_game: Button = $VBoxContainer/ButtonNewGame


func _ready() -> void:
	hide()
	Global.game_ended.connect(_on_game_ended)
	button_new_game.pressed.connect(Global._on_button_new_game_pressed)


func _on_game_ended() -> void:
	modulate = Color(1, 1, 1, 0)
	show()
	create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)


func _on_button_copy_pressed() -> void:
	pass # TODO


func _on_button_quit_pressed() -> void:
	get_tree().quit()
