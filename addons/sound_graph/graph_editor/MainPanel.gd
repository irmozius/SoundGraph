@tool
class_name GraphPanel
extends PanelContainer

@onready var graph : Graph = $%Graph
@onready var file_dialog : FileDialog = $%FileDialog

func _on_save_pressed() -> void:
	file_dialog.show()
	
func _on_play_pressed() -> void:
	graph.play_graph()

func _on_file_dialog_file_selected(path: String) -> void:
	var graph_res : SoundGraph = graph.graph_resource
	ResourceSaver.save(graph_res, path)
