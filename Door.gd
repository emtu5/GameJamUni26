class_name Door extends Interactable

@export var teleport_location:Node2D
var player

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")

func interact():
	player.position = teleport_location.position
