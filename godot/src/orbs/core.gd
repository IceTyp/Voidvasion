extends Orb


func _ready() -> void:
	orb_broken.connect(Global._on_core_broken.bind(self))
	super._ready()


func _on_void_entered(_body: Node2D) -> void:
	orb_broken.emit()
	void_detector.body_entered.disconnect(_on_void_entered)
	auras.queue_free()
	animation_player.play("super_nova")
	await animation_player.animation_finished
	animation_player.play("shatter")
	await animation_player.animation_finished
	queue_free()
