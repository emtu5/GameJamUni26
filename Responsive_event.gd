extends Node2D

@export var firstdoor:Interactable
@export var secdoor:Interactable
var fucking:int = 0
@export var player:Node2D

func _ready() -> void:
	fucking = 0
	firstdoor.process_mode = Node.PROCESS_MODE_DISABLED
	firstdoor.visible = false
	secdoor.process_mode = Node.PROCESS_MODE_DISABLED
	secdoor.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	fucking +=1
	
	if fucking == 1: #spawn first door. add SFX/VFX here
		firstdoor.process_mode = Node.PROCESS_MODE_INHERIT
		firstdoor.visible = true
		return
	
	if fucking == 2 and player.hasFirstKey: #spawn second door. add SFX/VFX here
		firstdoor.process_mode = Node.PROCESS_MODE_DISABLED
		firstdoor.visible = false
		secdoor.process_mode = Node.PROCESS_MODE_INHERIT
		secdoor.visible = true
