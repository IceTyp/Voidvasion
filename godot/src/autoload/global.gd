extends Node

signal game_started
signal game_ended

var main_menu: Control
var current_map: Node2D
var maps := [
	preload("res://src/map.tscn"),
]


func load_map(difficulty: int) -> void:
	if len(maps) > difficulty:
		current_map = maps[difficulty].instantiate()
		get_tree().get_root().add_child(current_map)
	else:
		show_main_menu()


func show_main_menu() -> void:
	main_menu.show()
	if is_instance_valid(current_map):
		current_map.queue_free()


func _on_button_start_pressed() -> void:
	game_started.emit()


func _on_core_broken() -> void:
	game_ended.emit()
