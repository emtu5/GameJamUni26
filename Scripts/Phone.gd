extends Interactable
@onready var audio_player = $AudioStreamPlayer2D
@onready var uilayer = $UI
@export var phonetext:String

func _ready() -> void:
	uilayer.hide()


func interact():
	uilayer.show()
	var buttontext = $UI/Button
	buttontext.text = phonetext



func _on_play_audio_area_body_entered(body: Node2D) -> void:
	audio_player.play()


func _on_play_audio_area_body_exited(body: Node2D) -> void:
	uilayer.hide()


func _on_button_pressed() -> void:
	uilayer.hide()
