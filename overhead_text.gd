extends RichTextLabel


func _on_text_timer_timeout() -> void:
	print("clear text")
	text = ""
