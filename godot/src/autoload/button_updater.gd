extends Node

@onready var sounds := {
	"accept": AudioStreamPlayer.new(),
	"focus": AudioStreamPlayer.new(),
}


func _ready() -> void:
	get_tree().get_root().child_entered_tree.connect(update_buttons)
	for key in sounds.keys():
		add_child(sounds[key])
		sounds[key].stream = load("res://sound/ui/%s.ogg" % key)
		sounds[key].bus = "UI"


func update_buttons(node: Node) -> void:
	if node is Button:
		node.pressed.connect(sounds.accept.play)
		node.mouse_entered.connect(sounds.focus.play)
		node.text = "-%s-" % node.text
		node.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	for child in node.get_children():
		update_buttons(child)
