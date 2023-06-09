extends Area2D

onready var sprite := $AnimatedSprite

var SPEED = 100.0
var HEALTH = 25.0
#DAMAGE is 5.0

var player_chase = false
var player = null
var mob_attacked = false
var characterDir = "left"
var isAttacking = false
var alive = true

func _process(_delta):
	if player_chase and mob_attacked == false and isAttacking == false: 
		position += (player.position - position)/SPEED
		sprite.play("Walk")
		
		if(player.position.x - position.x) < 0:
			sprite.flip_h = true
			characterDir = "right"
		else:
			sprite.flip_h = false
			characterDir = "left"
	
	if player_chase == false and mob_attacked == false and isAttacking == false:	
		sprite.play("Idle")

func _on_Area2D_area_entered(area):
	if area.is_in_group("Attack"):
		mob_attacked = true
		
		if HEALTH >= 0:
			alive = false
			sprite.play("Death")
	
		else:
			HEALTH -= 5.0
			mob_attacked = false

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "Attack" and characterDir == "right":
		isAttacking = false
		
	elif sprite.animation == "Attack" and characterDir == "left":
		isAttacking = false
		
	elif sprite.animation == "Death":
		queue_free()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


func _on_attack_area_body_entered(body):
	if alive == true:
		sprite.play("Attack")
		isAttacking = true
		if characterDir == "right":
			$attack_area/CollisionShape2D.disabled = false
		if characterDir == "left":
			$attack_area/CollisionShape2D2.disabled = false
	
