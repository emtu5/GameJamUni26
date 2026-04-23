extends Interactable

enum FolderText {FIRST,SECOND,THIRD,FOURTH,FIFTH}
@export var selectedText:FolderText
@onready var textlabel = $CanvasLayer/Panel/Button
@onready var uiNode = $CanvasLayer
var debug_txt = "res://FolderTexts/LOREM.txt"
var first_txt = "res://FolderTexts/FirstFile.txt"
var second_txt = "res://FolderTexts/SecondFile.txt"
var third_txt = "res://FolderTexts/ThirdFile.txt"
var fourth_txt = "res://FolderTexts/FourthFile.txt"
var fifth_txt = "res://FolderTexts/FifthFile.txt"
var folder_content

func _ready():
	super()
	uiNode.hide()

func interact():
	overhead_text.text = "picked up a folder!"
	player.foldercount += 1
	uiNode.show()
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
	
	
func get_fucking_text(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content


func _on_button_pressed() -> void:
	uiNode.hide()
	queue_free()
