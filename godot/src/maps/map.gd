extends Node2D

@onready var canvas_modulate: CanvasModulate = $CanvasModulate


func _ready() -> void:
	Global.game_started.connect(start_darkening)


func start_darkening() -> void:
	var tween := create_tween()
	tween.tween_property(canvas_modulate, "color", Color(0.5, 0.5, 0.5, 1), 1)
	tween.tween_property(canvas_modulate, "color", Color(0, 0, 0, 1), 40)
