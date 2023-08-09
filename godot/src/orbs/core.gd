extends Orb

signal core_broke


func _on_darkness_entered(_body: Node2D) -> void:
	core_broke.emit()
	super._on_darkness_entered(_body)
