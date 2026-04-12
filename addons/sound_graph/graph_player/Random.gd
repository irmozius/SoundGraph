@tool
class_name Random extends PlayerResource

func execute():
	if node:
		node.pulse()
	if !descendants: return
	var choice : PlayerResource = descendants.pick_random()
	choice.execute()
	choice.finished.connect(func(): finished.emit(), CONNECT_ONE_SHOT)

func get_type() -> String:
	return "Random"

func return_copy():
	var array : Array[PlayerResource] = []
	var copy : Random = Random.new()
	copy.graph_pos = graph_pos
	for i : PlayerResource in descendants:
		array.append(i.return_copy())
	copy.descendants = array
	return copy
