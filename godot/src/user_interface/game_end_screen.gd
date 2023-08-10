extends Control

signal new_game_requested

const messages := {
	0: "Improvable",
	70: "Not Bad!",
	90: "Brilliant",
	110: "Glowing Effort!",
	120: "Radiant Stand!",
	130: "Guiding Light!",
}

var result := "No message...": set = update_result

@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var button_new_game: Button = $VBoxContainer/ButtonNewGame
@onready var mouse_blocker: ColorRect = $MouseBlocker


func _ready() -> void:
	hide()
	mouse_blocker.hide()
	Global.game_ended.connect(_on_game_ended)
	new_game_requested.connect(Global._on_new_game_requested)


func update_result(val: String) -> void:
	result = val
	rich_text_label.text = (
		"[center][color=#ce643b][ghost]%s[/ghost][/color][/center]\nOrbs: %s" % [result, Global.orbs_placed]
	)

func _on_game_ended() -> void:
	modulate = Color(1, 1, 1, 0)
	show()
	create_tween().tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)
	for key in messages.keys():
		if key < Global.seconds:
			result = messages[key]
		else:
			break


func _on_button_copy_pressed() -> void:
	DisplayServer.clipboard_set(
		"%s\nYou survived %s seconds and used %s orb%s." % [
				result,
				Global.seconds,
				Global.orbs_placed,
				"" if Global.orbs_placed == 1 else "s"
		]
	)


func _on_button_new_game_pressed() -> void:
	mouse_blocker.show()
	get_viewport().gui_release_focus()
	await create_tween().tween_property(self, "modulate", Color(0, 0, 0, 1), 0.5).finished
	new_game_requested.emit()


func _on_button_quit_pressed() -> void:
	get_tree().quit()
