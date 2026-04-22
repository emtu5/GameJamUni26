extends Interactable

@export var teleport_location:Node2D
@export var isLocked:bool
enum RequiredKey {FIRST,SECOND}
@export var key_req:RequiredKey

func interact(): #returns for complete premature optimization
	if !isLocked:
		transition_player()
		#TODO play open sound
		return #0.5ms improvement per 3 zile lucratoare 😎😎😎
	if isLocked:
		if player.hasFirstKey and key_req == RequiredKey.FIRST:
			#play open sound
			transition_player() 
			return
		else:
			#play locked door sound
			overhead_text.text = "you are missing the key!"
		if player.hasSecondKey and key_req == RequiredKey.SECOND:
			#play open sound
			transition_player() 
			return
		else:
			#play locked door sound
			overhead_text.text = "you are missing the key!"

func transition_player():
	Fadeout.transition()
	await Fadeout.on_fadeout_finished
	player.position = teleport_location.position
