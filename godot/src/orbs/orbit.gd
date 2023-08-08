extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func init(radius: float) -> void:
	await ready
	collision_shape_2d.shape = CircleShape2D.new()
	collision_shape_2d.shape.radius = 2 * radius
