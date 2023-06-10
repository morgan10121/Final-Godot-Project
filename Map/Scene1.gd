extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
			get_tree().change_scene_to_file("res://Map/Scene2.tscn")
			global.finish_change_scene()
