extends ButtonIngame

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var fast_forward := false: set = set_fast_forward


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if visible:
			_on_pressed()


func set_fast_forward(val: bool) -> void:
	fast_forward = val
	Engine.time_scale = 2.5 if fast_forward else 1.0
	if fast_forward:
		animation_player.play("pressed")
	else:
		animation_player.stop()
		modulate = Color(1, 1, 1, 1)


func _on_game_ended() -> void:
	fast_forward = false
	super._on_game_ended()


func _on_pressed() -> void:
	fast_forward = not fast_forward
