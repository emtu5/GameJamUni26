extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var white: ColorRect = $ColorRect2
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var ghost: TextureRect = $TextureRect

signal on_fadeout_finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()
	anim_player.animation_finished.connect(_on_anim_finished)


func transition() -> void:
	color_rect.visible = true
	anim_player.play("fade_to_black")
	

func _on_anim_finished(anim_name: String) -> void:
	if anim_name == "fade_to_black":
		anim_player.play("fade_to_normal")
		on_fadeout_finished.emit()
	if anim_name == "fade_to_normal":
		color_rect.visible = false
		

func end2_1() -> void:
	color_rect.visible = true
	anim_player.play("fade_to_black_end2")


func end2_2() -> void:
	ghost.visible = true
	anim_player.play("fade_in_ghost_end2")
	await anim_player.animation_finished
	reset()
	

func end1() -> void:
	white.visible = true
	anim_player.play("fade_to_white_end1")
	await anim_player.animation_finished
	reset()
	
func reset() -> void:
	color_rect.visible = false
	white.visible = false
	ghost.visible = false
