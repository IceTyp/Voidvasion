extends Node2D

var small_orb := preload("res://src/orbs/small_orb.tscn")


## this places orbs everywhere (for testing)
#func _ready() -> void:
#	for x in range(64):
#		for y in range(64):
#			var orb := small_orb.instantiate()
#			orb.position = Vector2(x, y)
#			add_child(orb)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var orb := small_orb.instantiate()
			orb.position = event.position.round()
			add_child(orb)
