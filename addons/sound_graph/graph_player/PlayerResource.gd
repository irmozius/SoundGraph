@abstract class_name PlayerResource extends Resource

var root_node : Node:
	set(n):
		root_node = n
		for res in descendants:
			res.root_node = n
			
var descendants : Array[PlayerResource]

@abstract func execute()
