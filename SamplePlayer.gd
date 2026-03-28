class_name SamplePlayerNode extends AudioNode

@export var sample_button : Button
@export var file_dialog : FileDialog
@export var play_button : Button
@export var pitch_min_input : SpinBox
@export var pitch_max_input : SpinBox
@export var vol_min_input : SpinBox
@export var vol_max_input : SpinBox

var sample : AudioStream = null


func _on_choose_sample_pressed() -> void:
	file_dialog.show()


func _on_file_dialog_file_selected(path: String) -> void:
	sample = load(path)
	sample_button.text = path.trim_prefix("res://")

func _on_play_pressed() -> void:
	play_sound()

func play_sound() -> void:
	if !sample: return
	print('Playing ', sample)
	var player : AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(player)
	player.stream = sample
	player.finished.connect(func(): player.queue_free())
	_set_pitch_and_volume(player)
	player.play()

func _set_pitch_and_volume(player : AudioStreamPlayer):
	player.pitch_scale = randf_range(pitch_min_input.value, pitch_max_input.value)
	player.volume_db = randf_range(vol_min_input.value, vol_max_input.value)

func execute():
	play_sound()
