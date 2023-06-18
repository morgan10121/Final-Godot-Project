extends Node2D


const ROCKS := [
	preload("res://Tree1.tscn"),
	preload("res://Tree2.tscn"),
	#preload(),
]

const CELL_SIZE := Vector2(128, 128)

func get_random_rock() -> Sprite:
	var rock_random_index := randi() % ROCKS.size()
	return ROCKS[rock_random_index].instance()
	
func add_rocks_on_grid(columns: int, rows: int) -> void:
	for column in range(columns):
		for row in range(rows):
			var cell := Vector2(column, row)

			var rock := get_random_rock()
			add_child(rock)
			rock.position = CELL_SIZE * cell
			
			var rock_size := rock.scale * rock.texture.get_size()
			var available_space := CELL_SIZE - rock_size
			var random_offset := Vector2(randf(), randf()) * available_space
			rock.position = CELL_SIZE * cell + random_offset
			
func _ready() -> void:
	randomize()
	add_rocks_on_grid(9, 5)
