extends Node2D

@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var audio_stream_player_void: AudioStreamPlayer = $AudioStreamPlayerVoid


func _ready() -> void:
	Global.game_started.connect(intensivy_void)


func intensivy_void() -> void:
	audio_stream_player_void.play()
	var tween := create_tween()
	tween.tween_property(canvas_modulate, "color", Color(0.5, 0.5, 0.5, 1), 1)
	tween.tween_property(canvas_modulate, "color", Color(0, 0, 0, 1), 40)
	tween.parallel().tween_property(audio_stream_player_void, "volume_db", 10, 180)
