@tool
class_name AudioNode extends GraphNode

signal deleted

@onready var graph_editor : Graph = get_parent()
var connected_by : Array[AudioNode]
var connected_to : Array[AudioNode]
var resource : PlayerResource

func execute():
	resource.execute()

func moved():
	if resource:
		resource.graph_pos = position_offset
	
func _enter_tree() -> void:
	position_offset_changed.connect(moved)

func spawn_descendants():
	var index : = 0
	if resource.descendants.size() == 0: return
	for dres : PlayerResource in resource.descendants:
		var dnode : AudioNode = graph_editor.load_node_from_resource(dres)
		graph_editor.add_connection(dnode.name, 0, name, index)
		index += 1

func load_values():
	pass
	
func pulse():
	var t : Tween = create_tween()
	modulate = Color.WHITE * 1.8
	t.tween_property(self, "modulate", Color.WHITE, 0.1)
