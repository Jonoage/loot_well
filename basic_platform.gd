extends StaticBody2D

@export var one_way := true

func _ready():
	if one_way:
		# Enable one-way collision (can jump up through, land on top)
		collision_layer = 1
		collision_mask = 1
		# Find the collision shape and enable one-way
		for child in get_children():
			if child is CollisionShape2D:
				child.one_way_collision = true
