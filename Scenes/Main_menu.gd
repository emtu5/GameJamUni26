extends CanvasLayer
var gamescene = preload("res://stage_1.tscn")

func _ready():
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://stage_1.tscn")


func _on_end_pressed() -> void:
	get_tree().quit()
