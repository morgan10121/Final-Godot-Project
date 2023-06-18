extends KinematicBody2D

onready var sprite := $AnimatedSprite

var speed = 100
var health = 100

var player_chase = false
var player = null
var in_combat = false
var is_alive = true

func _physics_process(delta):
	update_health() 
	if health <= 0 and is_alive == true:
		is_alive = false
		sprite.play("death")
		health = 0
		
	if player_chase and in_combat == false:
		position += (player.position - position)/speed
		sprite.play("walk")
		
		if(player.position.x - position.x) < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	else:
		if in_combat == false:
			sprite.play("idle")

func _on_detection_area_body_entered(body):
	sprite.play("spawn")
	if body.has_method("player"):
		player = body
		player_chase = true
	
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	
func enemy():
	pass

func _on_hit_box_area_entered(area):
	if area.is_in_group("Attack"):
		in_combat = true
		print(health)
		health -= 10
		sprite.play("hurt")
	
func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "hurt":
		in_combat = false
		
	if sprite.animation == "attack":
		in_combat = false
		
	if sprite.animation == "death":
		queue_free()
		get_tree().change_scene("res://Win_screen.tscn")

func _on_attack_range_body_entered(body):
	if body.has_method("player"):
		in_combat = true
		sprite.play("attack")


func update_health():
	var healthbar := $healthbar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else: 
		healthbar.visible = true
