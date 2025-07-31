extends Area2D

var checkpoint_manager
var player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	checkpoint_manager = get_node("/root/Main/2DScene/CheckpointManager")
	player = get_node("/root/Main/2DScene/Player")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		kill_player()
		
func kill_player():
	await get_tree().create_timer(0.2).timeout
	player.global_position = checkpoint_manager.last_location
	player.velocity = Vector2.ZERO
