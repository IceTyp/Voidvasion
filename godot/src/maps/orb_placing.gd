extends Node2D

var small_orb := preload("res://src/orbs/small_orb.tscn")


func _on_cursor_place_orb(_position: Vector2) -> void:
	var orb := small_orb.instantiate()
	orb.position = _position.round()
	add_child(orb)
