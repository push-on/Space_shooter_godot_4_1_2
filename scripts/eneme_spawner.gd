extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

var ENEME: PackedScene = preload("res://sceans/Characters/enemy.tscn")
var PATH_ENEMY: PackedScene = preload("res://sceans/Characters/path_enemy.tscn")
@onready var SPAWN_POS: Node = $spawn_position
var previous_spawn_pos: Node = null


func _on_timer_timeout() -> void:
	Spawn_Enemy()


func Spawn_Enemy() -> void:
	var spawn_pos_arr: Array = SPAWN_POS.get_children()
	var rand_spawn_pos: Node = spawn_pos_arr.pick_random()

	if rand_spawn_pos != previous_spawn_pos:
		var enemy_instance: Node = ENEME.instantiate()
		enemy_instance.global_position = rand_spawn_pos.global_position
		emit_signal("enemy_spawned", enemy_instance)
		previous_spawn_pos = rand_spawn_pos
	else:
		Spawn_Enemy()


func Spawn_Path_Enemy() -> void:
	var path_enemy_instance: Node = PATH_ENEMY.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)


func _on_timer_2_timeout() -> void:
	Spawn_Path_Enemy()
