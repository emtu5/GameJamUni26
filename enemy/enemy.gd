extends CharacterBody2D


const SPEED = 60.0

@export var lights: Node2D = null
@export var player: Node2D = null
var goal: Node2D = null
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var icon: AnimatedSprite2D = $Icon
@onready var collision: CollisionShape2D = $CollisionShape2D
@export var audio_player_moving:AudioStreamPlayer2D
@export var audio_player_passive:AudioStreamPlayer2D


func _ready() -> void:
	goal = get_nearest_light()
	$NavigationAgent2D.target_position = goal.global_position
	icon.play("default")
	
	
func _physics_process(delta: float) -> void:
	
	#print(global_position)
	if !nav_agent.is_target_reached():
		var nav_point: Vector2 = nav_agent.get_next_path_position()
		var nav_point_direction: Vector2 = to_local(nav_point).normalized()
		icon.look_at(nav_point)
		collision.look_at(nav_point)
		velocity = nav_point_direction * SPEED;
		move_and_slide()
		
	if goal == player:
		audio_player_moving.play()
		#print("moving")
	else:
		audio_player_passive.play()
		#print("passive")

func _on_timer_timeout() -> void:
	goal = get_nearest_light()
	nav_agent.target_position = goal.global_position
	$Timer.start()
	

func get_nearest_light() -> Node2D:
	if player.flashlight.enabled:
		return player
	var min_path: float = 1000000
	var min_light: Node2D = null
	for light in lights.get_children():
		nav_agent.target_position = light.global_position
		nav_agent.get_next_path_position()
		var current_path: float = nav_agent.get_path_length()
		if current_path < min_path:
			min_path = current_path
			min_light = light
	if min_light:
		return min_light
	return player
