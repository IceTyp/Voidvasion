extends Control

signal new_game_requested

@onready var button_new_game: Button = $VBoxContainer/ButtonNewGame
@onready var mouse_blocker: ColorRect = $MouseBlocker


func _ready() -> void:
	hide()
	mouse_blocker.hide()
	Global.game_ended.connect(_on_game_ended)
	new_game_requested.connect(Global._on_new_game_requested)
	button_new_game.pressed.connect(_on_button_new_game_pressed)


func _on_game_ended() -> void:
	modulate = Color(1, 1, 1, 0)
	show()
	create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)


func _on_button_copy_pressed() -> void:
	pass # TODO


func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_new_game_pressed() -> void:
	mouse_blocker.show()
	get_viewport().gui_release_focus()
	await create_tween().tween_property(self, "modulate", Color(0, 0, 0, 1), 0.5).finished
	new_game_requested.emit()
