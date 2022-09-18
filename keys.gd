extends ReferenceRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

class MyCustomSorter:
	static func sort_default(a, b):
		if a.default_index < b.default_index:
			return true
		return false
