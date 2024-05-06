extends Node2D

const speed: int = 500

func _ready():
	pass


func _process(delta):
	# movement input
	var movement: Vector2 = Input.get_vector("left", "right", "up", "down")
	position += movement * speed * delta

	# shooting input
	if Input.is_action_pressed("fire1"):
		print("shoot laser")
	if Input.is_action_pressed("fire2"):
		print("shoot grenade")
