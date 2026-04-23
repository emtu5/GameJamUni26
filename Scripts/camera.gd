extends Camera2D

@onready var player = get_parent()
@export var camera_distance = 125
@export var camera_follow_speed = 1.5
@onready var vignette_rect: ColorRect = $CanvasLayer/ColorRect
@onready var distort_rect: ColorRect = $CanvasLayer/BackBufferCopy/ColorRect
var current_shader: String = "normal"


func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	position = position.lerp(((get_local_mouse_position().normalized() + input_dir * camera_follow_speed) * camera_distance),0.3)


func normal_shader() -> void:
	if current_shader == "normal":
		return
	var tween: Tween = create_tween()
	tween.tween_method(
		func(val: float): vignette_rect.material.set_shader_parameter("MainAlpha", val),
		1.0, 0.0, 2.0
	)
	current_shader = "normal"


func vignette_shader() -> void:
	if current_shader == "vignette":
		return
	elif current_shader == "normal":
		var tween: Tween = create_tween()
		tween.tween_method(
			func(val: float): vignette_rect.material.set_shader_parameter("MainAlpha", val),
			0.0, 1.0, 2.0
		)
	else:
		var tween: Tween = create_tween()
		tween.tween_method(
			func(val: float): distort_rect.material.set_shader_parameter("chaos", val),
			8.0, 0.0, 2.0
		)
	current_shader = "vignette"


func distort_shader() -> void:
	if current_shader == "distort":
		return
	var tween: Tween = create_tween()
	tween.tween_method(
		func(val: float): distort_rect.material.set_shader_parameter("chaos", val),
		0.0, 8.0, 2.0
	)
	current_shader = "distort"
