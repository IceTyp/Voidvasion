extends Control

@onready var pause_menu: Control = %PauseMenu


func _on_button_pause_menu_pressed() -> void:
	pause_menu.show()
