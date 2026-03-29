class_name GraphPlayer extends Node

@export var root_node : Node
@export var graph : SoundGraph:
	set(g):
		graph = g
		for res : PlayerResource in graph.graph:
			res.root_node = root_node
