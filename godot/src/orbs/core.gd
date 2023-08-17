extends Orb


func _ready() -> void:
	orb_broken.connect(Global._on_core_broken)
	super._ready()


func _on_darkness_entered(_body: Node2D) -> void:
	darkness_detector.body_entered.disconnect(_on_darkness_entered)
	auras.queue_free()
	animation_player.play("super_nova")
	await animation_player.animation_finished
	animation_player.play("shatter")
	await animation_player.animation_finished
	orb_broken.emit()
	queue_free()
