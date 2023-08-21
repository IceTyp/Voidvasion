extends Control


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


func _ready() -> void:
	hide()
	Global.game_ended.connect(_on_game_ended)


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
	show()


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


func _on_button_quit_pressed() -> void:
	get_tree().quit()
