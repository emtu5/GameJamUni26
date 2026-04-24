extends Node2D

var mouse_vector = Vector2.ZERO
@onready var player = get_parent()

func _process(delta: float) -> void:
	mouse_vector = mouse_vector.lerp(get_global_mouse_position(), 0.2) # get mouse position + smooth
	look_at(mouse_vector) #rotate towards mouse position
	player.player_sprite.look_at(mouse_vector)
	
