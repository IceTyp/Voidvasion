extends Control

signal difficulty_selected(difficulty)

@onready var v_box_container: VBoxContainer = $VBoxContainer


func _ready() -> void:
	difficulty_selected.connect(Global.load_map)
	Global.main_menu = self
	
	for i in range(v_box_container.get_child_count()):
		(v_box_container.get_child(i) as Button).pressed.connect(_on_button_difficulty_pressed.bind(i))


func _on_button_difficulty_pressed(difficulty: int) -> void:
	hide()
	difficulty_selected.emit(difficulty)
