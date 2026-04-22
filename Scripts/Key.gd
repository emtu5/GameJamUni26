extends Interactable

enum KeyType {FIRST,SECOND}
@export var key_var:KeyType


func interact():
	#TODO play pickup sound
	overhead_text.text = "picked up a key!" 
	match key_var:
		KeyType.FIRST:
			player.hasFirstKey = true
			queue_free()
		KeyType.SECOND:
			player.hasSecondKey = true
			queue_free()
	
