extends Node2D


const TREES := [
	#preload("res://Yellowtree2.tscn"),
	preload("res://Browntree.tscn"),
]


const CELL_SIZE := Vector2(32, 32)




func _ready() -> void:
	add_trees(9, 5)

func get_random_tree() -> Sprite:

	var tree_random_index := randi() % TREES.size()
	return TREES[tree_random_index].instance()
	

func add_trees(columns: int, rows: int) -> void:
	for column in range(columns):
		for row in range(rows):
			var cell := Vector2(column, row)
			var tree := get_random_tree()
			add_child(tree)
			tree.position = CELL_SIZE * cell
			var tree_size := tree.scale * tree.texture.get_size()
			var available_space := CELL_SIZE - tree_size
			var random_offset := Vector2(randf(), randf()) * available_space
			tree.position = CELL_SIZE * cell + random_offset
			
