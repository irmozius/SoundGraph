class_name SoundGraph extends Resource

var graph : Array[PlayerResource]

func add_resource(resource : PlayerResource, root_node : Node):
	resource.root_node = root_node
	graph.append(resource)
