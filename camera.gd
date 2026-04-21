extends Camera2D

@onready var player = get_parent()
@export var camera_distance = 125
@export var camera_follow_speed = 1.5

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	position = position.lerp(((get_local_mouse_position().normalized() + input_dir * camera_follow_speed) * camera_distance),0.3)
