extends Node2D

@onready var audioplayer = $AudioStreamPlayer2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	audioplayer.play()
