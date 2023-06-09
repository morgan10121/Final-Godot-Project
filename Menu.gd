extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Start_pressed():
	get_tree().change_scene("res://Map/Scene1.tscn")



func _on_Quit_pressed():
	get_tree().quit()
