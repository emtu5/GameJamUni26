extends Interactable

@export var teleport_location:Node2D
@export var isLocked:bool
enum RequiredKey {FIRST,SECOND}
@export var key_req:RequiredKey
@onready var audioplayeropen = $OpenAudio
@onready var audioplayerclose = $CloseAudio

func interact(): #returns for complete premature optimization
	if !isLocked:
		audioplayeropen.play()
		transition_player()
		await audioplayeropen.finished
		return #0.5ms improvement per 3 zile lucratoare 😎😎😎
	if isLocked:
		if player.hasFirstKey and key_req == RequiredKey.FIRST:
			audioplayeropen.play()
			transition_player() 
			await audioplayeropen.finished
			return
		else:
			audioplayerclose.play()
			overhead_text.text = "You are missing the right key!"			
			text_timer.start()
		if player.hasSecondKey and key_req == RequiredKey.SECOND:
			audioplayeropen.play()
			transition_player() 
			await audioplayeropen.finished
			return
		else:
			audioplayerclose.play()
			overhead_text.text = "You are missing the right key!"
			text_timer.start()

func transition_player():
	Fadeout.transition()
	await Fadeout.on_fadeout_finished
	player.position = teleport_location.global_position
