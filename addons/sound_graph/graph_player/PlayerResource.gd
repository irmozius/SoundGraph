@tool
class_name PlayerResource extends Resource

var root_node : Node:
	set(n):
		root_node = n
		for res in descendants:
			res.root_node = n

@export var descendants : Array[PlayerResource] = []
@export var graph_pos : Vector2

func execute():
	pass

func _to_string() -> String:
	var str : String = get_type() + "\n"
	for i in descendants:
		str += i._to_string()
	return str

func get_type() -> String:
	return ""