extends Area2D

@export var text := "We wish you\nthe best of luck,\nPlayer."
@onready var label = $Label

func _ready() -> void:
	label.hide()
	label.text = text

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		label.show()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		label.hide()
