extends Node

signal game_started
signal game_ended


func _on_button_start_pressed() -> void:
	game_started.emit()


func _on_core_broken() -> void:
	game_ended.emit()
