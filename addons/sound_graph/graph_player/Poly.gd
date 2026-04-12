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
				finished.emit(), CONNECT_ONE_SHOT)

func get_type() -> String:
	return "Poly"

func return_copy():
	var array : Array[PlayerResource] = []
	var copy : Poly = Poly.new()
	copy.graph_pos = graph_pos
	for i : PlayerResource in descendants:
		array.append(i.return_copy())
	copy.descendants = array
	return copy
