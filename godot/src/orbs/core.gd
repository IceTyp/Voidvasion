extends Orb


func _ready() -> void:
	orb_broken.connect(Global._on_core_broken)
	super._ready()
