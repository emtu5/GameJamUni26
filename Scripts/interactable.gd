class_name Interactable extends Node2D
var player: Node2D
var overhead_text
var text_timer: Timer
func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")
	overhead_text = player.get_node("UI/OverheadText")
	text_timer = overhead_text.get_node("Timer")
	print(overhead_text)
	
func _physics_process(delta: float) -> void:
	if overhead_text:
		overhead_text.position = player.get_global_transform_with_canvas().get_origin() + Vector2(-125, -100)
	
func interact():
	pass
