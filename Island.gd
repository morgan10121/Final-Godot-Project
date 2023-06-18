extends Node2D


const ROCKS := [
	preload("res://Tree1.tscn"),
	preload("res://Tree2.tscn"),
	#preload(),
]
onready var mask: TileMap = $TileMap
const CELL_SIZE := Vector2(128, 128)

func get_random_rock() -> Sprite:
	var rock_random_index := randi() % ROCKS.size()
	return ROCKS[rock_random_index].instance()
	
func add_rocks_on_grid() -> void:
#	for column in range(columns):
#		for row in range(rows):
#			var cell := Vector2(column, row)
#
#			var rock := get_random_rock()
#			add_child(rock)
#			rock.position = CELL_SIZE * cell
#
#			var rock_size := rock.scale * rock.texture.get_size()
#			var available_space := CELL_SIZE - rock_size
#			var random_offset := Vector2(randf(), randf()) * available_space
#			rock.position = CELL_SIZE * cell + random_offset
		for cell in mask.get_used_cells():
			var rock := get_random_rock()
			add_child(rock)
			var rock_size := rock.scale * rock.texture.get_size()
			var available_space := mask.cell_size - rock_size
			var random_offset := Vector2(randf(), randf()) * available_space
			rock.position = mask.position + mask.map_to_world(cell) + random_offset
		
func _ready() -> void:
	randomize()
	add_rocks_on_grid()
	mask.visible = false

func _process(delta):
	change_scene()

func _on_Scene2_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true


func _on_Scene2_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "Scene1":
			get_tree().change_scene("res://Map/Scene2.tscn")
			global.finish_change_scene()
