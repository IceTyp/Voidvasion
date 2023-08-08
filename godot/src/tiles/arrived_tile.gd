extends DarknessTile


func _ready() -> void:
	super._ready()
	_on_arrived()
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	arrived.emit()
