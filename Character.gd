extends KinematicBody2D

onready var sprite := $AnimatedSprite
const SPEED := 400.0
const HEALTH := 100.0
const DAMAGE := 5.0

var characterDir = "idle"

func _physics_process(delta: float) -> void:

	var direction := Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		sprite.flip_h = false
		characterDir = "right"
		sprite.play("Run")
		direction.x = 1.0

	elif Input.is_action_pressed("move_left"):
		sprite.flip_h = true
		characterDir = "left"
		sprite.play("Run")
		direction.x = -1.0

	elif Input.is_action_pressed("move_up"):
		direction.y = -1.0
		if characterDir == "right":
			sprite.flip_h = false
			sprite.play("Run")
		if characterDir == "left":
			sprite.flip_h = true
			sprite.play("Run")
	
	elif Input.is_action_pressed("move_right") and Input.is_action_pressed("move_up"):
		direction.x = 1
		direction.y = 1

	elif Input.is_action_pressed("move_down"):
		
		direction.y = 1.0
		
	else:
		$AnimatedSprite.play("Idle")
		characterDir = "idle"
		
	var velocity := direction * SPEED
	move_and_slide(velocity)
	
	var direction_key = direction.round()
	direction_key.x = abs(direction_key.x)


		
	
