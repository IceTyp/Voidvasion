class_name ButtonIngame
extends Button


func _ready() -> void:
	hide()
	Global.game_started.connect(_on_game_started)
	Global.game_ended.connect(_on_game_ended)


func _on_game_started() -> void:
	show()


func _on_game_ended() -> void:
	hide()
