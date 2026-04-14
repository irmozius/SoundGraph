@tool
class_name VariableEntry
extends PanelContainer

@onready var variable : Variable = Variable.new()

@onready var name_text: LineEdit = %NameText
@onready var min_box: SpinBox = %MinBox
@onready var max_box: SpinBox = %MaxBox
@onready var value_slider: HSlider = %ValueSlider
@onready var val_lab: Label = %ValLab

var graph : Graph

signal deleted

func _ready() -> void:
	deleted.connect(graph.graph_resource._on_var_deleted.bind(variable))

func set_var_name(new_name : String):
	name_text.text = new_name
	variable.var_name = new_name
	print(variable)
	
func _on_name_text_text_submitted(new_text: String) -> void:
	set_var_name(new_text)

func _on_min_box_value_changed(value: float) -> void:
	variable.min_value = value
	value_slider.min_value = value
	value_slider.value = clamp(variable.current_value, variable.min_value, variable.max_value)

func _on_max_box_value_changed(value: float) -> void:
	variable.max_value = value
	value_slider.max_value = value
	value_slider.value = clamp(variable.current_value, variable.min_value, variable.max_value)

func _on_delete_but_pressed() -> void:
	deleted.emit()
	queue_free()

func _on_value_slider_value_changed(value: float) -> void:
	variable.current_value = value_slider.value
	val_lab.text = str(snappedf(variable.current_value, 0.01))
