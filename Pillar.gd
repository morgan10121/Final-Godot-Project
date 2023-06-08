extends StaticBody2D

onready var sprite := $AnimatedSprite

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	global.has_gem

func _on_body_entered(body: Node) -> void:
	sprite.play("default")
