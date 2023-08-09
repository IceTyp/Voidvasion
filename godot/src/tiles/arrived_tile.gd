extends DarknessTile


func _ready() -> void:
	Global.game_started.connect(_on_game_started)
	super._ready()
	_on_arrived()


func _on_game_started() -> void:
	arrived.emit()
