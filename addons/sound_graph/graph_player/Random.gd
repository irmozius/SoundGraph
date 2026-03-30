@tool
class_name Random extends PlayerResource

func execute():
	if !descendants: return
	descendants.pick_random().execute()

func get_type() -> String:
	return "Random"
