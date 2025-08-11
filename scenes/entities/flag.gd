extends Area2D

var checkpoint_manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	checkpoint_manager = get_node("/root/Main/2DScene/CheckpointManager") # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		checkpoint_manager.last_location = $RespawnPoint.global_position
		$CheckpointHit.play()
