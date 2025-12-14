# ===== ROPE.GD =====
# Attach to Area2D root node
extends Area2D

@export var rope_length := 400.0
@export var rope_color := Color(0.6, 0.4, 0.2)
@export var rope_thickness := 4.0

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Create visual rope
	var line = Line2D.new()
	line.add_point(Vector2(0, 0))
	line.add_point(Vector2(0, rope_length))
	line.default_color = rope_color
	line.width = rope_thickness
	line.z_index = -1
	add_child(line)
	
	# Create collision shape for rope
	var collision = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = Vector2(20, rope_length)
	collision.shape = rect
	collision.position = Vector2(0, rope_length / 2)
	add_child(collision)

func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("grab_rope"):
		body.grab_rope(self)

func _on_body_exited(body):
	if body.is_in_group("player") and body.has_method("release_rope"):
		body.release_rope()
