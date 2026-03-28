class_name Graph extends GraphEdit

@export var node_place_menu_scene : PackedScene
@export var output_node : OutputNode

var node_place_menu : NodePlaceMenu
var output_connections : Array[AudioNode]

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept"):
		for node : AudioNode in output_connections:
			node.execute()

func add_connection(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> bool:
	var connected : bool = is_node_connected(from_node, from_port, to_node, to_port)
	if !connected:
		var f_node : AudioNode = get_node(str(from_node))
		var t_node : AudioNode = get_node(str(to_node))
		connect_node(from_node, from_port, to_node, to_port)
		f_node.connected_to.append(t_node)
		t_node.connected_by.append(f_node)
		match get_node_title(str(to_node)):
			"Output":
				output_connections.append(f_node)
			"Random":
				f_node.deleted.connect(t_node._on_sound_deleted.bind(f_node))
		return true
	else: return false

func get_node_title(node_name : String) -> String:
	var node : AudioNode = get_node(node_name)
	return node.title

func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	add_connection(from_node, from_port, to_node, to_port)

func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node, from_port, to_node, to_port)
	var f_node : AudioNode = get_node(str(from_node))
	var t_node : AudioNode = get_node(str(to_node))
	f_node.connected_to.erase(t_node)
	t_node.connected_by.erase(f_node)
	match get_node_title(str(to_node)):
		"Output":
			output_connections.erase(f_node)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_released():
			if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and node_place_menu:
				node_place_menu.queue_free()



func _on_delete_nodes_request(nodes: Array[StringName]) -> void:
	for node_name in nodes:
		if str(node_name) == "Output": continue
		var node : AudioNode = get_node(str(node_name))
		output_connections.erase(node)
		node.emit_signal("deleted")
		node.queue_free()

func create_instruction_list() -> void:
	pass


func _on_popup_request(at_position: Vector2) -> void:
	node_place_menu = node_place_menu_scene.instantiate()
	node_place_menu.graph = self
	add_child(node_place_menu)
	node_place_menu.position = at_position
