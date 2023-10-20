extends Control


func set_score(new_score):
	$panel/Your_Score.text = "Your Score: " + str(new_score)


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
