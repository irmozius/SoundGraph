class_name AudioNode extends GraphNode

signal deleted

var connected_by : Array[AudioNode]
var connected_to : Array[AudioNode]
var resource : PlayerResource

func execute():
	resource.execute()
