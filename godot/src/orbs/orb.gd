extends Area2D

@export var energy: int = 1: set = set_energy
@export var color: Color = Color.WHITE: set = set_color

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	connect("body_entered", _on_darkness_entered)


func set_color(_color: Color) -> void:
	color = _color
	await ready
	point_light_2d.color = color


func set_energy(val: float) -> void:
	@warning_ignore("narrowing_conversion")
	energy = val
	await ready
	point_light_2d.energy = val / 10
	animation_player.speed_scale = val / 5
	point_light_2d.texture.width = 16 * val
	point_light_2d.texture.height = 16 * val


func _on_darkness_entered(_body: Node2D) -> void:
	# TODO add puff animation
	queue_free()
