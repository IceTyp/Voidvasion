extends Control

signal difficulty_selected(difficulty)

@onready var v_box_container: VBoxContainer = $VBoxContainer


func _ready() -> void:
	difficulty_selected.connect(Global.load_map)
	visibility_changed.connect(_on_visibility_changed)
	Global.main_menu = self
	
	for i in range(v_box_container.get_child_count()):
		(v_box_container.get_child(i) as Button).pressed.connect(_on_button_difficulty_pressed.bind(i))


func _on_button_difficulty_pressed(difficulty: int) -> void:
	await create_tween().tween_property(self, "modulate", Color(0, 0, 0, 1), 0.5).finished
	hide()
	difficulty_selected.emit(difficulty)


func _on_visibility_changed() -> void:
	if visible:
		create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5).finished
