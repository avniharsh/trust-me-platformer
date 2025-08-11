extends Area2D

var checkpoint_manager
var player
var stopped = Global.dead_stop

func _ready() -> void:
	checkpoint_manager = get_node("/root/Main/2DScene/CheckpointManager")
	player = get_node("/root/Main/2DScene/Player")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		kill_player()
		
func kill_player():
	
	player.global_position = checkpoint_manager.last_location
	player.velocity = Vector2.ZERO
	#$deathsound.play()

	
