extends Node2D

var lives: int = 3

@onready var player = $Spaeship


func _process(_delta: float) -> void:
	$ui/player_life.text = "Lives: " + str(lives)
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _on_eneme_unload_area_entered(area: Area2D) -> void:
	area.die()


func _on_spaeship_took_damage() -> void:
	if lives > 0:
		lives -= 1
	if lives == 0:
		player.die()
