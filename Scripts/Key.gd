extends Interactable

enum KeyType {FIRST,SECOND,DUMMY}
@export var key_var:KeyType
@onready var audioplayer = $AudioStreamPlayer2D


func interact():
	audioplayer.play()
	overhead_text.text = "picked up a key!" 
	match key_var:
		KeyType.FIRST:
			player.hasFirstKey = true
			await audioplayer.finished
			queue_free()
		KeyType.SECOND:
			player.hasSecondKey = true
			await audioplayer.finished
			queue_free()
		KeyType.DUMMY:
			await audioplayer.finished
			queue_free()
	
