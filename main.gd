extends Node

var red = Color(255,0,0)
var green = Color(0,255,0)
var current_key
var y0
var test = true
var overtime = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	load_game()
	y0 = $note.position.y
	$score.initialize($level.value(), test)
	$timer.faster($level.value() - overtime)
	load_mode("default")
	current_key = $keys.get_child(0)
	$note.next(current_key)
	enable_keys()
	connect_midi()

func connect_midi():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

func _input(event : InputEvent):
	if(event is InputEventMIDI):
		match event.message:
			MIDI_MESSAGE_NOTE_ON:
				for key in $keys.get_children():
					if(key.pitch == event.pitch):
						validate(key)
						key.set_toggle_mode(true)
						key.set_pressed(true)
						break
			MIDI_MESSAGE_NOTE_OFF:
				for key in $keys.get_children():
					if(key.pitch == event.pitch):
						key.set_pressed(false)
						key.set_toggle_mode(false)
						break

func validate(key):
	if(current_key == key):
		correct_key(key)
	else:
		wrong_key(key)

func correct_key(key):
	key.change_color(green)
	$score.raise()
	if(!test):
		$timer.start()
	random_note()

func wrong_key(key):
	key.change_color(red)
	$note.change_color(red)
	$score.initialize($level.value(), test)
	$timer.stop()

func random_note():
	var next_note = randi() % int(min($level.value()+1, $keys.get_child_count()))
	if(test):
		next_note = $level.value()
	change_note(next_note)

func change_note(next_note):
	if(test):
		next_note = $level.value()
	current_key = $keys.get_child(next_note)
	if(!current_key):
		current_key = $keys.get_child(0)
	$note.position.y = y0 + current_key.y
	$note.next(current_key)

func level_up():
	$level.up()
	reset()

func level_down():
	$level.down()
	reset()

func reset():
	change_note($level.value())
	enable_keys()
	$score.initialize($level.value(), test)
	$timer.faster($level.value() - overtime)
	$timer.stop()
	save_game()

func enable_keys():
	for i in range($level.value(), $keys.get_child_count()):
		if(i < $keys.get_child_count()):
			$keys.get_child(i).disabled = true
	for i in range(0, $level.value()+1):
		if(i < $keys.get_child_count()):
			$keys.get_child(i).disabled = false

func _on_score_Level_Up():
	level_up()

func _on_timer_Times_Up():
	$score.initialize($level.value(), test)
	$timer.stop()

# Go through everything in the persist category and ask them to return a
# dict of relevant variables
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_data = {"level" : $level.value()}
	save_game.store_line(to_json(save_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open("user://savegame.save", File.READ)
	var save_data = parse_json(save_game.get_line())
		
	$level.set_level(save_data["level"]);
	save_game.close()


func _on_up_pressed():
	level_up()

func _on_down_pressed():
	level_down()

func load_mode(mode):
	for i in [0,1,2,3]:
		for key in $keys.get_children():
			if(mode=="default"):
				key.get_parent().move_child(key, key.default_index)
			if(mode=="bass"):
				key.get_parent().move_child(key, key.bass_index)


func _on_default_mode_pressed():
	load_mode("default")
	reset()
		
func _on_bass_mode_pressed():
	load_mode("bass")
	reset()
	
func _on_f2_pressed():
	validate($keys/f2)

func _on_fs2_pressed():
	validate($keys/fs2)

func _on_g2_pressed():
	validate($keys/g2)

func _on_af2_pressed():
	validate($keys/af2)
	
func _on_a2_pressed():
	validate($keys/a2)

func _on_bf2_pressed():
	validate($keys/bf2)

func _on_b2_pressed():
	validate($keys/b2)

func _on_c3_pressed():
	validate($keys/c3)
	
func _on_cs3_pressed():
	validate($keys/cs3)

func _on_d3_pressed():
	validate($keys/d3)

func _on_ef3_pressed():
	validate($keys/ef3)

func _on_e3_pressed():
	validate($keys/e3)

func _on_f3_pressed():
	validate($keys/f3)

func _on_fs3_pressed():
	validate($keys/fs3)

func _on_g3_pressed():
	validate($keys/g3)

func _on_af3_pressed():
	validate($keys/af3)
	
func _on_a3_pressed():
	validate($keys/a3)

func _on_bf3_pressed():
	validate($keys/bf3)

func _on_b3_pressed():
	validate($keys/b3)

func _on_c4_pressed():
	validate($keys/c4)
	
func _on_cs4_pressed():
	validate($keys/cs4)

func _on_d4_pressed():
	validate($keys/d4)

func _on_ef4_pressed():
	validate($keys/ef4)

func _on_e4_pressed():
	validate($keys/e4)

func _on_f4_pressed():
	validate($keys/f4)

func _on_fs4_pressed():
	validate($keys/fs4)

func _on_g4_pressed():
	validate($keys/g4)

func _on_af4_pressed():
	validate($keys/af4)
	
func _on_a4_pressed():
	validate($keys/a4)

func _on_bf4_pressed():
	validate($keys/bf4)

func _on_b4_pressed():
	validate($keys/b4)

func _on_c5_pressed():
	validate($keys/c5)
	
func _on_cs5_pressed():
	validate($keys/cs5)

func _on_d5_pressed():
	validate($keys/d5)

func _on_ef5_pressed():
	validate($keys/ef5)

func _on_e5_pressed():
	validate($keys/e5)

func _on_f5_pressed():
	validate($keys/f5)

func _on_fs5_pressed():
	validate($keys/fs5)

func _on_g5_pressed():
	validate($keys/g5)

func _on_af5_pressed():
	validate($keys/af5)
	
func _on_a5_pressed():
	validate($keys/a5)

