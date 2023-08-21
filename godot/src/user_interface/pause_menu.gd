extends Control

signal main_menu_requested


func _ready() -> void:
	hide()
	main_menu_requested.connect(Global._on_main_menu_requested)


func _on_button_resume_pressed() -> void:
	hide()


func _on_visibility_changed() -> void:
	get_tree().paused = visible
