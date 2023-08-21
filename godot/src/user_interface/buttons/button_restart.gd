extends Button

signal restart_map


func _ready() -> void:
	restart_map.connect(Global._on_restart_map)


func _on_pressed() -> void:
	restart_map.emit()
