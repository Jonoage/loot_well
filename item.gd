extends Area2D
@export var item_name: String = "Item"
@export var item_type: String = "collectible"  # "collectible", "weapon", "consumable", etc.
@export var pickup_range: float = 50.0

var in_world := true  # Whether item is on the ground or in inventory

func _ready():
	add_to_group("items")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player") and in_world:
		if body.inventory.add_item(self):
			in_world = false
			hide()
			set_physics_process(false)
			# Don't queue_free yet - item stays in memory in inventory
			

func drop_at_position(pos: Vector2):
	"""Drop this item at a specific world position"""
	global_position = pos
	in_world = true
	show()
	set_physics_process(true)
	get_tree().get_first_node_in_group("items_container").add_child(self)

func get_display_name() -> String:
	return item_name
