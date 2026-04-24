extends Node2D
@onready var audioplayer = $AudioStreamPlayer2D
@export_category("Ambience Sounds")
@export var BGAOne:AudioStreamMP3
@export var BGATwo:AudioStreamMP3
@export var BGAThree:AudioStreamMP3
@onready var streams: Array[AudioStreamMP3] = [BGAOne, BGATwo, BGAThree]

func _ready() -> void:
	play_random_BGA()
	
func play_random_BGA():
	var rnd = randi_range(0,2)
	var current_pick = streams[rnd]
	print(rnd)
	print(current_pick)
	audioplayer.stream = current_pick
	audioplayer.play()
	await audioplayer.finished

func stop() -> void:
	print("alooooooooooooa")
	print(audioplayer)
	print(audioplayer.playing)
	audioplayer.stop()
	print(audioplayer.playing)
