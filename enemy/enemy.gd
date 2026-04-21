extends CharacterBody2D


const SPEED = 60.0

@export var goal: Node2D = null

func _ready() -> void:
	$NavigationAgent2D.target_position = goal.global_position
	
	
func _physics_process(delta: float) -> void:
	if !$NavigationAgent2D.is_target_reached():
		var nav_point_direction: Vector2 = to_local($NavigationAgent2D.get_next_path_position()).normalized()
		velocity = nav_point_direction * SPEED;
		move_and_slide()


func _on_timer_timeout() -> void:
	if $NavigationAgent2D.target_position != goal.global_position:
		$NavigationAgent2D.target_position = goal.global_position
	$Timer.start()
