@tool
class_name MappingNode
extends AudioNode

@onready var var_name_edit: LineEdit = %VarNameEdit
@onready var curve_editor: CurveEditor = %CurveEditor
@onready var min_box: SpinBox = %MinBox
@onready var max_box: SpinBox = %MaxBox

var source_variable : Variable

func _ready() -> void:
	resource = Mapping.new()
	resource.curve = curve_editor.get_data()

func load_values():
	pass

func _on_var_name_edit_text_submitted(new_text: String) -> void:
	source_variable = graph_editor.graph_resource.get_variable_entry(new_text)
	resource.source_variable = source_variable
	if source_variable:
		curve_editor._curve.min_domain = source_variable.min_value
		curve_editor._curve.max_domain = source_variable.max_value

func _on_min_box_value_changed(value: float) -> void:
	curve_editor._curve.min_value = value

func _on_max_box_value_changed(value: float) -> void:
	curve_editor._curve.max_value = value

func connect_to(to_node : AudioNode, to_port : int):
	print('connected to ' + to_node.left_port_map[to_port])
