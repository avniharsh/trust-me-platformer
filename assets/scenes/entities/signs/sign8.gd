extends Area2D

@export var text := "You went the wrong\nway from the start."
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
