extends Area2D

onready var sprite := $AnimatedSprite

var SPEED = 100
var HEALTH = 25
var DAMAGE = 3

var player_chase = false
var player = null
var mob_attacked = false

func _process(_delta):
	if player_chase and mob_attacked == false:
		position += (player.position - position)/SPEED
		sprite.play("Walk")
		
		if(player.position.x - position.x) < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	
	if player_chase == false and mob_attacked == false:	
		sprite.play("Idle")

func _on_Area2D_area_entered(area):
	if area.is_in_group("Attack"):
		mob_attacked = true
		
		if HEALTH == 0:
			sprite.play("Death")
	
		else:
			sprite.play("Hurt")
			HEALTH -= 5
			mob_attacked = false

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "Death":
		queue_free()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

