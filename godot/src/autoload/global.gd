extends Node

signal game_started
signal game_ended
signal orb_count_changed

const max_orb_number := 15

var current_map: Node2D
var difficulties := {
	"dusk": preload("res://src/maps/difficulties/default.tscn"),
	"nightmare": preload("res://src/maps/difficulties/1.tscn"),
	"horror": preload("res://src/maps/difficulties/double_core.tscn"),
	"chaos": preload("res://src/maps/difficulties/points.tscn"),
}
var orb_counter := 0
var orbs_placed := 0
var seconds := 0


func _ready() -> void:
	get_tree().paused = true


func load_map(id: String) -> void:
	orb_counter = 0
	orbs_placed = 0
	current_map = difficulties[id].instantiate()
	get_tree().get_root().add_child(current_map)
	get_tree().paused = false


func show_main_menu() -> void:
	MainMenu.show()
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
	await get_tree().create_timer(.5).timeout
	get_tree().paused = true
	game_ended.emit()


func _on_new_game_requested() -> void:
	show_main_menu()


func _on_button_start_pressed() -> void:
	game_started.emit()
