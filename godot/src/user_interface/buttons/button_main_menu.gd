extends Button

signal main_menu_requested


func _ready() -> void:
	main_menu_requested.connect(Global._on_main_menu_requested)


func _on_pressed() -> void:
	main_menu_requested.emit()
