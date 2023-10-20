extends Path2D

@onready var path_follow: PathFollow2D = $PathFollow2D
@onready var enemy: Node2D = $PathFollow2D/enemy


func _ready() -> void:
	path_follow.set_progress_ratio(0)


func _process(delta: float) -> void:
	path_follow.progress_ratio += 0.30 * delta
	if path_follow.progress_ratio == 1:
		queue_free()
