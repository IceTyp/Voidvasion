extends Control


func _ready() -> void:
	Global.main_menu = self
	ButtonUpdater.update_buttons(self)
