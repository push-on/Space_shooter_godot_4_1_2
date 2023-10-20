extends Control

@onready var score: Label = $score
@onready var lives: Label = $lives


func set_lives_lable(value: int) -> void:
	lives.text = "Lives: " + str(value)


func set_score_lable(value: int) -> void:
	score.text = "Score: " + str(value)
