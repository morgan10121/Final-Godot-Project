extends KinematicBody2D


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

const DIRECTION_TO_FRAME := {
	Vector2.DOWN: 0,
	Vector2.RIGHT: 2,
	Vector2.UP: 4,
}
