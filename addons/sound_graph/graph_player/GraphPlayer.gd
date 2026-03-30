@tool
class_name GraphPlayer extends Node

@export_tool_button("Test Sound", "AudioStreamPlayer") var test_button : Callable = play

@export var root_node : Node
@export var graph : SoundGraph:
	set(g):
		graph = g
		for res : PlayerResource in graph.graph:
			res.root_node = root_node

func play():
	for res : PlayerResource in graph.graph:
		res.execute()
