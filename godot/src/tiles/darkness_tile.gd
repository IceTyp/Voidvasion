class_name DarknessTile
extends StaticBody2D

signal arrived

enum States {WAITING, APPROACHING, ARRIVED}

var state := States.WAITING
var darkness_level := 0.0

@onready var orbit_detector: Area2D = $OrbitDetector
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var light_occluder_2d: LightOccluder2D = $LightOccluder2D
@onready var neighbor_detector: Area2D = $NeighborDetector
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	collision_shape_2d.disabled = true
	light_occluder_2d.occluder_light_mask = 0
	modulate = Color(1, 1, 1, 0)
	arrived.connect(_on_arrived)
	
	# TODO
	await get_tree().process_frame
	await get_tree().process_frame
	for neighbor in neighbor_detector.get_overlapping_areas():
		arrived.connect(neighbor.get_parent().start_approach)


func start_approach() -> void:
	match state:
		States.ARRIVED:
			return
		States.APPROACHING:
			approach()
		States.WAITING:
			state = States.APPROACHING
			while darkness_level < 1:
				await get_tree().create_timer(randf_range(.5, 2)).timeout
				approach()
			audio_stream_player_2d.play()
			emit_signal("arrived")


func approach() -> void:
	darkness_level += (randf_range(0.1, 1) ** 2) / (1 + len(orbit_detector.get_overlapping_areas()))
	darkness_level = clamp(darkness_level, 0, 1)
	modulate = Color(1, 1, 1, darkness_level)


func _on_arrived() -> void:
	state = States.ARRIVED
	darkness_level = 1
	collision_shape_2d.disabled = false
	light_occluder_2d.occluder_light_mask = 1
	modulate = Color(0, 0, 0, 1)
