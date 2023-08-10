extends Node2D

@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var audio_stream_player_darkness: AudioStreamPlayer = $AudioStreamPlayerDarkness


func _ready() -> void:
	Global.game_started.connect(start_darkening)
	modulate = Color(0, 0, 0, 1)
	create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)


func start_darkening() -> void:
	audio_stream_player_darkness.play()
	var tween := create_tween()
	tween.tween_property(canvas_modulate, "color", Color(0.5, 0.5, 0.5, 1), 1)
	tween.tween_property(canvas_modulate, "color", Color(0, 0, 0, 1), 40)
	tween.parallel().tween_property(audio_stream_player_darkness, "volume_db", 10, 180)
