extends Interactable

@onready var textlabel = $CanvasLayer/Panel/Label
@onready var uiNode = $CanvasLayer
@onready var audio_player = $AudioStreamPlayer2D
@onready var area = $Area2D/CollisionShape2D
@onready var sprite = $Sprite2D
var note:String = "Medication: pills taken. Note to self — stay in the light. Prolonged exposure to darkness may cause dissociative episodes.\n F/RMB-Flashlight\n E-Interact"

func _ready():
	super()
	uiNode.hide()

func interact():
	uiNode.show()
	audio_player.play()
	textlabel.text = note
	get_tree().paused = true


func _on_button_pressed() -> void:
	uiNode.hide()
	get_tree().paused = false
	audio_player.play()
	await audio_player.finished
	
	get_tree().paused = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	interact()
