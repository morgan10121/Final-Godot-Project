extends KinematicBody2D

onready var sprite := $AnimatedSprite

const SPEED = 180.0
var health = 100

var characterDir = "right"
var inCombat = false
var enemy_in_range = false
var enemy_cooldown = true
var is_alive = true

func _physics_process(delta: float) -> void:
	player_movement()
	player_attack()
	orc_warrior_attack()
	
	if health <= 0:
		is_alive = false
		health = 0
		self.queue_free()
		
		
func player_movement():	
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if Input.is_action_pressed("move_right") and inCombat == false:
		sprite.flip_h = false
		characterDir = "right"
		sprite.play("Run")

	elif Input.is_action_pressed("move_left") and inCombat == false:
		sprite.flip_h = true
		characterDir = "left"
		sprite.play("Run")
		
	elif Input.is_action_pressed("move_up") and inCombat == false:
		sprite.play("Run")
		
	elif Input.is_action_pressed("move_down") and inCombat == false:
		sprite.play("Run")

	else:
		if inCombat == false:
			sprite.play("Idle")

	var velocity := direction * SPEED
	move_and_slide(velocity)
	
func player_attack():
	if Input.is_action_just_pressed("attack1"):
		sprite.play("Attack")
		inCombat = true
		if characterDir == "right":
			$AttackArea/CollisionShape2D.disabled = false
		if characterDir == "left":
			$AttackArea/CollisionShape2D2.disabled = false

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "Attack" and characterDir == "right":
		$AttackArea/CollisionShape2D.disabled = true
		inCombat = false
		
	elif sprite.animation == "Attack" and characterDir == "left":
		$AttackArea/CollisionShape2D2.disabled = true
		inCombat = false
		
	if sprite.animation == "Hurt":
		inCombat = false
			
func player():
	pass

func _on_hit_box_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_range = true
		
func _on_hit_box_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_range = false
		
func orc_warrior_attack():
	if enemy_in_range and enemy_cooldown == true:
		inCombat = true
		sprite.play("Hurt")
		health -= 10
		enemy_cooldown = false
		$attack_cooldown.start()
		print(health)

func _on_attack_cooldown_timeout():
	enemy_cooldown = true

