extends KinematicBody2D

onready var sprite := $Godot
const SPEED := 700.0

const DIRECTION_TO_FRAME := {
	Vector2.DOWN: 0,
	Vector2.RIGHT: 2,
	Vector2.UP: 4,
}

func _physics_process(delta: float) -> void:

	var direction := Vector2.ZERO

	if Input.is_action_pressed("move_right"):

		direction.x = 1.0

	elif Input.is_action_pressed("move_left"):

		direction.x = -1.0

	elif Input.is_action_pressed("move_up"):

		direction.y = -1.0

	elif Input.is_action_pressed("move_down"):

		direction.y = 1.0
		
	var velocity := direction * SPEED
	move_and_slide(velocity)
	
	var direction_key = direction.round()
	direction_key.x = abs(direction_key.x)
	
	if direction_key in DIRECTION_TO_FRAME:

		sprite.frame = DIRECTION_TO_FRAME[direction_key]
		sprite.flip_h = sign(direction.x) == -1
