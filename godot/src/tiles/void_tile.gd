class_name VoidTile
extends StaticBody2D

signal arrived

enum States {WAITING, APPROACHING, ARRIVED}

var state := States.WAITING
var void_level := 0.0

@onready var aura_detector: Area2D = $AuraDetector
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var light_occluder_2d: LightOccluder2D = $LightOccluder2D
@onready var neighbor_detector: Area2D = $NeighborDetector
@onready var timer: Timer = $Timer


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
	if state == States.WAITING:
		state = States.APPROACHING
		while void_level < 1:
			timer.start(randf_range(.5, 2))
			await timer.timeout
			approach()
		emit_signal("arrived")


func approach() -> void:
	void_level += (randf_range(0.1, 1) ** 2) / (1 + len(aura_detector.get_overlapping_areas()))
	void_level = clamp(void_level, 0, 1)
	modulate = Color(1, 1, 1, void_level)


func _on_arrived() -> void:
	state = States.ARRIVED
	void_level = 1
	collision_shape_2d.disabled = false
	light_occluder_2d.occluder_light_mask = 1
	modulate = Color(0, 0, 0, 1)
