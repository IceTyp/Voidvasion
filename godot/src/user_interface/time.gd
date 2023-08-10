extends Label

@onready var timer: Timer = $Timer

var elapsed_seconds := 0


func _ready() -> void:
	Global.game_started.connect(start_time)
	timer.timeout.connect(_on_timer_timeout)
	update_displayed_time()
	hide()


func update_displayed_time() -> void:
	@warning_ignore("integer_division")
	text = "%02d:%02d" % [(elapsed_seconds / 60), elapsed_seconds % 60]


func start_time() -> void:
	show()
	timer.start()


func _on_timer_timeout() -> void:
	elapsed_seconds += 1
	update_displayed_time()
	timer.start()
