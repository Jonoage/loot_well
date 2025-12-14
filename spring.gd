extends Area2D

@export var bounce_force = -1450


func _on_body_entered(body):
	if body is CharacterBody2D:
		body.velocity.y = bounce_force  # instant upward launch
