extends Control

signal difficulty_selected(difficulty)

@onready var difficulties_container: VBoxContainer = %DifficultiesContainer
@onready var mouse_blocker: ColorRect = $MouseBlocker


func _ready() -> void:
	difficulty_selected.connect(Global.load_map)
	visibility_changed.connect(_on_visibility_changed)
	
	for key in Global.difficulties:
		var button := Button.new()
		button.text = key
		button.pressed.connect(_on_button_difficulty_pressed.bind(key))
		difficulties_container.add_child(button)


func _on_button_difficulty_pressed(id: String) -> void:
	mouse_blocker.show()
	get_viewport().gui_release_focus()
	await create_tween().tween_property(self, "modulate", Color(0, 0, 0, 1), 0.5).finished
	hide()
	difficulty_selected.emit(id)


func _on_visibility_changed() -> void:
	if visible:
		mouse_blocker.hide()
		create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)
