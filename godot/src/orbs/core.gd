extends Orb

signal core_broken


func _ready() -> void:
	core_broken.connect(Global._on_core_broken)
	tree_exiting.connect(_on_tree_exiting)
	super._ready()


func _on_tree_exiting() -> void:
	core_broken.emit()
