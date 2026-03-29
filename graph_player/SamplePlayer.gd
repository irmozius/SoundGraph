class_name SamplePlayer extends PlayerResource

var sample : AudioStream
var pitch_min : float = 1.0
var pitch_max : float = 1.0
var vol_min : float = 0.0
var vol_max : float = 0.0

func play_sound() -> void:
	if !sample: return
	print('Playing ', sample)
	var player : AudioStreamPlayer = AudioStreamPlayer.new()
	root_node.add_child(player)
	player.stream = sample
	player.finished.connect(func(): player.queue_free())
	_set_pitch_and_volume(player)
	player.play()

func _set_pitch_and_volume(player : AudioStreamPlayer):
	player.pitch_scale = randf_range(pitch_min, pitch_max)
	player.volume_db = randf_range(vol_min, vol_max)

func execute():
	play_sound()
