extends ProgressBar

signal Times_Up()

var thirty_seconds = 120

func _ready():
	value = 0
	max_value = thirty_seconds

func faster(level):
	if(level > 0):
		var new_time = thirty_seconds - 4 * level
		if(new_time > 0):
			max_value = new_time

func start():
	$Timer.start()

func stop():
	value = 0
	$Timer.stop()

func _on_Timer_timeout():
	value += 1
	if(value == max_value):
		#value = 0
		emit_signal("Times_Up")
