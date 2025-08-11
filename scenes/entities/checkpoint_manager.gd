extends Node2D

var last_location
@onready var player = get_node("/root/Main/2DScene/Player")

func _ready():
	# await get_tree().create_timer(3.25).timeout
	last_location = player.global_position
