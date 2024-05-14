extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += speed * direction * delta
