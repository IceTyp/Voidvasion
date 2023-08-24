extends Control

signal main_menu_requested


func _ready() -> void:
	hide()
	main_menu_requested.connect(Global._on_main_menu_requested)
	visibility_changed.connect(_on_visibility_changed)
	Global.game_ended.connect(_on_game_ended)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		hide()
		get_viewport().set_input_as_handled()


func _on_button_resume_pressed() -> void:
	hide()
	get_viewport().gui_release_focus()


func _on_visibility_changed() -> void:
	get_tree().paused = visible


func _on_game_ended() -> void:
	queue_free()
