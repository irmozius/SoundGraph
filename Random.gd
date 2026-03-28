class_name RandomNode extends AudioNode

var sound_list : Array[AudioNode]:
	set(v):
		sound_list = v
		print(sound_list)

func execute():
	if sound_list.size() == 0: return
	sound_list.pick_random().execute()

func _on_sound_deleted(sound : AudioNode):
	sound_list.erase(sound)

func _on_add_pressed() -> void:
	var new_label : Label = get_child(get_child_count() - 1).duplicate()
	var new_index : int = get_child_count()
	add_child(new_label)
	new_label.text = str(new_index)
	set_slot_enabled_left(new_index, true)

