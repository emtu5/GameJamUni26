extends Interactable
@onready var audio_player = $AudioStreamPlayer2D
@onready var uilayer = $UI
var phoneonetext:String = "I asked for help... you were there... you never came."
var ending1text:String = "You came back. \n You always knew where to find me \n I called you. Do you remember? \n I just needed someone to stay. \n I'm not angry anymore."
var ending2text:String = "You always knew where to find me. \n I called you. Do you remember?"

static var calls: Dictionary = {
	"ring": preload("res://Sounds/AUDIO_telefon.mp3"),
	"pickup": preload("res://Sounds/AUDIO_call_start.mp3"),
	"end": preload("res://Sounds/AUDIO_call_end.mp3")
}



func _ready() -> void:
	super()
	uilayer.hide()


func interact():
	uilayer.show()
	audio_player.stop()
	var stream = calls["pickup"]
	audio_player.stream = stream
	audio_player.play()
	var buttontext = $UI/Button
	buttontext.text = phoneonetext
	await uilayer.visibility_changed
	player.gotfirstphone = true


func _on_play_audio_area_body_entered(body: Node2D) -> void:
	audio_player.stop()
	var stream = calls["ring"]
	audio_player.stream = stream
	audio_player.play()



func _on_play_audio_area_body_exited(body: Node2D) -> void:
	audio_player.stop()
	var stream = calls["end"]
	audio_player.stream = stream
	audio_player.play()
	uilayer.hide()


func _on_button_pressed() -> void:
	audio_player.stop()
	var stream = calls["end"]
	audio_player.stream = stream
	audio_player.play()
	uilayer.hide()
