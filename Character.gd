extends KinematicBody2D

onready var sprite := $AnimatedSprite

const SPEED = 250.0
var health = 100
var characterDir = "right"
var isAttacking = false

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if Input.is_action_pressed("move_right") and isAttacking == false:
		sprite.flip_h = false
		characterDir = "right"
		sprite.play("Run")
		
	elif Input.is_action_pressed("move_left") and isAttacking == false:
		sprite.flip_h = true
		characterDir = "left"
		sprite.play("Run")
		
	elif Input.is_action_pressed("move_up") and isAttacking == false:
		sprite.play("Run")
		
	elif Input.is_action_pressed("move_down") and isAttacking == false:
		sprite.play("Run")

	else:
		if isAttacking == false:
			sprite.play("Idle")
			
	if Input.is_action_just_pressed("attack1"):
		sprite.play("Attack")
		isAttacking = true
		if characterDir == "right":
			$AttackArea/CollisionShape2D.disabled = false
		if characterDir == "left":
			$AttackArea/CollisionShape2D2.disabled = false

	var velocity := direction * SPEED
	move_and_slide(velocity)

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "Attack" and characterDir == "right":
		$AttackArea/CollisionShape2D.disabled = true
		isAttacking = false
		
	elif sprite.animation == "Attack" and characterDir == "left":
		$AttackArea/CollisionShape2D2.disabled = true
		isAttacking = false


func _on_hit_box_area_entered(area):
	if area.is_in_group("Attack1"):
		if health == 0:
			sprite.play("Death")
		else:
			health -= 10
			
func player():
	pass

