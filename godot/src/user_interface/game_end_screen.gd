extends Control

signal main_menu_requested
signal restart_map

const messages := {
	0: "Flicker of Hope",
	120: "Glowing Effort",
	140: "Guiding Light",
	160: "Radiant Stand",
	180: "Luminous\nResilience",
	200: "Resolute Spirit",
}

var result := "No message...": set = update_result

@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var button_new_game: Button = %ButtonNewGame
@onready var mouse_blocker: ColorRect = $MouseBlocker


func _ready() -> void:
	hide()
	mouse_blocker.hide()
	Global.game_ended.connect(_on_game_ended)
	main_menu_requested.connect(Global._on_main_menu_requested)


func update_result(val: String) -> void:
	result = val
	rich_text_label.text = (
		"[center][color=#ce643b][ghost freq=-4, span=3]%s[/ghost][/color][/center]\nOrbs: %s\n%s" % [
				result,
				Global.orbs_placed,
				Global.chosen_difficulty
		]
	)


func _on_game_ended() -> void:
	for key in messages.keys():
		if key < Global.seconds:
			result = messages[key]
		else:
			break
	modulate = Color(1, 1, 1, 0)
	mouse_blocker.show()
	show()
	await create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 1).finished
	mouse_blocker.hide()


func _on_button_copy_pressed() -> void:
	DisplayServer.clipboard_set(
		"%s\nYou survived %s seconds on %s and used %s orb%s." % [
				result,
				Global.seconds,
				Global.chosen_difficulty.to_upper(),
				Global.orbs_placed,
				"" if Global.orbs_placed == 1 else "s"
		]
	)


func _on_button_restart_pressed() -> void:
	restart_map.emit()


func _on_button_main_menu_pressed() -> void:
	mouse_blocker.show()
	get_viewport().gui_release_focus()
	await create_tween().tween_property(self, "modulate", Color(0, 0, 0, 1), 0.5).finished
	main_menu_requested.emit()


func _on_button_quit_pressed() -> void:
	get_tree().quit()
