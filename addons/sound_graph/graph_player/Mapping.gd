@tool
class_name Mapping extends PlayerResource

@export var curve : Curve
@export var source_variable : Variable

var target_resource : PlayerResource
var target_property : String

func execute():
	pass

func get_type() -> String:
	return "Mapping"
