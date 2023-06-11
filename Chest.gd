extends StaticBody2D


var opened = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_detection_area_area_entered(area):
	if opened == false:
		$AnimatedSprite.play("default")
		opened = true

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("opened")
