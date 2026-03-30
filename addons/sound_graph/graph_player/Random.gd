@tool
class_name Random extends PlayerResource

func execute():
	if !descendants: return
	var choice : PlayerResource = descendants.pick_random()
	choice.execute()
	choice.finished.connect(func(): finished.emit())

func get_type() -> String:
	return "Random"
