extends Control

signal main_menu_requested


func _ready() -> void:
	hide()
	main_menu_requested.connect(Global._on_main_menu_requested)


func _on_button_resume_pressed() -> void:
	hide()


func _on_button_restart_pressed() -> void:
	pass # TODO


func _on_button_main_menu_pressed() -> void:
	Global.open_main_menu()


func _on_visibility_changed() -> void:
	get_tree().paused = visible
