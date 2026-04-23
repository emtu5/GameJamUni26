extends CharacterBody2D


@export var speed:int = 15
var move_dir = Vector2.ZERO
@onready var arealight = $AreaLight
@onready var flashlight = $Pivot/Flashlight
@onready var interactray = $Pivot/RayCast2D
@onready var cam: Camera2D = $Camera
var hasFirstKey:bool
var hasSecondKey:bool
var hasLightSource:bool = false
var isAttacked: bool = false
@onready var foldercount:int = 0
var sanity:float
const SANITY_INCREMENT: float = 0.1
@onready var audioplayer = $FlashlightPlayer
func _ready():
	sanity = 100

func _physics_process(delta: float) -> void:
	process_sanity()
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down") #get input vector
	move_dir = move_dir.lerp(input_dir, 0.265) #lerp for smoothing
	velocity = move_dir * speed # apply movement vector and speed 
	move_and_slide() #move player
	
	if Input.is_action_just_pressed("toggle_flashlight"):
		audioplayer.play()
		flashlight.enabled = not flashlight.enabled

	if Input.is_action_just_pressed("Interact"):
		var hit = interactray.get_collider()
		if hit and hit.get_parent() is Interactable:
			hit.get_parent().interact()
		
	
func process_sanity() -> void:
	if (flashlight.enabled or hasLightSource) and not isAttacked:
		modify_sanity(SANITY_INCREMENT)
	else:
		modify_sanity(-SANITY_INCREMENT)
	print(sanity)
	if sanity >= 60:
		cam.normal_shader()
	elif sanity >= 40:
		cam.vignette_shader()
	else:
		cam.distort_shader()
	
func modify_sanity(increment: float) -> void:
	if sanity + increment > 100:
		sanity = 100
	elif sanity + increment < 0:
		sanity = 0
	else:
		sanity += increment


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.collision_layer)
	if area.collision_layer == 16:
		hasLightSource = true
	

func _on_area_2d_area_exited(area: Area2D) -> void:
	print(area.collision_layer)
	if area.collision_layer == 16:
		hasLightSource = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.collision_layer)
	if body.collision_layer == 2:
		isAttacked = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	print(body.collision_layer)
	if body.collision_layer == 2:
		isAttacked = false
