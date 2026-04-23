extends Interactable
@onready var audio_player = $AudioStreamPlayer2D
@onready var uilayer = $UI
@onready var endtimer = $Timer

var ending1text:String = "You came back. \n You always knew where to find me \n I called you. Do you remember? \n I just needed someone to stay. \n I'm not angry anymore."
var ending2text:String = "You always knew where to find me. \n I called you. Do you remember?"
var endtext



func _ready() -> void:
	super()
	uilayer.hide()


func interact():
	uilayer.show()
	var buttontext = $UI/Button
	buttontext.text = endtext
	await uilayer.visibility_changed
	audio_player.stop()
	

func _on_play_audio_area_body_entered(body: Node2D) -> void:
	audio_player.play()
	if player.foldercount == 5:
		endtext = ending1text
	else:
		endtext = ending2text
		



func _on_play_audio_area_body_exited(body: Node2D) -> void:
	uilayer.hide()


func _on_button_pressed() -> void:
	uilayer.hide()
	if player.foldercount == 5:
		pass #insert good end here
	else:
		endtimer.start()
		await endtimer.timeout
		get_tree().reload_current_scene()
