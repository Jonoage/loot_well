extends TileMapLayer

@export var atlas_id := 2
@export var atlas_tile := Vector2i(22, 3)
@export var level_width_tiles := 120
@export var level_height_tiles := 100
@export var spacing_min := 4
@export var spacing_max := 7
@export var platform_chance := 0.4
@export var max_width := 6
@export var min_width := 3
@export var spring_scene: PackedScene
@export var spring_chance := 0.2  # 20% chance per platform
@export var tilemap: TileMap
@export var spawn_chance := 0.2 # 20% chance per platform
#
func _ready():
	randomize()
	var y = 0
	while y < level_height_tiles:
		if randf() < platform_chance:
			var length = randi() % max_width + min_width
			var x_start = randi() % (level_width_tiles - length)
			for i in range(length):
				set_cell(Vector2i(x_start + i, y), atlas_id, atlas_tile, 0)
		y += randi_range(spacing_min, spacing_max)
		spawn_platform_objects()
		
		


func spawn_platform_objects():
	var used_cells = get_used_cells()
	for cell in used_cells:
		if is_platform_tile(cell):
			if randf() < spawn_chance:
				spawn_at(cell)

func is_platform_tile(cell: Vector2i) -> bool:
	return get_cell_source_id(cell) != -1

func spawn_at(cell: Vector2i):
	var obj = spring_scene.instantiate()
	# map_to_local gives the cell center in local space
	var local_pos = map_to_local(cell)
	obj.position = to_global(local_pos)
	get_parent().add_child(obj)
