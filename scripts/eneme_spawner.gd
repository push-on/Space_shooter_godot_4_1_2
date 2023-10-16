extends Node2D

var ENEME: PackedScene = preload("res://sceans/Characters/enemy.tscn")
@onready var SPAWN_POS: Node = $spawn_position


func _on_timer_timeout() -> void:
	Spawn_Enemy()


func Spawn_Enemy() -> void:
	var spawn_pos_arr: Array = SPAWN_POS.get_children()
	var rand_spawn_pos: Node = spawn_pos_arr.pick_random()
	var enemy_instance: Node = ENEME.instantiate()
	# enemy_instance.global_position = global_position
	rand_spawn_pos.add_child(enemy_instance)
