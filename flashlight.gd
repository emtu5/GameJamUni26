extends Node2D

var mouse_vector = Vector2.ZERO
@onready var ray:RayCast2D = $RayCast2D

func _ready():
	var player = get_parent().get_parent()
	ray.add_exception(player)
	
func _process(delta: float) -> void:
	mouse_vector = mouse_vector.lerp(get_viewport().get_mouse_position(), 0.2) # get mouse position + smooth
	look_at(mouse_vector) #rotate towards mouse position
	
