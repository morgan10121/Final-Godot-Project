extends Node

var has_gem = false

var current_scene = "Scene1"
var transition_scene = false

var player_exit_posx = 0
var player_exit_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_change_scene():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "Scene1":
			current_scene = "Scene2"
		else:
			current_scene = "Scene1"
