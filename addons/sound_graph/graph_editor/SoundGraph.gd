@tool
class_name SoundGraph extends Resource

@export var graph : Array[PlayerResource]
@export var output_position : Vector2
@export var variables : Dictionary[String, Variable]

func add_resource(resource : PlayerResource, root_node : Node, bus : String):
	print(resource.audio_bus)
	resource.root_node = root_node
	#resource.audio_bus = bus
	graph.append(resource)

func _to_string() -> String:
	var str : String
	for i : PlayerResource in graph:
		str += i._to_string()
	return str

func get_variable_entry(varname : String) -> Variable:
	return variables[varname]

func _on_var_deleted(variable : Variable):
	variables.erase(variable.var_name)
	print(variables)
