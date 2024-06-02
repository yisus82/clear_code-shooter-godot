extends Area2D

var rotation_speed: int = 4
var types: Array[String] = ["laser", "laser", "laser", "laser", "laser", "grenade", "grenade", "health", "health", "health"]
var type: String = types[randi()%len(types)]

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color(0.1, 0.2, 0.8)
	elif type == "grenade":
		$Sprite2D.modulate = Color(0.1, 0.8, 0.1)
	elif type == "health":
		$Sprite2D.modulate = Color(0.8, 0.2, 0.1)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body: Node2D) -> void:
	if type == "health" and Globals.player_health == 100:
		return
	if "add_item" in body:
		body.add_item(type)
		queue_free()
