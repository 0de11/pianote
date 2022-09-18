extends ProgressBar

signal Level_Up()

func _ready():
	initialize(1, false)

func initialize(level, test):
	set_maximum(level, test)
	value = 0

func raise():
	value += 1
	if(value == max_value):
		emit_signal("Level_Up")

func set_maximum(level, test):
	if(level >= 40):
		max_value = 30
	elif(level >= 30):
		max_value = 20
	elif(level >= 20):
		max_value = 15
	else:
		max_value = 10

	if(test):
		max_value = 1
