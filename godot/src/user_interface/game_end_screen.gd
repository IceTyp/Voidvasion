extends Control


func _ready() -> void:
	hide()
	Global.game_ended.connect(_on_game_ended)


func _on_game_ended() -> void:
	show()


func _on_button_try_again_pressed() -> void:
	pass # TODO
#	hide()


func _on_button_copy_pressed() -> void:
	pass # TODO
