extends Node2D

signal place_orb(position)

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var orb_detector: Area2D = $OrbDetector
@onready var darkness_detector: Area2D = $DarknessDetector
@onready var audio_stream_player_place_orb: AudioStreamPlayer2D = $AudioStreamPlayerPlaceOrb
@onready var audio_stream_player_failed: AudioStreamPlayer = $AudioStreamPlayerFailed


func _process(delta: float) -> void:
	rotate(-delta / 8)
	position = get_global_mouse_position().round()
	visible = Global.orb_counter < Global.max_orb_number
	point_light_2d.energy = 3 if is_valid_orb_position() else 1


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if not get_viewport_rect().has_point(event.position):
				return
			if not is_valid_orb_position():
				audio_stream_player_failed.play()
			elif Global.orb_counter >= Global.max_orb_number:
				audio_stream_player_failed.play()
			else:
				audio_stream_player_place_orb.play()
				place_orb.emit(event.position)
				get_viewport().set_input_as_handled()


func is_valid_orb_position() -> bool:
	return not orb_detector.has_overlapping_bodies() and not darkness_detector.has_overlapping_bodies()
