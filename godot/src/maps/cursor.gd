extends Node2D

signal place_orb(position)

@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var collision_detector: Area2D = $CollisionDetector


func _process(_delta: float) -> void:
	position = get_global_mouse_position().round()
	point_light_2d.visible = not collision_detector.has_overlapping_bodies()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if collision_detector.has_overlapping_bodies():
				return
			else:
				place_orb.emit(position)
