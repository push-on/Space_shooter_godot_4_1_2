extends Area2D

@export var SPEED: int = 200


func _physics_process(delta: float) -> void:
	global_position.y += SPEED * delta


func die() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	die()
