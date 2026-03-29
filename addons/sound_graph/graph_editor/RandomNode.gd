@tool
class_name RandomNode extends AudioNode

func _ready() -> void:
	resource = Random.new()

func _on_sound_deleted(sound : AudioNode):
	connected_by.erase(sound)

func _on_add_pressed() -> void:
	var new_label : Label = get_child(get_child_count() - 1).duplicate()
	var new_index : int = get_child_count()
	add_child(new_label)
	new_label.text = str(new_index)
	set_slot_enabled_left(new_index, true)
