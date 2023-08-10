extends Node

signal game_started
signal game_ended
signal orb_count_changed

const max_orb_number := 15

var main_menu: Control
var current_map: Node2D
var maps := [
	preload("res://src/maps/map.tscn"),
]
var orb_counter := 0
var orbs_placed := 0
var seconds := 0


func _ready() -> void:
	get_tree().paused = true


func load_map(difficulty: int) -> void:
	orb_counter = 0
	orbs_placed = 0
	if len(maps) > difficulty:
		current_map = maps[difficulty].instantiate()
		get_tree().get_root().add_child(current_map)
		get_tree().paused = false
	else:
		show_main_menu()


func show_main_menu() -> void:
	main_menu.show()
	if is_instance_valid(current_map):
		current_map.queue_free()


func _on_orb_placed() -> void:
	orb_counter += 1
	orbs_placed += 1
	orb_count_changed.emit()


func _on_orb_broken() -> void:
	orb_counter -= 1
	orb_count_changed.emit()


func _on_core_broken() -> void:
	get_tree().paused = true
	game_ended.emit()


func _on_new_game_requested() -> void:
	show_main_menu()


func _on_button_start_pressed() -> void:
	game_started.emit()
