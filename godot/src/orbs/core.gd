extends Orb

signal core_broken


func _ready() -> void:
	core_broken.connect(Global._on_core_broken)
	super._ready()


func _on_darkness_entered(_body: Node2D) -> void:
	core_broken.emit()
	super._on_darkness_entered(_body)
