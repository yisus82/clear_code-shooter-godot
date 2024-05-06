extends Node2D

const speed: int = 500

func _ready():
	pass


func _process(delta):
	# movement input
	var movement: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += movement * speed * delta

	# shooting input
	if Input.is_action_pressed("ui_select"):
		print("shoot laser")
