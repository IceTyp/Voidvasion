class_name Orb
extends StaticBody2D

@export var energy: int = 1: set = set_energy
@export var color: Color = Color.WHITE: set = set_color

var orbit := preload("res://src/orbs/orbit.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var darkness_detector: Area2D = $DarknessDetector
@onready var orbits: Node2D = $Orbits
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	darkness_detector.body_entered.connect(_on_darkness_entered)
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
	point_light_2d.energy = val / 20.0
	animation_player.speed_scale = val / 10.0
	point_light_2d.texture.width = 8 * val
	point_light_2d.texture.height = 8 * val


func _on_darkness_entered(_body: Node2D) -> void:
	darkness_detector.body_entered.disconnect(_on_darkness_entered)
	orbits.queue_free()
	animation_player.queue_free()
	point_light_2d.energy = 0
	await get_tree().create_timer(0.05).timeout
	point_light_2d.energy = energy
	await get_tree().create_timer(0.1).timeout
	queue_free()
