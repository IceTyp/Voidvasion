extends Area2D
class_name Orb

@export var energy: int = 1: set = set_energy
@export var color: Color = Color.WHITE: set = set_color

var orbit := preload("res://src/orbs/orbit.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var orbits: Node2D = $Orbits
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	body_entered.connect(_on_darkness_entered)
	set_orbits()


func _process(delta: float) -> void:
	rotate(delta / 25)


func set_orbits() -> void:
	for i in range(energy):
		var element := orbit.instantiate()
		element.init(i+1)
		orbits.add_child(element)


func set_color(_color: Color) -> void:
	color = _color
	await ready
	point_light_2d.color = color


func set_energy(val: int) -> void:
	energy = val
	await ready
	point_light_2d.energy = float(val) / 20
	animation_player.speed_scale = float(val) / 10
	point_light_2d.texture.width = 8 * val
	point_light_2d.texture.height = 8 * val


func _on_darkness_entered(_body: Node2D) -> void:
	# TODO add puff animation
	queue_free()
