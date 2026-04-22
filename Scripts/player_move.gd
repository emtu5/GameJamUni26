extends CharacterBody2D


@export var speed:int = 15
var move_dir = Vector2.ZERO
@onready var arealight = $AreaLight
@onready var flashlight = $Pivot/Flashlight
@onready var interactray = $Pivot/RayCast2D
var hasFirstKey:bool
var hasSecondKey:bool
@onready var foldercount:int = 0
var sanity:int

func _ready():
	sanity = 100

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down") #get input vector
	move_dir = move_dir.lerp(input_dir, 0.265) #lerp for smoothing
	velocity = move_dir * speed # apply movement vector and speed 
	move_and_slide() #move player
	
	if Input.is_action_just_pressed("toggle_flashlight"):
		#arealight.enabled = not arealight.enabled
		flashlight.enabled = not flashlight.enabled

	if Input.is_action_just_pressed("Interact"):
		var hit = interactray.get_collider()
		if hit and hit.get_parent() is Interactable:
			hit.get_parent().interact()
		
	
