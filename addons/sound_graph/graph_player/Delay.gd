@tool
class_name Delay extends PlayerResource


@export var delay_time : float = 1.0

func execute():
	if node:
		node.pulse()
	var child : PlayerResource = descendants[0]
	root_node.get_tree().create_timer(delay_time).timeout.connect(child.execute)
	child.finished.connect(func(): finished.emit(), CONNECT_ONE_SHOT)

func get_type() -> String:
	return "Delay"

func return_copy():
	var array : Array[PlayerResource] = []
	var copy : Delay = Delay.new()
	copy.delay_time = delay_time
	copy.graph_pos = graph_pos
	for i : PlayerResource in descendants:
		array.append(i.return_copy())
	copy.descendants = array
	return copy
