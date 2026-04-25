extends Interactable
@onready var audio_player = $AudioStreamPlayer2D
@onready var uilayer = $UI
@onready var endtimer = $Timer
@export var endingonesound:AudioStreamMP3
@export var endingtwosound:AudioStreamMP3
@export var bg_player: Node2D

static var calls: Dictionary = {
	"ring": preload("res://Sounds/AUDIO_telefon.mp3"),
	"pickup": preload("res://Sounds/AUDIO_call_start.mp3"),
	"end": preload("res://Sounds/AUDIO_call_end.mp3")
}


#string -> array, fadeout
var ending1text:String = "You came back. \n You always knew where to find me \n I called you. Do you remember? \n I just needed someone to stay. \n I'm not angry anymore."
var ending2text:String = "You always knew where to find me. \n I called you. Do you remember?"
var endtext



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
	buttontext.text = endtext
	await uilayer.visibility_changed
	audio_player.stop()
	

func _on_play_audio_area_body_entered(body: Node2D) -> void:
	audio_player.stop()
	var stream = calls["ring"]
	audio_player.stream = stream
	audio_player.play()
	
	if player.foldercount == 5:
		endtext = ending1text
	else:
		endtext = ending2text
		

#manole was here 😎
func _on_play_audio_area_body_exited(body: Node2D) -> void:
	uilayer.hide()
	player.ui.hide()
	bg_player.stop()
	audio_player.stop()
	var stream = calls["end"]
	audio_player.stream = stream
	audio_player.play()
	
	if player.foldercount == 5 and player.gotfirstphone:
		audio_player.stream = endingonesound
		audio_player.play()
		Fadeout.end1()
		#THIS IS THE GOOD END
	else:
		player.is_alive = false
		player.cam.vignette_shader()
		player.cam.normal_shader()
		print("exited")
		endtimer.start()
		Fadeout.end2_1()
		await Fadeout.anim_player.animation_finished
		audio_player.stream = endingtwosound
		audio_player.play()
		Fadeout.end2_2()
		await endtimer.timeout
		get_tree().reload_current_scene()
		#THIS IS THE BAD END

func _on_button_pressed() -> void:
	uilayer.hide()
	player.ui.hide()
	bg_player.stop()
	audio_player.stop()
	var stream = calls["end"]
	audio_player.stream = stream
	audio_player.play()
	
	if player.foldercount == 5 and player.gotfirstphone:
		audio_player.stream = endingonesound
		audio_player.play()
		Fadeout.end1()
		#THIS THE GOOD END
	else:
		player.is_alive = false
		player.cam.vignette_shader()
		player.cam.normal_shader()
		endtimer.start()
		Fadeout.end2_1()
		await Fadeout.anim_player.animation_finished
		audio_player.stream = endingtwosound
		audio_player.play()
		Fadeout.end2_2()
		await endtimer.timeout
		get_tree().reload_current_scene()
		#THIS IS THE BAD END


func forced_bad_end() -> void:
	uilayer.hide()
	player.ui.hide()
	bg_player.stop()
	endtimer.start()
	Fadeout.end2_1()
	await Fadeout.anim_player.animation_finished
	audio_player.stream = endingtwosound
	audio_player.play()
	Fadeout.end2_2()
	await endtimer.timeout
	get_tree().reload_current_scene()
	#THIS IS THE BAD END
