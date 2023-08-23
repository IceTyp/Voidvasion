extends Node

signal game_started
signal game_ended
signal orb_count_changed

const MAX_ORB_NUMBER := 15

var current_map: Node2D
var main_menu: Control
var game_modes := {
	"normal": preload("res://src/map/game_modes/default.tscn"),
	"hard": preload("res://src/map/game_modes/1.tscn"),
	"nightmare": preload("res://src/map/game_modes/double_core.tscn"),
	"chaos": preload("res://src/map/game_modes/points.tscn"),
	"eclipse": preload("res://src/map/game_modes/distant_cores.tscn"),
}
var orb_counter := 0
var orbs_placed := 0
var seconds := 0
var chosen_game_mode: String

@onready var black_rect: ColorRect = %BlackRect


func _ready() -> void:
	black_rect.modulate = Color(1, 1, 1, 0)
	black_rect.hide()
	get_tree().paused = true


func load_game_mode(id: String) -> void:
	Engine.time_scale = 1
	var next_map: Node2D = game_modes[id].instantiate()
	await fade_darkness_in().finished
	orb_counter = 0
	orbs_placed = 0
	chosen_game_mode = id
	fade_darkness_out()
	current_map = next_map
	get_tree().get_root().add_child(current_map)
	get_tree().paused = false


func open_main_menu() -> void:
	Engine.time_scale = 1
	await fade_darkness_in().finished
	main_menu.show()
	fade_darkness_out()


func fade_darkness_in() -> Tweener:
	black_rect.show()
	get_viewport().gui_release_focus()
	return create_tween().tween_property(black_rect, "modulate", Color(1, 1, 1, 1), 0.5)


func fade_darkness_out() -> void:
	if is_instance_valid(current_map):
		current_map.queue_free()
	await create_tween().tween_property(black_rect, "modulate", Color(1, 1, 1, 0), 0.5).finished
	black_rect.hide()


func _on_orb_placed() -> void:
	orb_counter += 1
	orbs_placed += 1
	orb_count_changed.emit()


func _on_orb_broken() -> void:
	orb_counter -= 1
	orb_count_changed.emit()


func _on_core_broken(core: Orb) -> void:
	Engine.time_scale = 1
	await core.tree_exited
	await get_tree().create_timer(.5).timeout
	get_tree().paused = true
	game_ended.emit()


func _on_restart_map() -> void:
	load_game_mode(chosen_game_mode)


func _on_main_menu_requested() -> void:
	open_main_menu()


func _on_button_start_pressed() -> void:
	game_started.emit()
