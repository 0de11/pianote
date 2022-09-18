extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$up.show()
	$down.hide()
	$flat.hide()
	$sharp.hide()
	$bar.show()

func next(key):
	if(key.up == true):
		$up.show()
		$down.hide()
	else:
		$up.hide()
		$down.show()
	
	$flat.hide()
	$sharp.hide()
	if(key.acc == '#'):
		$sharp.show()
	if(key.acc == 'b'):
		$flat.show()
	
	if(key.bar == true):
		$bar.show()
	else:
		$bar.hide()
	
	change_color(Color(1, 1, 1))

func change_color(color):
	$up.modulate = color
	$down.modulate = color
	$flat.modulate = color
	$sharp.modulate = color
	$bar.modulate = color
