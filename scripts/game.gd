extends Node2D

var lives: int = 3
var score: int = 0

@onready var player: Node = $Spaeship
@onready var hud: Node = $UI/HUD
@onready var ui: Node = $UI
@onready var enemy_hit_sound: Node = $sounds/enemy_hit_sound
@onready var player_hit_sound: Node = $sounds/player_take_damage
@onready var music: Node = $sounds/Menu
var GameOver: PackedScene = preload("res://sceans/UserInterface/game_over_screan.tscn")


func _ready() -> void:
	hud.set_score_lable(score)
	hud.set_lives_lable(lives)
	music.play()


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _on_eneme_unload_area_entered(area: Area2D) -> void:
	area.queue_free()


func _on_eneme_spawner_enemy_spawned(enemy_instance: Node) -> void:
	enemy_instance.connect("died", _on_enemy_dided)
	add_child(enemy_instance)


func _on_spaeship_took_damage() -> void:
	if lives > 0:
		lives -= 1
		player_hit_sound.play()
		hud.set_lives_lable(lives)

	if lives == 0:
		player.die()
		await get_tree().create_timer(0.5).timeout
		var game_over: Node = GameOver.instantiate()
		game_over.set_score(score)
		ui.add_child(game_over)


func _on_enemy_dided():
	if lives > 0:
		score += 100
		enemy_hit_sound.play()
		hud.set_score_lable(score)


func _on_eneme_spawner_path_enemy_spawned(path_enemy_instance) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_dided)
