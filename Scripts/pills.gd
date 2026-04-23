extends TextureRect

static var pills: Array = [
	preload("res://Textures/pills0.png"),
	preload("res://Textures/pills1.png"),
	preload("res://Textures/pills2.png")
]
var current_pills: int = -1

func set_pills(pill: int) -> void:
	if current_pills != pill:
		texture = pills[pill]
		current_pills = pill
