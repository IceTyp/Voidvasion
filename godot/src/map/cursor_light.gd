extends Node2D

@export var orbs: Node2D

var small_orb := preload("res://src/orbs/small_orb.tscn")
var orb_just_placed := false
var placing_active := false

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var void_detector: Area2D = %VoidDetector
@onready var audio_stream_player_place_orb: AudioStreamPlayer2D = $AudioStreamPlayerPlaceOrb
@onready var audio_stream_player_failed: AudioStreamPlayer = $AudioStreamPlayerFailed


func _process(delta: float) -> void:
	rotate(-delta / 8)
	position = get_global_mouse_position().round()
	visible = Global.orb_counter < Global.MAX_ORB_NUMBER
	point_light_2d.energy = 3 if await is_valid_orb_position(position) else 1


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				placing_active = true
				if await is_valid_orb_position(event.position):
					get_viewport().set_input_as_handled()
					place_orb(event.position)
				else:
					audio_stream_player_failed.play()
			else:
				placing_active = false
	if event is InputEventMouseMotion and placing_active:
		if await is_valid_orb_position(event.position):
			get_viewport().set_input_as_handled()
			place_orb(event.position)


func place_orb(_position: Vector2) -> void:
	if orb_just_placed:
		return
	audio_stream_player_place_orb.play()
	orb_just_placed = true
	var orb := small_orb.instantiate()
	orb.position = _position.round()
	orbs.add_child(orb)
	await get_tree().create_timer(0.1).timeout
	orb_just_placed = false


func is_valid_orb_position(target: Vector2) -> bool:
	target = target.round()
	if not get_viewport_rect().has_point(target):
		return false
	if Global.orb_counter >= Global.MAX_ORB_NUMBER:
		return false
	for orb in orbs.get_children():
		if target.distance_to(orb.position) < 6:
			return false
	void_detector.position = target
	await get_tree().physics_frame
	return not void_detector.has_overlapping_bodies()
