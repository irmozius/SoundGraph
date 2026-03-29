class_name DelayNode extends AudioNode

@export var timer : Timer
@export var spinbox : SpinBox

func _ready() -> void:
	resource = Delay.new()
	
func _on_sound_deleted(sound : AudioNode):
	connected_by.erase(sound)

func _on_spin_box_value_changed(value: float) -> void:
	resource.delay_time = value
