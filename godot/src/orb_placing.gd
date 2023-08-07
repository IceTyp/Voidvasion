extends Node2D

var small_orb := preload("res://src/orbs/small_orb.tscn")
var cursor_orb := preload("res://src/orbs/cursor_orb.tscn")

## this places orbs everywhere (for testing)
#func _ready() -> void:
#	for x in range(64):
#		for y in range(64):
#			var orb := small_orb.instantiate()
#			orb.position = Vector2(x, y)
#			add_child(orb)


func _ready() -> void:
	add_child(cursor_orb.instantiate())


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var orb := small_orb.instantiate()
			orb.position = event.position.round()
			add_child(orb)
