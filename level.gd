extends Label

var level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(level)

func value():
	return level

func set_level(_level):
	level = _level
	text = str(level)

func up():
	level += 1
	text = str(level)

func down():
	if(level > 1):
		level -= 1
		text = str(level)
