extends Label


func _ready() -> void:
	var file := FileAccess.open("res://version.txt", FileAccess.READ)
	text = "v%s" % file.get_line()
	file.close()
