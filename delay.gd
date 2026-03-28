class_name DelayNode extends AudioNode

@export var timer : Timer
@export var spinbox : SpinBox

func execute():
	timer.wait_time = spinbox.value
	timer.start()


func _on_timer_timeout() -> void:
	for node : AudioNode in connected_by:
		node.execute()
