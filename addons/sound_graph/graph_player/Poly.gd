@tool
class_name Poly extends PlayerResource

func execute():
	if node:
		node.pulse()
	if !descendants: return
	var count : int = descendants.size()
	for i : PlayerResource in descendants:
		i.execute()
		i.finished.connect(func():
			count -= 1
			if count == 0:
				finished.emit())

func get_type() -> String:
	return "Poly"
