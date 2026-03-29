class_name Delay extends PlayerResource

var delay_time : float = 1.0

func execute():
	root_node.get_tree().create_timer(delay_time).timeout.connect(descendants[0].execute)
