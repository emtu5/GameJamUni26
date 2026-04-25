extends Node2D
@export var entrydoor:Interactable
@export var exitdoor:Interactable
@export var folder:Interactable


func _ready():
	exitdoor.process_mode = Node.PROCESS_MODE_DISABLED
	exitdoor.visible = false
	


func _on_folder_1_tree_exited() -> void:
	exitdoor.process_mode = Node.PROCESS_MODE_INHERIT
	exitdoor.visible = true
	entrydoor.process_mode = Node.PROCESS_MODE_DISABLED
	entrydoor.visible = false
