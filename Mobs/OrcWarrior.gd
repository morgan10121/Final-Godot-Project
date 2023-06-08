extends Area2D

onready var sprite := $AnimatedSprite

var dead = false

func _process(_delta):
	if dead == false:
		sprite.play("Idle")


func _on_Area2D_area_entered(area):
	if area.is_in_group("Sword"):
		dead = true
		sprite.play("Death")


func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "Death":
		queue_free()
