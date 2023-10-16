extends Area2D

@export var SPEED: int = 5
@onready var visible_notifier = $VisibleNotifier


func _ready() -> void:
	visible_notifier.connect("screen_exited", queue_free)


func _physics_process(delta: float) -> void:
	global_position.y -= SPEED * delta * 100


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.die()
