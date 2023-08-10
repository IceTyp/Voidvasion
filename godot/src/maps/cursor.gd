extends Node2D

signal place_orb(position)

@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var collision_detector: Area2D = $CollisionDetector
@onready var audio_stream_player_place_orb: AudioStreamPlayer2D = $AudioStreamPlayerPlaceOrb
@onready var audio_stream_player_failed: AudioStreamPlayer2D = $AudioStreamPlayerFailed


func _process(_delta: float) -> void:
	position = get_global_mouse_position().round()
	visible = Global.orb_counter < Global.max_orb_number
	point_light_2d.visible = not collision_detector.has_overlapping_bodies()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if not get_viewport_rect().has_point(event.position):
				return
			if collision_detector.has_overlapping_bodies():
				audio_stream_player_failed.play()
			elif Global.orb_counter >= Global.max_orb_number:
				audio_stream_player_failed.play()
			elif Global.orb_counter < Global.max_orb_number:
				audio_stream_player_place_orb.play()
				place_orb.emit(position)
				get_viewport().set_input_as_handled()
