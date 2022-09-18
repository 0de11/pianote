extends Button

export var y = 0
export var up = true
export var acc = ''
export var bar = true
export var letter = ""
export var pitch = 60
export var default_index = 0
export var treble_index = 0
export var bass_index = 0

func change_color(color):
	var new_style = StyleBoxFlat.new()
	new_style.set_bg_color(color)
	set('custom_styles/pressed', new_style)

