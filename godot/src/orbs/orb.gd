class_name Orb
extends StaticBody2D

signal orb_placed
signal orb_broken

@export var energy: int = 1: set = set_energy
@export var color: Color = Color.WHITE: set = set_color

var aura := preload("res://src/orbs/aura.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var void_detector: Area2D = $VoidDetector
@onready var auras: Node2D = $Auras
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	void_detector.body_entered.connect(_on_void_entered)
	orb_placed.connect(Global._on_orb_placed)
	orb_broken.connect(Global._on_orb_broken)
	set_auras()
	orb_placed.emit()


func _process(delta: float) -> void:
	rotate(delta / 25)


func set_auras() -> void:
	for i in range(energy):
		var element := aura.instantiate()
		element.init(i + 1)
		auras.add_child(element)


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


func _on_void_entered(_body: Node2D) -> void:
	void_detector.body_entered.disconnect(_on_void_entered)
	auras.queue_free()
	animation_player.play("shatter")
	await animation_player.animation_finished
	orb_broken.emit()
	queue_free()
