extends CharacterBody2D


@export var speed:int = 15
var move_dir = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down") #get input vector
	move_dir = move_dir.lerp(input_dir, 0.3) #lerp for smoothing
	velocity = move_dir * speed # apply movement vector and speed 
	move_and_slide() #move player
