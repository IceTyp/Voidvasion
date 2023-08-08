extends Orb

func _ready() -> void:
	set_orbits()


func _process(_delta: float) -> void:
	# TODO clamp window size
	position = get_global_mouse_position().round()
	
