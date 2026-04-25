extends Interactable

enum FolderText {FIRST,SECOND,THIRD,FOURTH,FIFTH}
@export var selectedText:FolderText
@onready var textlabel = $CanvasLayer/Panel/Label
@onready var uiNode = $CanvasLayer
@onready var audio_player = $AudioStreamPlayer2D
@onready var area = $Area2D/CollisionShape2D
@onready var sprite = $Sprite2D
var debug_txt = "res://FolderTexts/LOREM.txt"
var first_txt = "res://FolderTexts/FirstFile.txt"
var second_txt = "res://FolderTexts/SecondFile.txt"
var third_txt = "res://FolderTexts/ThirdFile.txt"
var fourth_txt = "res://FolderTexts/FourthFile.txt"
var fifth_txt = "res://FolderTexts/FifthFile.txt"
var folder_content
var interacted: bool = false

func _ready():
	super()
	uiNode.hide()

func interact():
	overhead_text.text = "picked up a folder!"
	uiNode.show()
	audio_player.play()
	match selectedText:
		FolderText.FIRST:
			textlabel.text = get_fucking_text(first_txt)
		FolderText.SECOND:
			textlabel.text = get_fucking_text(second_txt)
		FolderText.THIRD:
			textlabel.text = get_fucking_text(third_txt)
		FolderText.FOURTH:
			textlabel.text = get_fucking_text(fourth_txt)
		FolderText.FIFTH:
			textlabel.text = get_fucking_text(fifth_txt)
	get_tree().paused = true
	
	
func get_fucking_text(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content


func _on_button_pressed() -> void:
	if !interacted:
		interacted = true
		player.foldercount += 1
		area.disabled = true
		sprite.visible = false
	uiNode.hide()
	get_tree().paused = false
	audio_player.play()
	await audio_player.finished
	
	get_tree().paused = false
	queue_free()
	
