extends Node

@onready var sounds := {
	"accept": AudioStreamPlayer.new(),
	"focus": AudioStreamPlayer.new(),
}


func _ready() -> void:
	get_tree().get_root().child_entered_tree.connect(add_sounds_to_buttons)
	add_sounds_to_buttons(get_tree().get_root())
	for key in sounds.keys():
		add_child(sounds[key])
		sounds[key].stream = load("res://sound/ui/%s.ogg" % key)
		sounds[key].bus = "UI"


func add_sounds_to_buttons(node: Node) -> void:
	if node is Button:
		node.pressed.connect(sounds.accept.play)
		node.mouse_entered.connect(sounds.focus.play)
	for child in node.get_children():
		add_sounds_to_buttons(child)
