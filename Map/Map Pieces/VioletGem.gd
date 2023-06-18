extends Area2D

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	global.has_gem

func _on_body_entered(body: Node) -> void:
	queue_free()
	global.has_gem = true
