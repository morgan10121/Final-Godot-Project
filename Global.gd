extends Node

var has_gem = false

var current_scene = "world"
var transition_scene = false

var player_exit_posx = 0
var player_exit_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_chnge_scene():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "FirstScene":
			current_scene = "Scene2"
		else:
			current_scene = "FirstScene"
