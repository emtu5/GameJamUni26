class_name Interactable extends Node2D
var player
var overhead_text

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")
	overhead_text = player.get_node("OverheadText")
func interact():
	pass
