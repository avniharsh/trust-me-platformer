extends Node2D

var last_location
@onready var player = get_node("/root/Main/2DScene/Player")

func _ready():
	last_location = player.global_position
