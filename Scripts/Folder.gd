extends Interactable

func interact():
	#TODO play pickup sound
	overhead_text.text = "picked up a folder!"
	player.foldercount += 1
	queue_free()
