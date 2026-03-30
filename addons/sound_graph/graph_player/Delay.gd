@tool
class_name Delay extends PlayerResource


@export var delay_time : float = 1.0

func execute():
	var child : PlayerResource = descendants[0]
	root_node.get_tree().create_timer(delay_time).timeout.connect(child.execute)
	child.finished.connect(func(): finished.emit())

func get_type() -> String:
	return "Delay"
