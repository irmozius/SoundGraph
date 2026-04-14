@tool
class_name Variable extends Resource

@export var var_name : String = "Var"

@export var current_value : float = 1.0
@export var min_value : float = 1.0
@export var max_value : float = 10.0

func set_value(value : float):
	current_value = clamp(value, min_value, max_value)

func _to_string() -> String:
	var text : String = var_name
	text += ": {0}\nMin: {1}\nMax: {2}".format([current_value, min_value, max_value])
	return text
