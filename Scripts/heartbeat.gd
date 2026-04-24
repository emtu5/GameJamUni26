extends AudioStreamPlayer2D

static var heartbeats: Dictionary = {
	"normal": preload("res://Sounds/AUDIO_heartbeat_lent.mp3"),
	"stressed": preload("res://Sounds/AUDIO_heartbeat_mediu.mp3"),
	"nauseous": preload("res://Sounds/AUDIO_heartbeat_alert.mp3")
}
var current_beat: String = ""

func play_heartbeat(beat_name: String) -> void:
	if current_beat != beat_name:
		stream = heartbeats[beat_name]
		print(stream)
		current_beat = beat_name
		play()
