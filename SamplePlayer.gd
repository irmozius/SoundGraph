class_name SamplePlayerNode extends AudioNode

@export var sample_button : Button
@export var file_dialog : FileDialog
@export var sample_label : Label
@export var play_button : Button

var sample : AudioStream = null


func _on_choose_sample_pressed() -> void:
	file_dialog.show()


func _on_file_dialog_file_selected(path: String) -> void:
	sample = load(path)
	sample_label.text = path

func _on_play_pressed() -> void:
	play_sound()

func play_sound() -> void:
	if !sample: return
	print('Playing ', sample)
	var player : AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(player)
	player.stream = sample
	player.finished.connect(func(): player.queue_free())
	player.play()

func execute():
	play_sound()
