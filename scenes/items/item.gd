extends Area2D

var direction: Vector2
var distance: int = randi_range(150, 250)
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
	var target_position: Vector2 = position + direction * distance
	var tween: Tween = create_tween()
	tween.set_parallel()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3).from(Vector2(0, 0))
	tween.tween_property(self, "position", target_position, 0.5)

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	if type == "health" and Globals.health == 100:
		return
	if type == "laser":
		Globals.laser_amount += 10
	elif type == "grenade":
		Globals.grenade_amount += 5
	elif type == "health":
		Globals.health += 25
	queue_free()
