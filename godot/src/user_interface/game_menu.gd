extends Control

@onready var button_pause_menu: Button = %ButtonPauseMenu
@onready var button_fast_forward: Button = %ButtonFastForward
@onready var pause_menu: Control = %PauseMenu
@onready var texture_rect: TextureRect = %TextureRect


func _ready() -> void:
#	button_fast_forward.hide()
#	Global.game_started.connect(_on_game_started)
	Global.game_ended.connect(_on_game_ended)

	for node in texture_rect.get_children():
		node.scale = Vector2(1, 0)
	await get_tree().create_timer(0.5).timeout
	for node in texture_rect.get_children():
		create_tween().tween_property(node, "scale", Vector2(1, 1), 0.2)


func _on_button_pause_menu_pressed() -> void:
	pause_menu.show()


#func _on_game_started() -> void:
#	button_fast_forward.show()


func _on_game_ended() -> void:
	button_fast_forward.hide()
	button_pause_menu.hide()
