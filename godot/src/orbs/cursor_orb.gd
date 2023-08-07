extends Orb

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	# TODO clamp window size
	position = get_global_mouse_position().round()
	
