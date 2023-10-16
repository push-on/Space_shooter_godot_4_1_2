extends CharacterBody2D

signal took_damage

@onready var Lasers: Node = $Lasers
const SPEED: int = 300
var LASER: PackedScene = preload("res://sceans/Characters/laser.tscn")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()


func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, 0)

	if Input.is_action_pressed("up") || Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("down") || Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	if Input.is_action_pressed("left") || Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("right") || Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	move_and_slide()

	global_position = global_position.clamp(Vector2(0, 0), get_viewport_rect().size)


func shoot() -> void:
	var LASER_INSTANCE: Node = LASER.instantiate()
	LASER_INSTANCE.global_position = global_position
	LASER_INSTANCE.global_position.y -= 50
	Lasers.add_child(LASER_INSTANCE)


func take_damage() -> void:
	emit_signal("took_damage")


func die() -> void:
	queue_free()
